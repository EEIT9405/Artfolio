package controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import model.browsed.BrowsedBean;
import model.browsed.BrowsedService;
import model.favorite.FavoriteService;
import model.member.MemberBean;
import model.tag.TagService;
import model.work.WorkBean;

//用於新增觀看紀錄、喜好標籤
@Controller
@RequestMapping("/browsed.controller")
public class BrowsedController {
	
	@Autowired
	private BrowsedService browsedService;
	@Autowired
	private FavoriteService favoriteService;
	@Autowired
	private TagService tagService;
//	@Autowired
//	private WorkService workService;
	@Autowired
	private ServletContext application;
	
	@RequestMapping(method=RequestMethod.POST)
	@ResponseBody
	public void insert(@SessionAttribute("loginOK") MemberBean user, int wid){
		System.out.println(wid);
		System.out.println(user.getMid());
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(application);
		BrowsedBean bean = (BrowsedBean) context.getBean("browsedBean");
		bean.setMid(user.getMid());
		//bean.setWorkBean(workService.select(wid));
		WorkBean wb = new WorkBean();
		wb.setWid(wid);
		wb.setPicurl("/img/xxx.jpg");
		wb.setMid(1);
		bean.setWorkBean(wb);
		browsedService.insert(bean);
		favoriteService.insertOrUpdate(user, tagService.getTags(wid));
		return;
	}
}
