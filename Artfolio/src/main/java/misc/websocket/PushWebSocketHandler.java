package misc.websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
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
		if (user != null)
			userSocketSessionMap.put(user, session);
	}

	// Client中斷連接
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		MemberBean user = (MemberBean) session.getAttributes().get("user");
		if (user != null)
			userSocketSessionMap.remove(user);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		if (message.getPayloadLength() == 0)
			return;
		sendMessage(message);
	}

	//判斷傳入之圖片
	private void sendMessage(TextMessage message) throws IOException {
		if (!userSocketSessionMap.isEmpty()) {
			//將message(json)轉回WrokBean物件
			ObjectMapper mapper = new ObjectMapper();
			WorkBean workBean = mapper.readValue(message.getPayload().toString(), WorkBean.class);
			//List<WorkBean> workList = mapper.readValue(message.getPayload().toString(), mapper.getTypeFactory().constructParametricType(ArrayList.class, WorkBean.class));
			//取得此bean所有tag
			List<TagBean> tags = tagService.getTags(workBean.getWid());
			//for(WorkBean workBean: workList){
				//List<TagBean> tags = tagService.getTags(workBean.getWid());
			if (tags != null && !tags.isEmpty()) {
				Iterator<Map.Entry<MemberBean, WebSocketSession>> iterator = userSocketSessionMap.entrySet().iterator();
				while (iterator.hasNext()) {
					Map.Entry<MemberBean, WebSocketSession> entry = iterator.next();
					//取得user的所有看過的標籤
					TreeSet<FavoriteBean> favorites = (TreeSet<FavoriteBean>) entry.getKey().getFavorites();
					HashSet<FavoriteBean> topFavo = new HashSet<>();
					//取得前三喜歡標籤
					if (favorites != null && !favorites.isEmpty()) {
						topFavo.add(favorites.pollFirst());
						if (!favorites.isEmpty()) {
							topFavo.add(favorites.pollFirst());
						}
						if (!favorites.isEmpty()) {
							topFavo.add(favorites.pollFirst());
						}
					}
					//如此workBean包含user喜歡的標籤，就push
					for (FavoriteBean fb : topFavo) {
						String ftag = fb.getTag();
						for (TagBean tagBean : tags) {
							if(ftag.equals(tagBean.getTag())){
								entry.getValue().sendMessage(message);
								//entry.getValue().sendMessage(new TextMessage(mapper.writeValueAsString(workBean)));
							}
						}
					}
				}
			}
		//}
		}
	}
}
