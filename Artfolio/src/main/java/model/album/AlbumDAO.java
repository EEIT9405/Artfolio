package model.album;

import java.util.List;

public interface AlbumDAO {

	AlbumBean select(int aid);
	
	List<AlbumBean> select();

	AlbumBean insert(AlbumBean bean);
	
	AlbumBean update( int aid,String aname,int wid,int mid,java.util.Date adate);
	
	boolean delete(int aid);

}