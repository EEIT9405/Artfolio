package model.member;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;




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

	private static final String SEARCH_BY_NAME="from MemberBean where";
	private final String AND=" and",OR=" or",NOT=" not",LB=" (",RB=")",LIKE=" name like ?";
	@Override
	public List<MemberBean> searchByName(String[] and,String[] or,String[] not) {
		List<MemberBean> list=null;
		StringBuilder condition=new StringBuilder(SEARCH_BY_NAME);
		boolean t=true;
		if(and!=null){
			for(int i=0;i<and.length;i++){
				if(i==0){
					condition.append(LIKE);
					t=false;
				}else{
					condition.append(AND).append(LIKE);
				}
			}
		}
		if(or!=null){
			for(int i=0;i<or.length;i++){
				if(t){
					condition.append(LB).append(LIKE);
					t=false;
				}else if(i==0){
					condition.append(AND).append(LB).append(LIKE);
				}else{
					condition.append(OR).append(LIKE);
				}
			}
			condition.append(RB);
		}
		if(not!=null){
			for(int i=0;i<not.length;i++){
				if(t){
					condition.append(NOT).append(LB).append(LIKE);
					t=false;
				}else if(i==0){
					condition.append(AND).append(NOT).append(LB).append(LIKE);
				}else{
					condition.append(OR).append(LIKE);
				}
			}
			condition.append(RB);
		}
		System.out.println(condition.toString());
		if (!t) {
			Query<MemberBean> query=this.getSession().createQuery(condition.toString(),MemberBean.class);
			list=new ArrayList<>();
			int i=0;
			if(and!=null)
				i=set(query,and,i);
				
			if(or!=null)
				i=set(query,or,i);	
				
			if(not!=null)
				i=set(query,not,i);	
				
			list=query.list();
		}
			
		return list;
	}

	private int set(Query<?> stmt,String[] conditions,int count){
		for(String c:conditions){
			stmt.setParameter(count++, "%"+c+"%");
		}
		return count;
	}
}
