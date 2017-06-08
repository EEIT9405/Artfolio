package model.bounty;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Repository;

import model.bounty.BountyTrackBean;

@Repository
public class BountyTrackDAOHibernate implements BountyTrackDAO {
	@Autowired
	private SessionFactory sessionFactory;
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	//測試
	public static void main(String[]args){
		
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.cfg.xml");	
		SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
		
	
		try {
			sessionFactory.getCurrentSession().beginTransaction();
			BountyTrackDAOHibernate dao = (BountyTrackDAOHibernate) context.getBean("bountyTrackDAOHibernate");			
			BountyTrackBean bean = new BountyTrackBean();
			bean.setB_id(2);
			bean.setMid(2);		
			try {
				BountyTrackBean result = dao.insert(bean);
				System.out.println(result);
			} catch (Exception e) {
				System.out.println("error");
			}
//			在查詢資料時，必須指定主鍵資訊，例如：
//			BountyTrackBean pk = new BountyTrackBean();
//			pk.setB_id(5);
//			pk.setMid(2);        
//			BountyTrackBean bean = dao.select(pk);	       
//			System.out.println(bean);
			
//			BountyTrackBean bean = new BountyTrackBean();
//			bean.setB_id(2);
//			bean.setMid(2);
//			boolean r = dao.delete(bean);
//			System.out.println(r);
//			List<BountyTrackBean> result = dao.select();
//			System.out.println(result);
			
//			BountyTrackBean bean = new BountyTrackBean();
//			bean.setB_id(6);	
//			boolean result = dao.deleteByB_Id(bean);
//			System.out.println(result);
//					
			sessionFactory.getCurrentSession().getTransaction().commit();
		} catch (HibernateException e) {
			sessionFactory.getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
		}finally{
			sessionFactory.getCurrentSession().close();
			sessionFactory.close();
		}
		((ConfigurableApplicationContext)context).close();
	}
	
	
	//select count(*) from tb_track where b_id=1
	@Override
	public long countAllTracks(Integer b_id){
		Query query = this.getSession().createQuery("SELECT COUNT(*) FROM BountyTrackBean WHERE b_id=:b_id");
		query.setParameter("b_id", b_id);
		return (Long) query.getResultList().get(0);
	}
	
	@Override
	public List<BountyTrackBean> select(Integer mid){
		Query<BountyTrackBean> query = this.getSession().createQuery("From BountyTrackBean where mid=:mid",BountyTrackBean.class);
		query.setParameter("mid", mid);
		return query.getResultList();
	}
	
	@Override
	public List<BountyTrackBean> select(){
		return this.getSession().createQuery("From BountyTrackBean",BountyTrackBean.class).getResultList();
	}
	
	@Override
	public BountyTrackBean select(BountyTrackBean bean){
		return this.getSession().get(BountyTrackBean.class, bean);	
	}
	
	@Override
	public BountyTrackBean insert(BountyTrackBean bean) {
		if(bean!=null) {
				this.getSession().save(bean);
				return bean;
			}
		return null;
	}

	@Override
	public boolean deleteByB_Id(BountyTrackBean bean){	
		boolean result = false;
		int n = 0;
		if(bean!=null){
			Query query = this.getSession().createQuery("DELETE FROM BountyTrackBean where b_id=:b_id");
			query.setParameter("b_id", bean.getB_id());
			n = query.executeUpdate();
		}
		if(n!=0){
			result = true;
		}
		return result;
	}
	
	@Override
	public boolean delete(BountyTrackBean bean){
		BountyTrackBean b = this.select(bean);
		if(b!=null) {
			this.getSession().delete(b);
			return true;
		}
		return false;
	}
}
