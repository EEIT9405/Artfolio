package model.follow;

import java.util.List;

public interface FollowDAO {
	boolean insert(FollowBean bean);
	boolean delete(FollowBean bean);
	List<FollowBean> select(Integer mid);
	List<FollowBean> selectFollowed(Integer followid);
}
