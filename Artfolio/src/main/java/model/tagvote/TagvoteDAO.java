package model.tagvote;

import java.util.List;

public interface TagvoteDAO {
	boolean insert(TagvoteBean bean);
	boolean delete(TagvoteBean bean);
	List<TagvoteBean> select(Integer wid,String tag);
	List<TagvoteBean> select(Integer mid);
}
