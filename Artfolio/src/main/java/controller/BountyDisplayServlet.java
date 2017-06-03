package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;

import model.bounty.BountyBean;
import model.bounty.BountyService;


//@Controller
//@RequestMapping("/bountyDisplay.controller")
public class BountyDisplayServlet {
	@Autowired
	private BountyService bountyService;
	
	@RequestMapping(method=RequestMethod.GET)
	protected String doGet(Model model) {
		
		
		List<BountyBean> bountyList = bountyService.select(null);
		model.addAttribute("bountyList", bountyList);	
		return "bountyDis";
	}
}
