package controller;

import java.util.List;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import model.block.BlockBean;
import model.block.BlockService;
import model.member.MemberBean;
import model.wmsg.WmsgBean;
import model.wmsg.WmsgService;
import model.work.WorkBean;
import model.work.WorkService;

@Controller
public class WmsgController {

	@Autowired
	private WmsgService wmsgService;
	@Autowired
	private BlockService blockService;
	@Autowired
	private WorkService workService;

	@RequestMapping(value = "/showWmsg.controller", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<WmsgBean> getAllWmsg(Integer wid) {
		return wmsgService.showAll(wid);
	}

	@RequestMapping(value = "/insertWmsg.controller", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	@ResponseBody
	public WmsgBean insertWmsg(@SessionAttribute("loginOK") MemberBean user, Integer wid, String wmsgcontent) {
		
		if (user != null && wmsgcontent != null && wid != null) {
			List<BlockBean> blockList = blockService.getAllList(user);
			if(blockList != null && !blockList.isEmpty()){
				List<WorkBean> workList = workService.select(wid);
				WorkBean work = null;
				if(workList != null && !workList.isEmpty()){
					work = workList.get(0);
				}
				for(BlockBean block : blockList){
					if(block.getMyBean().getMid().equals(work.getMid())){
						return null;
					}
				}
			}
			String encodeWmsg = StringEscapeUtils.escapeHtml4(wmsgcontent);
			WmsgBean bean = new WmsgBean();
			bean.setMemberBean(user);
			bean.setWid(wid);
			bean.setWmsgcontent(encodeWmsg.replaceAll("\\n|\\r\\n", "<br>"));
			return wmsgService.insert(bean);
		
		}
		return null;
	}

	@RequestMapping(value = "/updateWmsg.controller", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public WmsgBean updateWmsg(Integer wmsgid, String wmsgcontent) {
		if (wmsgcontent != null) {
			String encodeWmsg = StringEscapeUtils.escapeHtml4(wmsgcontent);
			WmsgBean bean = new WmsgBean();
			bean.setWmsgid(wmsgid);
			bean.setWmsgcontent(encodeWmsg.replaceAll("\\n|\\r\\n", "<br>"));
			
			bean = wmsgService.update(bean);
			bean.setWmsgcontent(bean.getWmsgcontent().replaceAll("<br>", "\n"));
			
			return bean;
		}
		return null;
	}

	@RequestMapping(value = "/deleteWmsg.controller", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public boolean deleteWmsg(@SessionAttribute("loginOK") MemberBean user, Integer wmsgid) {

		if (wmsgService.showOne(wmsgid).getMemberBean().getMid().equals(user.getMid())) {
			wmsgService.delete(wmsgid);
			return true;
		}
		return false;
	}
}
