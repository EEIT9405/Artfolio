package model.work;

import java.util.List;
import java.util.Set;

public interface WorkTopDAO {
	
	public boolean update(int issue, int wid);
	public List<WorkBean> selectByIssue(int issue, int top);
	public Set<Integer> selectIssueNO(boolean isNow);
	public List<WorkBean> selectTop(int issue);
}
