package model.album;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(
		transactionManager="transactionManager",
		//資料庫隔離層，使用底層資料庫預設的隔離層級
		isolation=Isolation.DEFAULT,
		readOnly=false,
		timeout=-1
)
public class AlbumService {
	@Autowired
	private AlbumDAO albumDao;
	public AlbumService(AlbumDAO albumDao) {
		this.albumDao = albumDao;
	}
	
	@Transactional(readOnly=true)
	public List<AlbumBean> select(Integer aid) {
		List<AlbumBean> result = null;
		if(aid!=null) {
			AlbumBean temp = albumDao.select(aid);
			if(temp!=null) {
				result = new ArrayList<AlbumBean>();
				result.add(temp);
			}
		} else {
			result = albumDao.select(); 
		}
		return result;
	}
	public AlbumBean insert(AlbumBean bean) {
		AlbumBean result = null;
		if(bean!=null) {
			result = albumDao.insert(bean);
		}
		return result;
	}
	public AlbumBean update(AlbumBean bean) {
		AlbumBean result = null;
		if(bean!=null) {
			result = albumDao.update(bean.getAid(), bean.getAname(),
					bean.getWid(), bean.getMid(), bean.getAdate());
		}
		return result;
	}
	public boolean delete(AlbumBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = albumDao.delete(bean.getAid());
		}
		return result;
	}
	@Transactional(readOnly=true)
	public List<AlbumBean> selectByMid(Integer mid){
		if(mid!=null)
			return albumDao.selectByMid(mid);
		return null;
	}
}