package model.favorite;


import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import model.member.MemberBean;
import model.tag.TagBean;

@Service
@Transactional
public class FavoriteService {
	
	@Autowired
	private FavoriteDAO favoriteDAO;
	@Autowired
	private ServletContext application;
	
	public void insertOrUpdate(MemberBean user, List<TagBean> tags){
		
		if(tags != null && !tags.isEmpty() && user != null){
			int mid = user.getMid();
			for(TagBean tagBean : tags){
				WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(application);
				FavoriteBean favoriteBean = (FavoriteBean) context.getBean("favoriteBean");
				String tag = tagBean.getTag();
				FavoriteBean bean = favoriteDAO.select(mid, tag);
				System.out.println("bean=" + bean);
				if(bean == null){
					favoriteBean.setMid(mid);
					favoriteBean.setTag(tag);
					System.out.println("favoriteBean="+ favoriteBean.getTag());
					favoriteDAO.insert(favoriteBean);
				}else{
					System.out.println("update");
					favoriteDAO.update(mid, tag);
				}
			}
		}
	}
}
