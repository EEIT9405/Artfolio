package model.member;

import java.util.List;

public interface MemberDAO {
	MemberBean insert(MemberBean bean);
	MemberBean select(Integer mid);

	List<MemberBean> select();
	MemberBean update(MemberBean bean);
	
	
	boolean updatePoint(Integer mid,Integer point);
}
