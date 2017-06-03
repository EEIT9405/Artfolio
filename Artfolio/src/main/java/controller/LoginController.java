package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.member.MemberBean;

@Controller
@RequestMapping("/login.controller")
@SessionAttributes("loginOK")
public class LoginController {
	
	@RequestMapping(method=RequestMethod.GET)
	public String login(Model model){
		
		MemberBean user = new MemberBean();
		user.setMid(1);
		
		model.addAttribute("loginOK", user);
		return "picture";
	}
}
