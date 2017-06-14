package model.work;

import java.util.List;

public interface WorkDAO {

	WorkBean select(Integer wid);
	
	List<WorkBean> select();
	
	WorkBean insert(WorkBean bean);
	
	WorkBean update(Integer wid , Integer mid , String picurl , Integer aid , String winfo , String wtitle , Integer wlike , Integer wissue , Boolean iswmsg , Boolean isscore , java.util.Date wstart , java.util.Date wend , String score_1 , String score_2 , String score_3 , String score_4 , String score_5 , Integer scoreversion );
	
	boolean delete(Integer wid);
	
	
	
	//
	boolean updateScore(WorkBean bean);
	List<WorkBean> searchByTitle(String[] and,String[] or,String[] not,boolean content);
	boolean updateLike(Integer wid,Integer wlike);
	List<WorkBean> searchByMid(Integer mid);
}