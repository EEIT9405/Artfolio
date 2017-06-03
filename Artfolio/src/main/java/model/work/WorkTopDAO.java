package model.work;

import java.util.List;
import java.util.Map;

public interface WorkTopDAO {
	
	public boolean update(int issue, int wid);
	public List<WorkBean> selectByIssue(int issue, int top);
	public int selectIssueNO();
	public List<WorkBean> selectTop(int issue);
}
