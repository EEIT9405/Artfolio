package model.work;

import java.util.List;

public interface WorkDAO {

	WorkBean select(Integer wid);
	
	List<WorkBean> select();
	
	WorkBean insert(WorkBean bean);
	
	WorkBean update(WorkBean bean);
	
	boolean delete(Integer wid);
	
	
	//
	boolean updateScore(WorkBean bean);
	List<WorkBean> searchByTitle(String[] and,String[] or,String[] not,boolean content);
	boolean updateLike(Integer wid,Integer wlike);
	List<WorkBean> searchByMid(Integer mid);
	List<WorkBean> searchRecent();
	List<WorkBean> searchByAid(Integer aid);
}