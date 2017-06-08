package model.member;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
		return  memberdao.select(mid);
	}
	
	
}
