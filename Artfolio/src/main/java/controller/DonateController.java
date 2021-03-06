package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import model.donate.DonateBean;
import model.donate.DonateService;
import model.expoint.ExpointBean;
import model.expoint.ExpointService;
import model.member.MemberBean;
import model.member.MemberService;
import model.work.WorkService;
import util.SpringEmailService;

@Controller
@RequestMapping("point")
public class DonateController {
	@Autowired
	private DonateService donateService;
	@Autowired
	private ExpointService expointService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private WorkService workService;
	@Autowired
	private SpringEmailService emailService;
	@Autowired
	HttpSession session;
	
	@RequestMapping(method=RequestMethod.GET,path="log.controller")
	public String view(Model model){
		Integer mid=(Integer) session.getAttribute("mid");
		if(mid==null)
			return "index";
		model=data(model,mid);
		return "point";
	}
	@RequestMapping(method=RequestMethod.POST,path="exchange.controller")
	public String point(Model model,String type,Integer point){
		Integer mid=(Integer) session.getAttribute("mid");
		if(mid==null)
			return "index";
		Integer currentPoint=memberService.select(mid).getPoint();
		String msg="";
		model=data(model,mid);
		model.addAttribute("msg", msg);
		if(type!=null && point!=null && point>0){
			
			if(type.equals("sell")){
				if(point>currentPoint){
					msg="point is not enough";
					return "point";
				}else{
					if(expointService.insert(new ExpointBean(null,mid,false,point,null),currentPoint)){
						msg="sell successfully";
				//		emailService.sendEmailTask("", "", "");
					}else{
						msg="failed to sell";
						return "point";
					}
				}
			}else{
				if(expointService.insert(new ExpointBean(null,mid,true,point,null),currentPoint)){
					msg="buy successfully";
				//	emailService.sendEmailTask("", "", "");
				}else{
					msg="failed to buy";
					return "point";
				}
			}
			session.setAttribute("msg",msg);
			session.setAttribute("from", "exchange");
			return "traderesult";
		}
		msg="error";
		return "point";
	}
	
	private Model data(Model model,Integer mid){
		model.addAttribute("main",memberService.select(mid));
		List<Map<String,Object>> list=new ArrayList<>();
		for(DonateBean bean:donateService.select(mid)){
			MemberBean mb=memberService.select(bean.getTargetid());
			Map<String,Object> map=new HashMap<>();
			map.put("mphoto",mb.getMphoto());
			map.put("mid", bean.getTargetid());
			map.put("name", mb.getName());
			map.put("point", bean.getPoint());
			map.put("date", bean.getDonatedate());
			list.add(map);
		}
		model.addAttribute("donatelog", list);
		List<Map<String,Object>> list2=new ArrayList<>();
		for(DonateBean bean:donateService.selectDonated(mid)){
			MemberBean mb=memberService.select(bean.getMid());
			Map<String,Object> map=new HashMap<>();
			map.put("mphoto",mb.getMphoto());
			map.put("mid", bean.getMid());
			map.put("name", mb.getName());
			map.put("point", bean.getPoint());
			map.put("date", bean.getDonatedate());
			list2.add(map);
		}
		model.addAttribute("donatedlog", list2);
		model.addAttribute("exchangelog", expointService.select(mid));
		return model;
	}
	
	@RequestMapping(method=RequestMethod.GET,path="donate.controller")
	public String showDonatePage(Model model,
			@RequestParam(name="wid",required=false)Integer wid,
			@RequestParam(name="targetid",required=false)Integer targetid){
		Integer mid=(Integer) session.getAttribute("mid");
		String msg=null;
		if(mid==null){
			msg="must login first";
			targetid=null;
		}
		else if((wid==null && targetid==null) || (wid!=null && targetid!=null)){
			msg="target error";
			targetid=null;
		}
		else if(wid!=null){
			targetid=workService.getWork(wid).getMid();
		}
		if(mid!=null && mid.equals(targetid)){
			msg="您無法贊助自己。";
			targetid=null;
		}
		if(targetid!=null){
			model.addAttribute("targetid", targetid);
			
			MemberBean target=memberService.select(targetid);
			if(target!=null){
				model.addAttribute("targetname", target.getName());
				MemberBean m=memberService.select(mid);
				if(m!=null)
				model.addAttribute("point", m.getPoint());	
			}
		}
		model.addAttribute("ermsg",msg);
		return "donate";
	}
	@RequestMapping(method=RequestMethod.POST,path="donate.controller")
	public String donate(Integer point,Integer targetid){
		Integer mid=(Integer) session.getAttribute("mid");
		if(mid==null)
			return "index";
		String msg;
		if(point!=null && targetid!=null 
				&& donateService.insert(new DonateBean(null,mid,targetid,point,null))){
			msg="donate successfully";
		}else
			msg="error";
		session.setAttribute("msg", msg);
		session.setAttribute("from", "donate");
		return "traderesult";
	}
}
