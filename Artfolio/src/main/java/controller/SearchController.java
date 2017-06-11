package controller;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.tag.TagService;
import model.work2.WorkBean2;
import model.work2.WorkService2;

@Controller
@RequestMapping("search.controller")
@ResponseBody
public class SearchController {
	@Autowired
	private TagService tagService;
	@Autowired
	private WorkService2 workService;
	@RequestMapping(method=RequestMethod.GET)
	public List<WorkBean2> search(String type,
			@RequestParam(name="and",required=false)String and,
			@RequestParam(name="or",required=false)String or,
			@RequestParam(name="not",required=false)String not,
			@RequestParam(name="orderby",defaultValue="like")String orderby,
			@RequestParam(name="order",defaultValue="descending")String order,
			@RequestParam(name="period",defaultValue="week")String period){
		if(type==null || ((and==null || and.length()==0) && (or==null || or.length()==0) && (not==null || not.length()==0)))
		return null;
		
		List<WorkBean2> list=null;
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
		boolean o=order.equals("ascending");
		if(orderby.equals("like")){
			list.sort(new Comparator<WorkBean2>(){
				public int compare(WorkBean2 w1, WorkBean2 w2) {
					if(o)
						return w1.getWlike().compareTo(w2.getWlike());
					return w2.getWlike().compareTo(w1.getWlike());
				}
				
			});
		}else{
			list.sort(new Comparator<WorkBean2>(){
				public int compare(WorkBean2 w1, WorkBean2 w2) {
					if(o)
						return w1.getWstart().compareTo(w2.getWstart());
					return w2.getWstart().compareTo(w1.getWstart());
				}
				
			});
		}
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
}
