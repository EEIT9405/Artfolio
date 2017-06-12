package model.work;

import java.util.List;

public interface WorkDAO {

	WorkBean select(int wid);
	
	List<WorkBean> select();
	
	WorkBean insert(WorkBean bean);
	
	WorkBean update(int wid , int mid , String picurl , int aid , String winfo , String wtitle , int wlike , int wissue , boolean iswmsg , boolean isscore , java.util.Date wstart , java.util.Date wend , String score_1 , String score_2 , String score_3 , String score_4 , String score_5 );
	
	boolean delete(int wid);
	
	
	
	//
	boolean updateScore(WorkBean bean);
	List<WorkBean> searchByTitle(String[] and,String[] or,String[] not,boolean content);
	boolean updateLike(Integer wid,Integer wlike);
}