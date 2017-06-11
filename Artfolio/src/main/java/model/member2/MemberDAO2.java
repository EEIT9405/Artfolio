package model.member2;

public interface MemberDAO2 {
	MemberBean2 select(Integer mid);
	boolean updatePoint(Integer mid,Integer point);
	
}
