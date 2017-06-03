package controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import model.block.BlockBean;
import model.block.BlockService;
import model.member.MemberBean;

@Controller
public class BlockController {
	@Autowired
	private BlockService blockService;
//	@Autowired
//	private MemberService memberService;
	@Autowired
	private ServletContext application;

	@RequestMapping(value="/block.controller", method = RequestMethod.POST, produces="text/plain;charset=utf-8")
	@ResponseBody
	public String block(@SessionAttribute("loginOK") MemberBean user, int mid) {
		WebApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(application);
		BlockBean bean = (BlockBean) context.getBean("blockBean");
		boolean result = false;
		if (user != null && mid > 0) {
			//還少程式bean.blockid(member.select(mid));
			MemberBean mb = new MemberBean();
			mb.setMid(mid);
			bean.setMyBean(user);
			bean.setTargetBean(mb);
			
			result = blockService.blockSomeone(bean);
		}
		if(result) return "已加入黑名單";
		else return "錯誤";
	}
	
	@RequestMapping(value="/unBlock.controller", method=RequestMethod.GET, produces="text/plain;charset=utf-8")
	@ResponseBody
	public String unBlock(@SessionAttribute("loginOK") MemberBean user, int mid){
		boolean result = false;
		if (user != null && mid > 0) {
			//還少程式bean.blockid(member.select(mid));
			MemberBean mb = new MemberBean();
			mb.setMid(mid);
			result = blockService.unblockSomeone(user,mb);
		}
		if(result) return "已移除黑名單";
		else return "錯誤";
	}
	
	@RequestMapping(value="/listBlock.controller", method=RequestMethod.GET, produces="application/json;charset=utf-8")
	@ResponseBody
	public List<BlockBean> listBlock(@SessionAttribute("loginOK") MemberBean user, String email){
		
		return blockService.getList(user, null);
	}
}
