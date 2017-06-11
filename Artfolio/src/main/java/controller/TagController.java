package controller;

import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.tag.TagBean;
import model.tag.TagService;
import model.tagvote.TagvoteBean;
import model.tagvote.TagvoteService;
import model.work2.WorkService2;

@Controller
@RequestMapping("tag")
@ResponseBody
public class TagController {
	@Autowired
	TagService tagService;
	@Autowired
	WorkService2 workService;
	@Autowired
	TagvoteService tagvoteService;
	@Autowired
	HttpSession session;
	@RequestMapping(method=RequestMethod.POST,path="add.controller")
	public List<TagBean> addTag(Integer wid,@RequestParam("tags[]") String[] tags){
		if (wid!=null){
			for (String tag:tags){
				if(tag.matches("[A-Za-z \u4E00-\u9FFF]+") && tag.trim().length()!=0 && tag.trim().length()<=20)
					continue;
				return null;
			}
			return tagService.addTag(wid, tags);
		}
		return null;

	}
	
	@RequestMapping(method=RequestMethod.GET,path="get.controller")
	public List<TagBean> getTags(Integer wid){
		if(wid!=null){
			List<TagBean> list=tagService.getTags(wid);
			list.sort(new Comparator<TagBean>(){
				public int compare(TagBean o1, TagBean o2) {
					return -o1.getVote().compareTo(o2.getVote());
				}	
			});
			return list;
		}
		
		return null;
	}
	@RequestMapping(method=RequestMethod.GET,path="del.controller")
	public boolean delTag(Integer wid,String tag){
		if(wid!=null)
		return tagService.delTag(wid, tag);
		return false;
	}
	@RequestMapping(method=RequestMethod.GET,path="lock.controller")
	public boolean lockTag(Integer wid,String tag,Boolean islock){
		if(wid!=null && tag.length()!=0 && islock!=null){
			Integer mid=(Integer) session.getAttribute("mid");
			if(workService.getWork(wid).getMid().equals(mid))
			return tagService.lockTag(new TagBean(wid,tag,islock));
		}
		return false;
	}
	
	@RequestMapping(method=RequestMethod.POST,path="vote.controller")
	public boolean vote(Integer wid,String tag,boolean check){
		if(wid!=null && tag!=null){
			Integer mid=(Integer) session.getAttribute("mid");
			if(mid!=null){
				if(check)
				return tagvoteService.insert(new TagvoteBean(mid,wid,tag,null));
				return tagvoteService.delete(new TagvoteBean(mid,wid,tag,null));
			}
			
		}
		return false;
	}
	@RequestMapping(method=RequestMethod.GET,path="voted.controller")
	public boolean voted(Integer wid,String tag){
		if(wid!=null && tag!=null){
			Integer mid=(Integer) session.getAttribute("mid");
			if(mid!=null){
				for(TagvoteBean bean:tagvoteService.select(wid, tag))
				{
					if(bean.getMid().equals(mid))
						return true;
				}
			}
		}
		return false;
	}
	
}
