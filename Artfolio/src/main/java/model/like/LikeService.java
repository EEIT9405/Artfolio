package model.like;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.work2.WorkService2;


@Service
public class LikeService {
	@Autowired
	private LikeDAO likedao;
	@Autowired
	private WorkService2 workService;
	@Transactional
	public boolean insert(LikeBean bean){
		if(bean!=null)
			return likedao.insert(bean) && workService.updateLike(bean.getWid(), selectLiked(bean.getWid()).size());
		return false;
	}
	@Transactional
	public boolean delete(LikeBean bean){
		if(bean!=null)
			return likedao.delete(bean) && workService.updateLike(bean.getWid(), selectLiked(bean.getWid()).size());
		return false;
	}
	@Transactional(readOnly=true)
	public List<LikeBean> select(Integer mid){
		if(mid!=null)
			return likedao.select(mid);
		return null;
	}
	@Transactional(readOnly=true)
	public List<LikeBean> selectLiked(Integer wid){
		if(wid!=null)
			return likedao.selectLiked(wid);
		return null;
	}
}
