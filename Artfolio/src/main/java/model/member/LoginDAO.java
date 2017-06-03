package model.member;

import java.util.List;

public interface LoginDAO {
	List<MemberBean> select(String email);
	 List<MemberBean> select();
	 MemberBean select(Integer mid);
}
