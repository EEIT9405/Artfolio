package controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import model.bmsg.BmsgBean;
import model.bmsg.BmsgService;
import model.bounty.BountyBean;
import model.bounty.BountyService;
import model.bounty.BountyTagBean;
import model.bounty.BountyTrackBean;
import model.bounty.BountyTrackService;
import model.member.MemberBean;
import model.member.MemberService;

@Controller
public class BountyController {
	SimpleDateFormat sdf;
	public BountyController() {
		sdf = new SimpleDateFormat("yyyy-MM-dd hh:MM:ss");
	}
	@Autowired
	private ServletContext apllication;
	@Autowired
	private BountyService bountyService;
	@Autowired
	private BountyTrackService bountyTrackService;
	@Autowired
	private BmsgService bmsgService;
	@Autowired
	private MemberService memberService;

	// ============活動頁面=========================================================================================================	
	// 活動主頁呈現
	@RequestMapping(path = { "/bounty/display.controller" }, method = {
			RequestMethod.GET }, produces = "application/json;charset=utf-8")
	@ResponseBody
	public String BountyDisplay() throws JsonProcessingException {		
		ObjectMapper mapper = new ObjectMapper();
		mapper.setDateFormat(sdf);
		List<BountyBean> bountyList = bountyService.select(null);
		return mapper.writeValueAsString(bountyList);
	}
	
	
	//6/18活動主頁追蹤數及留言數查詢
	@RequestMapping(path={"/bounty/displayCount.controller"}, method={RequestMethod.GET,RequestMethod.POST},produces="application/json;charset=utf-8")
	@ResponseBody
	public String BountyPageCount(@RequestParam(value = "id") String id) throws JsonProcessingException{	
		//查詢追蹤數
		long trackcount = bountyTrackService.countAllTracks(Integer.parseInt(id));
		//查詢留言數
		long msgcount = bmsgService.countAllMsgs(Integer.parseInt(id));
		
		Map<String, Object> map = new HashMap<>();
		map.put("trackcount", trackcount);
		map.put("msgcount", msgcount);
		
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(map);
	}
	
	

	// 活動個別頁面呈現   // 6/7 
	@RequestMapping(path = { "/bounty/bountyPage.controller" }, method = {
			RequestMethod.GET,RequestMethod.POST })
	public String BountyPage(@RequestParam(value = "id") String id, Model model) {
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(apllication);
		BountyBean bean = (BountyBean) context.getBean("bountyBean");
		bean.setB_id(Integer.parseInt(id));
	
		//查詢追蹤數
		//select count(*) from tb_track where b_id=1
		long trackcount = bountyTrackService.countAllTracks(Integer.parseInt(id));
		model.addAttribute("trackcount", trackcount);
		
		// 6/7 //查詢留言數
		long msgcount = bmsgService.countAllMsgs(Integer.parseInt(id));
		model.addAttribute("msgcount", msgcount);

		List<BmsgBean> bb = bmsgService.selectByBid(Integer.parseInt(id));
		List<Map<String, Object>> select = new ArrayList<>();
		for (BmsgBean ca : bb) {
			Map<String, Object> map = new HashMap<>();
			map.put("member", memberService.select(ca.getMid()));
			map.put("msg", ca);
			select.add(map);
		}
		model.addAttribute("select", select);

		BountyBean updateBean = new BountyBean();
		List<BountyBean> beans = bountyService.select(bean);
		for (BountyBean b : beans) {
			model.addAttribute("bean", b);
			updateBean = b;
			updateBean.setB_click(b.getB_click() + 1); // 更新瀏覽數
			Set<BountyTagBean> tags = b.getTags();
			model.addAttribute("tags", tags);
		}
		bountyService.update(updateBean);
		return "bountyPage";
	}

	// 6/8 活動選擇
	@RequestMapping(path = "/bounty/bountySelect.controller", method = {
			RequestMethod.GET }, produces = "application/json;charset=utf-8")
	@ResponseBody
	public String BountySelectServlet(String Selector) throws JsonProcessingException {

		System.out.println(Selector);
		Integer min = null;
		Integer max = null;

		switch (Selector) {
		case "below50k":
			min = 0;
			max = 50000;
			break;
		case "50to100k":
			min = 50000;
			max = 100000;
			break;
		case "100to250k":
			min = 100000;
			max = 250000;
			break;
		case "250to500k":
			min = 250000;
			max = 500000;
			break;
		case "500kup":
			min = null;
			max = 500000;
			break;
		}

		ObjectMapper mapper = new ObjectMapper();
		mapper.setDateFormat(sdf);
		List<BountyBean> result = null;
		if (Selector != null && "below50k".equals(Selector) || "50to100k".equals(Selector)
				|| "100to250k".equals(Selector) || "250to500k".equals(Selector) || "500kup".equals(Selector)) {			
			result = bountyService.selectByBouns(min, max);		
		}
		if (Selector != null && "b_click".equals(Selector) || "b_bonus_total".equals(Selector)
				|| "b_update".equals(Selector)) {
			result = bountyService.selectBySelector(Selector);
		}
		if (Selector != null && ("0".equals(Selector) || "1".equals(Selector)
				|| "2".equals(Selector) || "3".equals(Selector))) {
			result = bountyService.selectByState(Selector);
		}
		//6/8	
		if (Selector !=null && "t".equals(Selector.substring(0, 1))){
			result = bountyService.selectByTags(Selector.substring(1));
		}
		return mapper.writeValueAsString(result);
	}

