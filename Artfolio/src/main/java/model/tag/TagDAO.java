package model.tag;

import java.util.List;

public interface TagDAO {
	boolean insert(TagBean bean);
	List<TagBean> select(Integer wid);
	boolean delete(TagBean bean);
	boolean update(TagBean bean);
}
