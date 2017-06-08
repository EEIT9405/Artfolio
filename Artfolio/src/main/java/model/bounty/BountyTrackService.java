package model.bounty;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BountyTrackService {
	@Autowired
	private BountyTrackDAO bountyTrackDao;
	@Autowired
	private BountyDAO bountyDAO;

	//測試
	public static void main(String[] args) {
		
		
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.cfg.xml");
		SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
		sessionFactory.getCurrentSession().beginTransaction();
		try{
		BountyTrackService service = (BountyTrackService) context.getBean("bountyTrackService");
		BountyService bountyService = (BountyService) context.getBean("bountyService");
		
		List<BountyBean> bountys = new ArrayList<BountyBean>();	
		List<BountyTrackBean> result = service.select(2);
		for(BountyTrackBean b:result){	
			BountyBean bounty = bountyService.selectById(b.getB_id());
			bountys.add(bounty);
		}
		
		for(BountyBean bb:bountys){
			System.out.println(bb.getB_title());
		}
		
		
//		boolean result = service.delete(6);
//		System.out.println(result);
		
		sessionFactory.getCurrentSession().getTransaction().commit();
		}catch(Exception e){
			sessionFactory.getCurrentSession().getTransaction().rollback();;
		}finally{
		}
			sessionFactory.getCurrentSession().close();
			sessionFactory.close();
			
		((ConfigurableApplicationContext)context).close();		
	}
	
	//利用會員ID取得所有追蹤活動id
	public List<BountyTrackBean> select(Integer mid) {
		List<BountyTrackBean> mList = bountyTrackDao.select(mid);
		return mList;
	}

	//新增追蹤
	public boolean insert(Integer mid, Integer b_id) {
		BountyTrackBean bean = new BountyTrackBean();
		bean.setMid(mid);
		bean.setB_id(b_id);
		BountyTrackBean b = bountyTrackDao.select(bean);
		System.out.println(b);
		boolean result= false;
		if(b==null){
			BountyTrackBean in = bountyTrackDao.insert(bean);
			if (in != null) {
				result= true;
			}else{
				return result;
			}
		}else{
			return result;
		}	
		return result;
	}

	//刪除追蹤by b_id
	public boolean delete(Integer b_id){		
		BountyTrackBean bean = new BountyTrackBean();
		bean.setB_id(b_id);
		boolean result = false;
		if(bean!=null) {
			result = bountyTrackDao.deleteByB_Id(bean);
		}
		return result;
	}
	
	//刪除追蹤by PK(複合主鍵)
	public boolean delete(Integer mid ,Integer b_id) {
		BountyTrackBean bean = new BountyTrackBean();
		bean.setMid(mid);
		bean.setB_id(b_id);
		boolean result = false;
		if(bean!=null) {
			result = bountyTrackDao.delete(bean);
		}
		return result;
	}
	
	
	//
	public long countAllTracks(Integer b_id){	
		return bountyTrackDao.countAllTracks(b_id);
	}
}
