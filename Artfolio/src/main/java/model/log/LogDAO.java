package model.log;

import java.util.List;

public interface LogDAO {
	
	public List<LogBean> selectAll(boolean isContainExpired, boolean isDesc);
	public boolean insert(LogBean bean);
	public LogBean update(LogBean bean);
	public LogBean select(Integer logid);
}
