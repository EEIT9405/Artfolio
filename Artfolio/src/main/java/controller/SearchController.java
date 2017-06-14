package controller;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

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

@Controller
@ResponseBody
public class SearchController {
	@Autowired
	private TagService tagService;
	@Autowired
	private WorkService workService;
	
	
	@RequestMapping(path="search.controller",method=RequestMethod.GET)
	public List<WorkBean> search(String type,
			@RequestParam(name="and",required=false)String and,
			@RequestParam(name="or",required=false)String or,
			@RequestParam(name="not",required=false)String not,
			@RequestParam(name="orderby",defaultValue="like")String orderby,
			@RequestParam(name="order",defaultValue="descending")String order,
			@RequestParam(name="period",defaultValue="week")String period){
		if(type==null || ((and==null || and.length()==0) && (or==null || or.length()==0) && (not==null || not.length()==0)))
		return null;
		
		List<WorkBean> list=null;
		String[] andConditions=null,orConditions=null,notConditions=null;
		if(and!=null && and.length()>0)
		andConditions=and.trim().split(" ");
		
		if(or!=null && or.length()>0)
		orConditions=or.trim().split(" ");

		if(not!=null && not.length()>0)
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
		if(orderby.equals("like")){
			list.sort(new Comparator<WorkBean>(){
				public int compare(WorkBean w1, WorkBean w2) {
					int c=w1.getWlike().compareTo(w2.getWlike());
					return o?c:-c;
				}	
			});
		//	list.sort((w1,w2)->o?w1.getWlike().compareTo(w2.getWlike()):-w1.getWlike().compareTo(w2.getWlike()));
		}else if(orderby.equals("date")){
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
		}
		return list;
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
	
}
