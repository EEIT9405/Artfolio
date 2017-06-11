package model.expoint;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.member2.MemberService2;

@Service
public class ExpointService {
	@Autowired
	private ExpointDAO expointdao;
	@Autowired
	private MemberService2 memberService;
	
	@Transactional
	public boolean insert(ExpointBean bean,Integer current){
		if (bean!=null && current!=null)
		return expointdao.insert(bean) && 
				memberService.updatePoint(bean.getMid(), bean.getPtype()?current+bean.getPoint():current-bean.getPoint());
		return false;
	}
	
	@Transactional(readOnly=true)
	public List<ExpointBean> select(Integer mid){
		if(mid!=null)
		return expointdao.select(mid);
		return null;
	}
	
}
