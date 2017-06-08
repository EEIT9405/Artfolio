package model.member;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class LoginService {
	
	@Autowired
	private LoginDAO loginDaO;
//	public static void main(String[] args) {
//		LoginService loginService = new LoginService(new LoginDAOHibernate(HibernateUtil.getSessionFactory()));
//		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
//		try {
//			sessionFactory.getCurrentSession().beginTransaction();
//
//			MemberBean result = loginService.login("asd@gamil.com", "a123");
//			System.out.println(result);
//
//			sessionFactory.getCurrentSession().getTransaction().commit();
//		} catch (HibernateException e) {
//			sessionFactory.getCurrentSession().getTransaction().rollback();
//			e.printStackTrace();
//		} finally {
//			sessionFactory.getCurrentSession().close();
//			sessionFactory.close();
//		}
//	}
	
	public MemberBean login(String email, String password) {
		List<MemberBean> bean = loginDaO.select(email);
		if (bean.size() != 0) {
			if (password != null && password.length() != 0) {
				String temp = bean.get(0).getPwd();
				if (temp.equals(password)) {
					for (MemberBean b : bean) {
						return b;
					}
				}
			}
		}
		return null;
	}
	
	public MemberBean selectById(Integer mid){
		return loginDaO.select(mid);
	}
	
	//2017/06/07新增 
	public List<MemberBean> select(String email) {
		List<MemberBean> result=null;
		if(email!=null){
			 result = loginDaO.select(email);
		}
		return result;
	}
	
	
	
}
