package model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bmsg.BmsgBean;
import model.bmsg.BmsgDAO;
import model.bmsg.BmsgDAOHibernate;

@Repository
public class MemberDAOHibernate implements MemberDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	

//	public static void main(String[] args) {
//		try {
//			HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
//			SessionFactory session = HibernateUtil.getSessionFactory();
//			
//			MemberDAO memberDao = new MemberDAOHibernate(session);
//
//			
//			MemberBean bean = new MemberBean();
//			bean.setEmail("richwrc@yahoo.com.tw");;
//			bean.setName("AAA");;
//			bean.setPwd("123");;
//			memberDao.insert(bean);
//				
//			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();
//			HibernateUtil.getSessionFactory().getCurrentSession().close();
//		} finally {
//			HibernateUtil.closeSessionFactory();
//		}
//	}
	@Override
	public MemberBean insert(MemberBean bean) {
		if(bean!=null && bean.getMid()==null){
			this.getSession().saveOrUpdate(bean);
			return bean;
		}
		return null;
	}

	@Override
	public MemberBean select(Integer mid) {
		
		return  getSession().get(MemberBean.class, mid);
	}

	@Override
	public List<MemberBean> select() {
		return this.getSession().createQuery("FROM MemberBean",MemberBean.class).getResultList();
	}


	@Override
	public MemberBean update(MemberBean bean) {
		if(bean!=null && bean.getMid()!=null){
			this.getSession().saveOrUpdate(bean);
			return bean;
		}
		return null;
	}

	private static final String UPDATE_POINT="update MemberBean set point=? where mid=?";
	@Override
	public boolean updatePoint(Integer mid, Integer point) {
		if (mid != null && point!=null) {
			int i = this.getSession().createQuery(UPDATE_POINT)
					.setParameter(0, point)
					.setParameter(1, mid)
					.executeUpdate();
			if (i == 1) {
				return true;
				}
			}
		
		return false;
	}
	
}
