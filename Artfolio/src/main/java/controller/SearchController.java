package controller;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.tag.TagService;
import model.work.WorkBean;
import model.work.WorkService;
import model.member.MemberInfo;
import model.member.MemberService;

@Controller
@ResponseBody
public class SearchController {
	@Autowired
	private TagService tagService;
	@Autowired
	private WorkService workService;
	@Autowired
	private MemberService memberService;
	@Autowired
	HttpSession session;
	
	@RequestMapping(path="search.controller",method=RequestMethod.GET)
	public List<WorkBean> search(String type,
			@RequestParam(name="and",required=false)String and,
			@RequestParam(name="or",required=false)String or,
			@RequestParam(name="not",required=false)String not,
			@RequestParam(name="orderby",defaultValue="like")String orderby,
			@RequestParam(name="order",defaultValue="descending")String order,
			@RequestParam(name="period",defaultValue="year")String period){
		if(type==null || ((and==null || and.trim().length()==0) && (or==null || or.trim().length()==0) && (not==null || not.trim().length()==0)))
		return null;
		List<WorkBean> list=null;
		String[] andConditions=null,orConditions=null,notConditions=null;
		if(and!=null && and.trim().length()>0)
		andConditions=and.trim().split(" ");
		
		if(or!=null && or.trim().length()>0)
		orConditions=or.trim().split(" ");

		if(not!=null && not.trim().length()>0)
		notConditions=not.trim().split(" ");
	
		if(type.equals("tag")){
			list=new ArrayList<>();
			for (Integer wid:tagService.getWorks(andConditions, orConditions, notConditions)){
				list.add(workService.getWork(wid));
			}
		}else if(type.equals("title")){
			list=workService.selectByTitle(andConditions, orConditions, notConditions,false);
		}else if(type.equals("content")){
			list=workService.selectByTitle(andConditions, orConditions, notConditions,true);
		}else
			return null;
		
		
		list=sortWork(list,orderby,order);
		
		java.util.Date when;
		if(period.equals("day"))
			when=new java.util.Date(System.currentTimeMillis()-86400000);
		else if(period.equals("week"))
			when=new java.util.Date(System.currentTimeMillis()-86400000*7);
		else if(period.equals("month"))
			when=new java.util.Date(System.currentTimeMillis()-86400000L*30);
		else
			when=new java.util.Date(System.currentTimeMillis()-86400000L*365);
		
//		System.out.println(new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(when));
		for (int i=0;i<list.size();i++){
			if(list.get(i).getWstart().before(when)){
				list.remove(i--);
			}		
		}
		return list;
	}
	
	@RequestMapping(path="searchByMid.controller",method=RequestMethod.GET)
	public List<WorkBean> searchByMid(Integer mid,
			@RequestParam(name="orderby",defaultValue="like")String orderby,
			@RequestParam(name="order",defaultValue="descending")String order){
		List<WorkBean> list=null;
		if(mid!=null)
			list=sortWork(workService.selectByMid(mid), orderby, order);
		return list;
	}
	
	public static List<WorkBean> sortWork(List<WorkBean> list,String orderby,String order){
		boolean o=order.equals("ascending");
		if(orderby.equals("date")){
			list.sort(new Comparator<WorkBean>(){
				public int compare(WorkBean w1, WorkBean w2) {
					int c=w1.getWstart().compareTo(w2.getWstart());
					return o?c:-c;
				}
			});
		}else if(orderby.equals("alphabet")){
			list.sort(new Comparator<WorkBean>(){
				public int compare(WorkBean w1, WorkBean w2) {
					int c=w1.getWtitle().compareTo(w2.getWtitle());
					return o?c:-c;
				}
			});
		}else{
			list.sort(new Comparator<WorkBean>(){
				public int compare(WorkBean w1, WorkBean w2) {
					int c=w1.getWlike().compareTo(w2.getWlike());
					return o?c:-c;
				}	
			});
		}
		return checkisHidden(list);
	}
	
	public static List<MemberInfo> sortMember(List<MemberInfo> list,String orderby,String order){
		boolean o=order.equals("ascending");
		if(orderby.equals("date")){
			list.sort(new Comparator<MemberInfo>(){
				public int compare(MemberInfo m1, MemberInfo m2) {
					int c=m1.getMstart().compareTo(m2.getMstart());
					return o?c:-c;
				}
			});
		}else if(orderby.equals("alphabet")){
			list.sort(new Comparator<MemberInfo>(){
				public int compare(MemberInfo m1, MemberInfo m2) {
					int c=m1.getName().compareTo(m2.getName());
					return o?c:-c;
				}
			});
		}
		return list;
	}
	@RequestMapping(path="searchRecent.controller",method=RequestMethod.GET)
	public List<WorkBean> searchRecent(){
		return checkisHidden(workService.selectRecent());
	}
	
	@RequestMapping(path="searchByAid.controller",method=RequestMethod.GET)
	public List<WorkBean> searchByAid(Integer aid){
		List<WorkBean> list=workService.selectByAid(aid);
		list.sort((w1,w2)->w1.getWorder().compareTo(w2.getWorder()));
		return checkisHidden(list);
	}
	
	public static List<WorkBean> checkisHidden(List<WorkBean> list){
		for(int i=0;i<list.size();i++){
			if(list.get(i).getWend().before(new java.util.Date()))
				list.remove(i--);
		}
		return list; 
	}
	
	@RequestMapping(path="searchAuthor.controller",method=RequestMethod.GET)
	public List<MemberInfo> searchAuthor(@RequestParam(name="and",required=false)String and,
			@RequestParam(name="or",required=false)String or,
			@RequestParam(name="not",required=false)String not,
			@RequestParam(name="orderby",defaultValue="ascending")String orderby,
			@RequestParam(name="order",defaultValue="alphabet")String order){
		if((and!=null && and.trim().length()>0) || (or!=null && or.trim().length()>0) || (not!=null && not.trim().length()>0) ){
			String[] andConditions=null,orConditions=null,notConditions=null;
			if(and!=null && and.trim().length()>0)
			andConditions=and.trim().split(" ");
			
			if(or!=null && or.trim().length()>0)
			orConditions=or.trim().split(" ");

			if(not!=null && not.trim().length()>0)
			notConditions=not.trim().split(" ");
			
			return sortMember(MemberInfo.beanToInfo(memberService.searchByName(andConditions, orConditions, notConditions)),orderby,order);
			
		}
		return null;
	}
}
