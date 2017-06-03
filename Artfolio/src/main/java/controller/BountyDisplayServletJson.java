package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import model.bounty.BountyBean;
import model.bounty.BountyService;


@Controller
@RequestMapping("/bountyDisplayJson.controller")
public class BountyDisplayServletJson {
	@Autowired
	private BountyService bountyService;
	
	@RequestMapping(method=RequestMethod.GET, produces="application/json;charset=utf-8")
	@ResponseBody
	protected String bountyDisplay() throws JsonProcessingException {
		
		List<BountyBean> bountyList = bountyService.select(null);
		/*
		for (BountyBean b:bountyList)
			for (BountyTagBean tags:b.getTags())
				tags.setBountyBean(null);*/
		
		return new ObjectMapper().writeValueAsString(bountyList);
	}
}
