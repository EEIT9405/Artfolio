package model.member2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberService2 {
	@Autowired
	private MemberDAO2 memberdao;
	@Transactional(readOnly=true)
	public MemberBean2 select(Integer mid){
		if(mid!=null){
			return memberdao.select(mid);
		}
		return null;
	}
	
	@Transactional(propagation=Propagation.MANDATORY)
	public boolean updatePoint(Integer mid,Integer point){
		if(mid!=null && point!=null)
		return memberdao.updatePoint(mid, point);
		return false;
	}
}
