package model.album;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import model.work.WorkBean;
import model.work.WorkService;

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
	@Autowired
	private WorkService workService;
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
			result = albumDao.update(bean);
		}
		return result;
	}
	public Boolean delete(Integer aid,Integer mid) {
		if(aid!=null && mid!=null){
			AlbumBean bean=select(aid).get(0);
			if(bean!=null && bean.getMid().equals(mid)){
				if(!bean.getAname().equals("default")){
					for(AlbumBean ab:selectByMid(mid)){
						if(ab.getAname().equals("default") && ab.getAid()!=aid){
							bean=ab;
							break;
						}
					}
					boolean update=true;
					for(WorkBean wb:workService.selectByAid(aid)){
						wb.setAlbumBean(bean);
						update=update && workService.updateDependency(wb);
					}return update && albumDao.delete(aid);
				}else
					return null;
			}
		}
		return false;
	}
	@Transactional(readOnly=true)
	public List<AlbumBean> selectByMid(Integer mid){
		if(mid!=null)
			return albumDao.selectByMid(mid);
		return null;
	}
}