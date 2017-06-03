package model.bounty;

import java.util.List;

public interface BountyDAO {

	BountyBean insertInfo(BountyBean bean);
	
	BountyBean update(BountyBean bean);

	List<BountyBean> select();

	BountyBean select(Integer b_id);

	boolean delete(Integer b_id);

}