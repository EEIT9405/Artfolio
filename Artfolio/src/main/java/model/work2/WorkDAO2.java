package model.work2;

import java.util.List;

public interface WorkDAO2 {
	WorkBean2 select(Integer wid);
	boolean updateScore(WorkBean2 bean);
	List<WorkBean2> searchByTitle(String[] and,String[] or,String[] not,boolean content);
	boolean updateLike(Integer wid,Integer wlike);
}
