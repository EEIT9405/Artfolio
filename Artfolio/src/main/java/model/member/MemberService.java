package model.member;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MemberService {
	@Autowired
	private MemberDAO memberdao;

	public MemberBean insert(MemberBean bean) {
		MemberBean result = null;
		if(bean!=null) {
			result = memberdao.insert(bean);
		}
		return result;
	}
	public MemberBean update(MemberBean bean) {
		MemberBean result = null;
		if(bean!=null) {
			result = memberdao.update(bean);
		}
		return result;
	}
	public List<MemberBean> select(MemberBean bean) {
		List<MemberBean> result = null;
		if(bean!=null && bean.getMid()!=0) {
			MemberBean temp = memberdao.select( bean.getMid());
			if(temp!=null) {
				result = new ArrayList<MemberBean>();
				result.add(temp);
			}
		} else {
			result = memberdao.select(); 
		}
		return result;
	}
	
	public MemberBean select(Integer mid){
		if(mid!=null)
			return  memberdao.select(mid);
		return null;
	}
	
	//////////////
	
	@Transactional(propagation=Propagation.MANDATORY)
	public boolean updatePoint(Integer mid,Integer point){
		if(mid!=null && point!=null)
		return memberdao.updatePoint(mid, point);
		return false;
	}
	
}
