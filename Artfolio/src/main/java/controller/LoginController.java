package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.member.LoginService;
import model.member.MemberBean;


@Controller
@RequestMapping("reload.controller")
@ResponseBody
public class LoginController {
	@Autowired
	private LoginService loginService;
	@Autowired
	private HttpSession session;
	@RequestMapping(method=RequestMethod.GET)
	public Integer reload(Integer mid){
		if(mid!=null){
			Integer oldid=(Integer) session.getAttribute("mid");
			if(mid.equals(oldid)){
				MemberBean oldbean=(MemberBean)session.getAttribute("loginOK");
				MemberBean user = loginService.selectById(mid);
				if(oldbean.getPoint().equals(user.getPoint()))
					return null;
				session.removeAttribute("loginOK");
				session.setAttribute("loginOK",user);
				return user.getPoint();
			}
		}
		return null;
	}
}