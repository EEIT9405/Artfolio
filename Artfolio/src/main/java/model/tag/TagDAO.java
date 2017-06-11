package model.tag;

import java.util.List;

public interface TagDAO {
	boolean insert(TagBean bean);
	List<TagBean> select(Integer wid);
	List<Integer> search(String[] and,String[] or,String[] not); 
	boolean delete(TagBean bean);
	boolean lock(TagBean bean);
	boolean vote(TagBean bean);
}
