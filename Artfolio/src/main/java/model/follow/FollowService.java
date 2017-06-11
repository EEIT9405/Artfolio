package model.follow;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class FollowService {
	@Autowired
	private FollowDAO followdao;
	
	@Transactional
	public boolean insert(FollowBean bean){
		if(bean!=null)
			return followdao.insert(bean);
		return false;
	}
	@Transactional
	public boolean delete(FollowBean bean){
		if(bean!=null)
			return followdao.delete(bean);
		return false;
	}
	@Transactional(readOnly=true)
	public List<FollowBean> selectFollowing(Integer mid){
		if(mid!=null)
			return followdao.select(mid);
		return null;
	}
	@Transactional(readOnly=true)
	public List<FollowBean> selectFollowed(Integer followid){
		if(followid!=null)
			return followdao.selectFollowed(followid);
		return null;
	}
}
