package model.member;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.member.LoginDAO;
import model.member.MemberBean;

@Repository
public class LoginDAOHibernate implements LoginDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	
//public static void main(String[] args) {
//		
//		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
//		try {
//			sessionFactory.getCurrentSession().beginTransaction();
//			
//			LoginDAOHibernate dao = new LoginDAOHibernate(sessionFactory);
//			List<MemberBean> reslut = dao.select("asd@gamil.com");
//			System.out.println(reslut);
//			
//			sessionFactory.getCurrentSession().getTransaction().commit();
//		} catch (HibernateException e) {
//			sessionFactory.getCurrentSession().getTransaction().rollback();
//			e.printStackTrace();
//		}finally{
//			sessionFactory.getCurrentSession().close();
//			sessionFactory.close();
//		}	
//	}
	@Override
	public List<MemberBean> select(String email) {
		Query<MemberBean> query = this.getSession().createQuery("FROM MemberBean where email=:email",MemberBean.class);
		query.setParameter("email", email);
		return query.getResultList();
	}

	@Override
	public List<MemberBean> select() {
		return this.getSession().createQuery("FROM MemberBean",MemberBean.class).getResultList();
	}
	//selectByPrimaryKey
		public MemberBean select(Integer mid){
			return this.getSession().get(MemberBean.class, mid);
		}

}
