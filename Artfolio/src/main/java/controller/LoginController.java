package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.member.LoginService;
import model.member.MemberBean;


@Controller
@RequestMapping("login.controller")
public class LoginController {
	@Autowired
	private LoginService loginService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String login(HttpSession session){
		
		MemberBean user = loginService.selectById(1);
		session.setAttribute("loginOK",user);
		if(user!=null)
		session.setAttribute("mid", user.getMid());
		return "picture";
	}
}