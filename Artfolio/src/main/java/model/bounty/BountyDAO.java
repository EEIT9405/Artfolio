package model.bounty;

import java.util.List;

import model.bounty.BountyBean;

public interface BountyDAO {

	//新增活動資料
	BountyBean insertInfo(BountyBean bean);
	
	//查詢活動資訊
	List<BountyBean> select();

	//查詢活動資訊by pk
	BountyBean select(Integer b_id);
	List<BountyBean> selectByMember(Integer mid);
	
	
	//根據獎金查詢
	List<BountyBean> selectByBouns(Integer min, Integer max);
	List<BountyBean> selectByBouns(Integer max);

	//根據BySelector
	List<BountyBean> selectByClick();
	List<BountyBean> selectByUpdateDate();
	List<BountyBean> selectByMaxBouns();
	List<BountyBean> selectByState(Integer b_state);
	List<BountyBean> selectByTags(String b_tag);
	
	boolean delete(Integer b_id);
	BountyBean update(BountyBean bean);
	
	boolean stateUpdate(Integer b_id, Integer b_state);
	
	//系統時鐘
	public boolean updateByDate(int state);

}