package model.browsed;

import java.util.List;

import model.member.MemberBean;
import model.work.WorkBean;

public interface BrowsedDAO {
	
	public boolean insert(BrowsedBean bean);
	public boolean update(BrowsedBean bean);
	public List<BrowsedBean> selectAll(MemberBean memberBean);
	public BrowsedBean selectOne(Integer mid, WorkBean workBean);
	public List<BrowsedBean> selectByWork(Integer mid, Integer wid); 
}
