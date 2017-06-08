package controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
import model.member.MemberService;

@Controller
public class BountyController {
	SimpleDateFormat sdf;
	public BountyController() {
		sdf = new SimpleDateFormat("yyyy-MM-dd");
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

	// 活動個別頁面呈現
	@RequestMapping(path = { "/bounty/bountyPage.controller" }, method = {
			RequestMethod.GET,RequestMethod.POST }, produces = "application/json;charset=utf-8")
	public String BountyPage(@RequestParam(value = "id") String id, Model model) {
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(apllication);
		BountyBean bean = (BountyBean) context.getBean("bountyBean");
		bean.setB_id(Integer.parseInt(id));
		//查詢追蹤數
		//select count(*) from tb_track where b_id=1
		long trackcount = bountyTrackService.countAllTracks(Integer.parseInt(id));
		model.addAttribute("trackcount", trackcount);

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

	// 活動選擇
	@RequestMapping(path = "/bounty/bountySelect.controller", method = {
			RequestMethod.GET }, produces = "application/json;charset=utf-8")
	@ResponseBody
	public String BountySelectServlet(String Selector) throws JsonProcessingException {

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
		// 先刪除與該活動有關的所有追蹤
		bountyTrackService.delete(b_id);
		// 再刪除該活動
		boolean result2 = bountyService.delete(bountyService.selectById(b_id));
		// 若刪除成功回傳response
		if (result2) {
			return "已取消活動";
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
			                 ) 
	{
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
			return "新增成功，請至活動追蹤觀看名單";
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
}
