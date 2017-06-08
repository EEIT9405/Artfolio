package model.bounty;

import java.util.List;

import model.bounty.BountyTrackBean;

public interface BountyTrackDAO {

	List<BountyTrackBean> select(Integer mid);
	
	//selectall
	List<BountyTrackBean> select();

	//select
	BountyTrackBean select(BountyTrackBean bean);
	
	long countAllTracks(Integer b_id);

	//insert
	BountyTrackBean insert(BountyTrackBean bean);

	//delete
	boolean deleteByB_Id(BountyTrackBean bean);
	boolean delete(BountyTrackBean bean);

}