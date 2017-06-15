package model.album;

import java.util.List;

public interface AlbumDAO {

	AlbumBean select(Integer aid);
	
	List<AlbumBean> select();

	AlbumBean insert(AlbumBean bean);
	
	AlbumBean update(AlbumBean bean);
	
	boolean delete(Integer aid);
	
	List<AlbumBean> selectByMid(Integer mid);

}