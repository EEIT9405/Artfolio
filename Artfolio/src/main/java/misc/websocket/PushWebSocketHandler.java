package misc.websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.SortedSet;
import java.util.TreeSet;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import model.favorite.FavoriteBean;
import model.member.MemberBean;
import model.tag.TagBean;
import model.tag.TagService;
import model.work.WorkBean;

//控制Client連結、message的中繼
@Component
public class PushWebSocketHandler extends TextWebSocketHandler {

	@Autowired
	private TagService tagService;
	// 儲存連接中的Client
	private static final Map<MemberBean, WebSocketSession> userSocketSessionMap;

	static {
		userSocketSessionMap = new ConcurrentHashMap<MemberBean, WebSocketSession>();
	}

	// Client建立連接
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		MemberBean user = (MemberBean) session.getAttributes().get("user");
		if (user != null) {
			System.out.println("user connect=" + user.getName());
			userSocketSessionMap.put(user, session);
		}
	}

	// Client中斷連接
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		MemberBean user = (MemberBean) session.getAttributes().get("user");
		if (user != null){
			System.out.println("user unconnect="+user.getName());
			userSocketSessionMap.remove(user);
		}
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		if (message.getPayloadLength() == 0)
			return;
		System.out.println("handleTextMessage");
		sendMessage(message);
	}

	// 判斷傳入之圖片
	private void sendMessage(TextMessage message) throws IOException {
		if (!userSocketSessionMap.isEmpty()) {
			System.out.println("userSocketSessionMap is not empty.");
			// 將message(json)轉回WrokBean/list物件
			ObjectMapper mapper = new ObjectMapper();
			// WorkBean workBean =
			// mapper.readValue(message.getPayload().toString(),
			// WorkBean.class);
			List<WorkBean> workList = mapper.readValue(message.getPayload().toString(),
					mapper.getTypeFactory().constructParametricType(ArrayList.class, WorkBean.class));
			
			for (WorkBean workBean : workList) {
				// 取得此bean所有tag
				List<TagBean> tags = tagService.getTags(workBean.getWid());
				if (tags != null && !tags.isEmpty()) {
					System.out.println("tags are not empty.");
					Iterator<Map.Entry<MemberBean, WebSocketSession>> iterator = userSocketSessionMap.entrySet()
							.iterator();
					
					nextUser:
					while (iterator.hasNext()) {
						Map.Entry<MemberBean, WebSocketSession> entry = iterator.next();
						if("Admin".equals(entry.getKey().getName())){
							entry.getValue().close();
						}
						//如果不是自己上傳的作品才繼續
						if (!workBean.getMid().equals(entry.getKey().getMid()) && !"Admin".equals(entry.getKey().getName())) {

							// 取得user的所有看過的標籤
							SortedSet<FavoriteBean> set = entry.getKey().getFavorites();
							SortedSet<FavoriteBean> favorites = new TreeSet<>(set);
							HashSet<FavoriteBean> topFavo = new HashSet<>();
							
							// 取得前三喜歡標籤
							if(favorites != null && !favorites.isEmpty()){
								FavoriteBean first = favorites.first();
								System.out.println("first="+first.getTag());
								topFavo.add(first);
								favorites.remove(first);
								if(!favorites.isEmpty()){
									FavoriteBean second = favorites.first();
									System.out.println("second="+second.getTag());
									topFavo.add(second);
									favorites.remove(second);
								}
								if(!favorites.isEmpty()){
									topFavo.add(favorites.first());
									System.out.println("third="+favorites.first().getTag());
								}	
							}
							System.out.println(entry.getKey().getName() + " topFavorite=" + topFavo.size());
							// 如此workBean包含user喜歡的標籤，就push
							for (FavoriteBean fb : topFavo) {
								String ftag = fb.getTag();
								for (TagBean tagBean : tags) {
									System.out.println("tag="+tagBean.getTag());
									if (ftag.equals(tagBean.getTag())) {
										System.out.println("send message");
										TextMessage msg = new TextMessage(
												new ObjectMapper().writeValueAsString(workBean));
										entry.getValue().sendMessage(msg);
										continue nextUser;
									}
								}
							}
						}
					}
				}
			}
		}
	}
}
