package model.bmsg;

import java.util.List;

public interface BmsgDAO {
   
	BmsgBean insert(BmsgBean bean);
	BmsgBean select(Integer b_msgid);

	List<BmsgBean> select();
	
	List<BmsgBean> selectByBid(Integer b_id);
	
	boolean delete(Integer b_msgid);
	BmsgBean update(BmsgBean bean);
	//6/7
	long countAllMsgs(Integer b_id);
	//6/12
	boolean deleteByB_id(Integer b_id);
}
