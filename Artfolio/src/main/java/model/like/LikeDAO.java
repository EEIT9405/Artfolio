package model.like;

import java.util.List;


public interface LikeDAO {
	boolean insert(LikeBean bean);
	boolean delete(LikeBean bean);
	List<LikeBean> select(Integer mid);
	List<LikeBean> selectLiked(Integer wid);
}
