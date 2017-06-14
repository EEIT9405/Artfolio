package model.album;

import java.util.List;

public interface AlbumDAO {

	AlbumBean select(Integer aid);
	
	List<AlbumBean> select();

	AlbumBean insert(AlbumBean bean);
	
	AlbumBean update( Integer aid,String aname,Integer wid,Integer mid,java.util.Date adate);
	
	boolean delete(Integer aid);

}