	// ============活動管理=========================================================================================================
	// 刪除
	@RequestMapping(path = { "/bounty/personalDelete.controller" }, method = {
			RequestMethod.GET }, produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String BountyPersonalDelete(@RequestParam(value = "b_id") String temp) {
		Integer b_id = null;
		if (temp != null && temp.trim().length() != 0) {
			b_id = Integer.parseInt(temp);
		}
		
		//6/12
		// 先刪除與該活動有關的所有追蹤及留言
		bountyTrackService.delete(b_id);
		bmsgService.deleteByB_id(b_id);
		
		BountyBean bean = new BountyBean();
		bean.setB_id(b_id);
		// 再刪除該活動
		boolean result2 = bountyService.delete(bountyService.selectById(b_id));
		// 若刪除成功回傳response
		if (result2) {
			return "已刪除";
		} else {
			return "發生錯誤";
		}
	}

	// 呈現該會員所有發表活動資訊
	@RequestMapping(path = { "/bounty/personalDisplay.controller" }, method = {
			RequestMethod.GET }, produces = "application/json;charset=utf-8")
	@ResponseBody
	public String BountyPersonal(@RequestParam(value = "mid") String temp1) throws JsonProcessingException {

		// 取得會員ID
		// 轉換資料
		Integer mid = null;
		if (temp1 != null && temp1.trim().length() != 0) {
			mid = Integer.parseInt(temp1);
		}
		// 利用會員ID取得該會員所有發表活動資訊
		List<BountyBean> result = bountyService.selectByMember(mid);
		// 將活動資訊轉為JSON格式
		ObjectMapper mapper = new ObjectMapper();
		mapper.setDateFormat(sdf);
		return mapper.writeValueAsString(result);
	}

	// ============活動追蹤=========================================================================================================
	// 追蹤
	@RequestMapping(path = { "/bounty/bountyTrack.controller" }, method = {
			RequestMethod.GET }, produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String BountyTrack(@RequestParam(value = "b_id") String temp1, 
			                  @RequestParam(value = "mid") String temp2
			                 ){
		// 接收資料
		if (temp2 == null || temp2.trim().length() == 0) {
			return "請先登入";
		}

		// 轉換資料
		Integer b_id = null;
		Integer mid = null;
		if (temp1 != null && temp1.trim().length() != 0) {
			b_id = Integer.parseInt(temp1);
		}
		if (temp2 != null && temp2.trim().length() != 0) {
			mid = Integer.parseInt(temp2);
		}

		// 呼叫model
		boolean result = bountyTrackService.insert(mid, b_id);

		// 若新增成功回傳response
		if (result) {
			return "請至活動追蹤觀看名單";
		} else {
			return "已在您的追蹤名單中";
		}
	}

	// 取消追蹤
	@RequestMapping(path = { "/bounty/bountyCancel.controller" }, 
			method = {RequestMethod.GET }, produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String BountyTrackCancel(@RequestParam(value = "b_id") String temp1,
									@RequestParam(value = "mid") String temp2
									)
	{
		Integer b_id = null;
		Integer mid = null;
		if (temp1 != null && temp1.trim().length() != 0) {
			b_id = Integer.parseInt(temp1);
		}
		if (temp2 != null && temp2.trim().length() != 0) {
			mid = Integer.parseInt(temp2);
		}

		boolean result = bountyTrackService.delete(mid, b_id);
		// 若刪除成功回傳response
		if (result) {
			return "已取消追蹤";
		} else {
			return "發生錯誤";
		}
	}
	
	//呈現所有追蹤
	@RequestMapping(path={"/bounty/trackDisplay.controller"},
			method={RequestMethod.GET},produces="application/json;charset=utf-8")
	@ResponseBody
	public String BountyTrackDisplay(@RequestParam(value = "mid") String temp) throws JsonProcessingException{	
		//取得會員ID
		Integer mid =null;
		//轉換資料
		if(temp!=null && temp.trim().length()!=0){
			mid = Integer.parseInt(temp);
		}		
		//利用會員ID取得所有追蹤活動資訊
		List<BountyBean> bountys = new ArrayList<BountyBean>();	
		List<BountyTrackBean> result = bountyTrackService.select(mid);
		for(BountyTrackBean b:result){	
			BountyBean bounty = bountyService.selectById(b.getB_id());
			bountys.add(bounty);
		}	
		//將活動資訊轉為JSON格式
		ObjectMapper mapper = new ObjectMapper();
		mapper.setDateFormat(sdf);
		return mapper.writeValueAsString(bountys);
	}	
	
	// ============活動更新 6/7=======================================================================================================	
	
	@RequestMapping(path={"/bounty/personalUpdate.controller"},
			 method={RequestMethod.GET,RequestMethod.POST})
	public String BountyPersonalUpdate(@RequestParam(value = "b_id") String temp, Model model){	
		Integer b_id=null;
		if(temp!=null && temp.trim().length()!=0){
			b_id = Integer.parseInt(temp);
		}
		BountyBean change=	bountyService.selectById(b_id);	
    	if(change!=null) {
    		model.addAttribute("change", change);
		}
 
    	return "bountyChange";		
	}
	
	
	// ============活動狀態更新 6/16=======================================================================================================	
	
	@RequestMapping(path={"/bounty/bountyStateUpdate.controller"},
				method={RequestMethod.GET,RequestMethod.POST}, produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String BountyStateUpdate(@RequestParam(value="b_id") String temp,
									@RequestParam(value="bountyState") String bountyState){
		Integer b_id=null;
		if(temp!=null && temp.trim().length()!=0){
			b_id = Integer.parseInt(temp);
		}
		String result="";
		if("close".equals(bountyState)){
			boolean b = bountyService.stateUpdate(b_id, 1);
			if(b){
				result="活動已關閉";
			}
		}	
		return result;
		
		
		
	}
	
	
	// ============活動留言更新 6/15=======================================================================================================	
	@RequestMapping(value = "/bounty/showBmsg.controller", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<Map<String, Object>> selectByBid(Integer b_id) {
		List<Map<String, Object>> select = new ArrayList<>();
		
		List<BmsgBean> bb = bmsgService.selectByBid(b_id);
		for (BmsgBean ca : bb) {
			Map<String, Object> map = new HashMap<>();
			map.put("member", memberService.select(ca.getMid()));
			map.put("msg", ca);
			select.add(map);
		}		
		return select;	
	}
	
	@RequestMapping(value = "/bounty/insertBmsg.controller", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	@ResponseBody
	public BmsgBean insertBmsg(@SessionAttribute("loginOK")MemberBean user, Integer b_id, String b_msgcontent) {
		if (user != null && b_msgcontent != null) {
			String encodeWmsg = StringEscapeUtils.escapeHtml4(b_msgcontent);
//			WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(apllication);
			BmsgBean bean = new BmsgBean();
			System.out.println(bean.getB_msgid());
			bean.setMid(user.getMid());
			bean.setB_id(b_id);
			bean.setB_msgcontent(encodeWmsg);
			
			return bmsgService.insert(bean);
		}
		return null;
	}
	
	@RequestMapping(value = "/bounty/updateBmsg.controller", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public BmsgBean updateBmsg(Integer b_msgid, String b_msgcontent ,Integer b_id) {
		if (b_msgcontent != null) {
			String encodeWmsg = StringEscapeUtils.escapeHtml4(b_msgcontent);
			WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(apllication);
			BmsgBean bean = (BmsgBean) context.getBean("bmsgBean");
			bean.setB_msgid(b_msgid);
			bean.setB_id(b_id);
			bean=bmsgService.select(bean).get(0);
			bean.setB_msgcontent(encodeWmsg);
			
			return bmsgService.update(bean);
		}
		return null;
	}
	
	@RequestMapping(value = "/bounty/deletebmsg.controller", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public boolean deletebmsg(@SessionAttribute("loginOK") MemberBean user, Integer b_msgid) {
		if (bmsgService.select(b_msgid).getMid().equals(user.getMid())) {
			bmsgService.delete(b_msgid);
			return true;
		}
		return false;
	}
	
	
	@RequestMapping(path = "/bounty/bountySearch.controller", method = {
			RequestMethod.GET }, produces = "application/json;charset=utf-8")
	@ResponseBody
	public String bountySearch(@RequestParam(defaultValue="1")Integer orderby,@RequestParam(required=false)Integer[] amount,
			@RequestParam(required=false)Integer[] state,@RequestParam(required=false)String[] tag) throws JsonProcessingException {
		if(orderby==null && amount==null && state==null && tag==null)
			return null;
		if(orderby!=null){
			if(orderby.intValue() > 2 || orderby.intValue() < 0 )
				return null;
		}
		if(amount!=null){
			if(amount.length>5)
				return null;
			for(int i=0;i<amount.length;i++){
				if(amount[i].intValue() > 16 || amount[i].intValue() < 0 || (amount[i].intValue()%2==1 && amount[i].intValue()!=1))
					return null;
			}
		}
		if(state!=null){
			if(state.length>4)
				return null;
			for(int i=0;i<state.length;i++){
				if(state[i].intValue() > 16 || state[i].intValue() < 0 || state[i].intValue()%2==1 && state[i].intValue()!=1)
					return null;
			}
		}
		if(tag!=null){
//			for(int i=0;i<tag.length;i++){
//				
//			}
		}
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.setDateFormat(sdf);
		
		return mapper.writeValueAsString(bountyService.search(orderby, amount, state, tag));
	}
	
}
