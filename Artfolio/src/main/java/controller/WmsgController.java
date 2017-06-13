package controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import model.member.MemberBean;
import model.wmsg.WmsgBean;
import model.wmsg.WmsgService;

@Controller
public class WmsgController {

	@Autowired
	private WmsgService wmsgService;
	@Autowired
	private ServletContext application;

	@RequestMapping(value = "/showWmsg.controller", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<WmsgBean> getAllWmsg(Integer wid) {
		return wmsgService.showAll(wid);
	}

	@RequestMapping(value = "/insertWmsg.controller", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	@ResponseBody
	public WmsgBean insertWmsg(@SessionAttribute("loginOK") MemberBean user, Integer wid, String wmsgcontent) {
		
		System.out.println(user);
		System.out.println(wmsgcontent);
		if (user != null && wmsgcontent != null) {
			String encodeWmsg = wmsgcontent; //StringEscapeUtils.escapeHtml4(wmsgcontent);
			WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(application);
			WmsgBean bean = (WmsgBean) context.getBean("wmsgBean");
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
			WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(application);
			WmsgBean bean = (WmsgBean) context.getBean("wmsgBean");
			bean.setWmsgid(wmsgid);
			bean.setWmsgcontent(encodeWmsg);
			
			return wmsgService.update(bean);
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
