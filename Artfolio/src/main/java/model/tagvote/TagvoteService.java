package model.tagvote;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import model.tag.TagBean;
import model.tag.TagService;

@Service
public class TagvoteService {
	@Autowired
	private TagvoteDAO tagvotedao;
	@Autowired
	private TagService tagService;
	
	@Transactional
	public boolean insert(TagvoteBean bean){
		if(bean!=null)
			return tagvotedao.insert(bean) && tagService.voteTag(new TagBean(bean.getWid(),bean.getTag(),null,select(bean.getWid(),bean.getTag()).size()));
		return false;
	}
	
	@Transactional
	public boolean delete(TagvoteBean bean){
		if(bean!=null)
			return tagvotedao.delete(bean) && tagService.voteTag(new TagBean(bean.getWid(),bean.getTag(),null,select(bean.getWid(),bean.getTag()).size()));
		return false;
	}
	@Transactional(readOnly=true)
	public List<TagvoteBean> select(Integer wid,String tag){
		if(wid!=null && tag!=null)
			return tagvotedao.select(wid, tag);
		return null;
	}
	@Transactional(readOnly=true)
	public List<TagvoteBean> select(Integer mid){
		if(mid!=null)
			return tagvotedao.select(mid);
		return null;
		
	}
	@Transactional(propagation=Propagation.MANDATORY)
	public boolean delete(List<TagvoteBean> list){
		if(list!=null){
			boolean r=true;
			for(TagvoteBean bean:list)	{
				r=r && delete(bean);
			}
			return r;
		}	
		return false;
	}

}
