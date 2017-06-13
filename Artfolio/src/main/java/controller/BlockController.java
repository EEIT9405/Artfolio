package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import model.block.BlockBean;
import model.block.BlockService;
import model.member.MemberBean;
import model.member.MemberService;

@Controller
public class BlockController {
	@Autowired
	private BlockService blockService;
	@Autowired
	private MemberService memberService;

	@RequestMapping(value="/block.controller", method = RequestMethod.POST, produces="text/plain;charset=utf-8")
	@ResponseBody
	public String block(@SessionAttribute("loginOK") MemberBean user, int mid) {
		BlockBean bean = new BlockBean();
		boolean result = false;
		if (user != null && mid > 0) {
			MemberBean mb = memberService.select(mid);
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
			MemberBean mb = memberService.select(mid);
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
