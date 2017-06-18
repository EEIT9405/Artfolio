package model.tag;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import model.tagvote.TagvoteService;
import model.work.WorkService;



@Service
public class TagService{
	@Autowired
	private TagDAO tagdao;
	@Autowired
	private TagvoteService tagvoteService;
	@Autowired
	private WorkService workService;
	@Transactional
	public List<TagBean> addTag(Integer wid,String[] tags){
		if(wid==null || tags==null)
			return null;
		List<TagBean> result=new ArrayList<>();
		List<TagBean> current=getTags(wid);
		if (current == null || current.size()>=10 || tags.length>10)
			return null;
		for (int i=0;i<tags.length;i++)
		{	
			TagBean bean=new TagBean(wid,tags[i].trim());
			if(current.contains(bean)){
				continue;
			}
			result.add(bean);
		}
		if (current.size()+result.size()>10)
			return null;
		for (TagBean bean:result)
			tagdao.insert(bean);
		return result;
	}

	
	@Transactional(readOnly=true)
	public List<TagBean> getTags(Integer wid){
		if(wid!=null)
		return tagdao.select(wid);
		return null;
	}
	
	@Transactional
	public boolean delTag(Integer wid,String tag){
		if(wid==null || tag==null)
			return false;
		List<TagBean> list=getTags(wid);
		for(TagBean bean:list){
			if(bean.getTag().equals(tag) && bean.getLock())
				return false;
		}
		return tagvoteService.delete(tagvoteService.select(wid, tag)) && tagdao.delete(new TagBean(wid,tag));
	}
	
	@Transactional
	public boolean lockTag(TagBean bean,Integer mid){
		if(bean==null || mid==null || !workService.getWork(bean.getWid()).getMid().equals(mid))
			return false;
		bean.setLock(!bean.getLock());
		return tagdao.lock(bean);
	}
	
	@Transactional(readOnly=true)
	public List<Integer> getWorks(String[] and,String[] or,String[] not){
		if(and!=null || or!=null ||not!=null)
		return tagdao.search(and,or,not);
		return null;
	}
	
	@Transactional(propagation=Propagation.MANDATORY)
	public boolean voteTag(TagBean bean){
		if(bean==null)
			return false;
		return tagdao.vote(bean);
	}
}
