package model.donate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.member2.MemberService2;


@Service
public class DonateService {
	@Autowired
	private DonateDAO donatedao;
	@Autowired
	private MemberService2 memberService;
	
	@Transactional
	public boolean insert(DonateBean bean){
		if(bean!=null)
		return donatedao.insert(bean) 
				&& memberService.updatePoint(bean.getMid(), 
						memberService.select(bean.getMid()).getPoint()-bean.getPoint())
				&& memberService.updatePoint(bean.getTargetid(), 
						memberService.select(bean.getTargetid()).getPoint()+bean.getPoint());
		return false;
	}
	
	@Transactional(readOnly=true)
	public List<DonateBean> select(Integer mid){
		if(mid!=null)
		return donatedao.select(mid);
		return null;
	}
	@Transactional(readOnly=true)
	public List<DonateBean> selectDonated(Integer targetid){
		if(targetid!=null)
		return donatedao.selectDonated(targetid);
		return null;
	}
}
