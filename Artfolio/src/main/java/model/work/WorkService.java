package model.work;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(
		transactionManager="transactionManager",
		//資料庫隔離層，使用底層資料庫預設的隔離層級
		isolation=Isolation.DEFAULT,
		readOnly=false,
		timeout=-1
)
public class WorkService {
	@Autowired
	private WorkDAO tbworkDao;
	public WorkService(WorkDAO tbworkDao) {
		this.tbworkDao = tbworkDao;
	}
	@Transactional(readOnly=true)
	public List<WorkBean> select(Integer wid) {
		List<WorkBean> result = null;
		if(wid!=null) {
			WorkBean temp = tbworkDao.select(wid);
			if(temp!=null) {
				result = new ArrayList<WorkBean>();
				result.add(temp);
			}
		} else {
			result = tbworkDao.select(); 
		}
		return result;
	}
	public WorkBean insert(WorkBean bean) {
		WorkBean result = null;
		if(bean!=null) {
			result = tbworkDao.insert(bean);
		}
		return result;
	}
	public WorkBean update(WorkBean bean) {
		WorkBean result = null;
		if(bean!=null) {
			result = tbworkDao.update(bean);
		}
		return result;
	}
	public boolean delete(WorkBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = tbworkDao.delete(bean.getWid());
		}
		return result;
	}
	
	//////////////////////////
	
	@Transactional(readOnly=true)
	public List<WorkBean> selectByTitle(String[] and, String[] or, String[] not,boolean content){
		if(and!=null || or!=null ||not!=null)
			return tbworkDao.searchByTitle(and, or, not,content);
		return null;
	}
	
	@Transactional(propagation=Propagation.MANDATORY)
	public boolean updateScore(WorkBean bean){
		if(bean!=null)
			return tbworkDao.updateScore(bean);
		return false;
	}
	
	@Transactional(propagation=Propagation.MANDATORY)
	public boolean updateLike(Integer wid,Integer wlike){
		if(wid!=null&&wlike!=null)
			return tbworkDao.updateLike(wid, wlike);
		return false;
	}
	
	@Transactional(readOnly=true)
	public WorkBean getWork(Integer wid){
		if(wid!=null){
			return this.select(wid).get(0);
		}		
		return null;
	}
	@Transactional(readOnly=true)
	public List<WorkBean> selectByMid(Integer mid){
		if(mid!=null)
		return tbworkDao.searchByMid(mid);
		return null;
	}
	
	@Transactional(readOnly=true)
	public List<WorkBean> selectRecent(){
		return tbworkDao.searchRecent();
	}
	
	@Transactional(readOnly=true)
	public List<WorkBean> selectByAid(Integer aid){
		if(aid!=null)
		return tbworkDao.searchByMid(aid);
		return null;
	}
}