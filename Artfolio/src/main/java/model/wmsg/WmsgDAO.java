package model.wmsg;

import java.util.List;

public interface WmsgDAO {
	
	public WmsgBean insert(WmsgBean bean);
	public WmsgBean update(WmsgBean bean);
	public boolean delete(Integer wmsgid);
	public List<WmsgBean> selectAll(Integer wid);
	public WmsgBean select(Integer wmsgid);
}
