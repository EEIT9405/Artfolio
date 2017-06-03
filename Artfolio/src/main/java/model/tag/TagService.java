package model.tag;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



@Service
public class TagService{
	@Autowired
	private TagDAO tagdao;
	@Transactional
	public List<TagBean> addTag(Integer wid,String[] tags){
		List<TagBean> result=new ArrayList<>();
		List<TagBean> current=getTags(wid);
		if (current.size()>=10 || tags.length>10)
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

	
	@Transactional
	public List<TagBean> getTags(Integer wid){
		return tagdao.select(wid);
	}
	
	@Transactional
	public boolean delTag(Integer wid,String tag){
		List<TagBean> list=getTags(wid);
		for(TagBean bean:list){
			if(bean.getTag().equals(tag) && bean.isLock())
				return false;
		}
		return tagdao.delete(new TagBean(wid,tag));
	}
	
	@Transactional
	public boolean lockTag(TagBean bean){
		bean.setLock(!bean.isLock());
		return tagdao.update(bean);
	}
}
