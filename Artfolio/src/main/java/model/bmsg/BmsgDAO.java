package model.bmsg;

import java.util.List;

public interface BmsgDAO {
   
	BmsgBean insert(BmsgBean bean);
	BmsgBean select(Integer b_msgid);

	List<BmsgBean> select();
	
	List<BmsgBean> selectByBid(Integer b_id);
	
	
	boolean delete(Integer b_msgid);
	BmsgBean update(BmsgBean bean);
}
