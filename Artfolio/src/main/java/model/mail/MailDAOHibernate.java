package model.mail;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MailDAOHibernate implements MailDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	//測試
//	public static void main(String[] args){
//		
//		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
//		
//		try{
//			sessionFactory.getCurrentSession().beginTransaction();
//			
//			MailDAOHibernate dao = new MailDAOHibernate(HibernateUtil.getSessionFactory());
//insert
//			MailBean bean = new MailBean();
//			bean.setFromId(2);
//			bean.setToId(1);
//			bean.setMailtitle("XXXXX");
//			bean.setMailcontent("XXXXXXX?");
//			MailBean result = dao.insert(bean);
//			System.out.println(result);
		
//選取
//			MailBean bean = new MailBean();
//			bean.setMailid(7);
//			MailBean result = dao.getMailByPrimaryKey(bean);
//			System.out.println(result);
//			bean.setToId(1);
//			List<MailBean> result = dao.getMails(bean);
//			for(MailBean b:result){
//				System.out.println(b);
//			}
//			sessionFactory.getCurrentSession().getTransaction().commit();
//		}catch(Exception e){
//			e.printStackTrace();
//			sessionFactory.getCurrentSession().getTransaction().rollback();
//		}finally{
//			sessionFactory.getCurrentSession().close();
//			sessionFactory.close();
//		}	
//	}
	
	//  insert 
	@Override
	public MailBean insert(MailBean bean){
		if(bean!=null && bean.getMailid()==null){
			this.getSession().saveOrUpdate(bean);
			return bean;
		}
		return null;
	}

	//選取bymailid(pk)
	@Override
	public MailBean getMailByPrimaryKey(MailBean bean){
		return this.getSession().get(MailBean.class,bean.getMailid());
	}
	
	//選取byunDelete
	@Override
	public List<MailBean> getUnDeleteMails(MailBean bean){
		Query<MailBean> query = this.getSession().createQuery("FROM MailBean WHERE targetid=:targetid AND isdelete=0 and mstatus!=127 ORDER BY maildate DESC",MailBean.class);
		query.setParameter("targetid", bean.getToId());
		return query.getResultList();
	}
	
	//選取byDelete
	@Override
	public List<MailBean> getDeleteMails(MailBean bean){
		Query<MailBean> query = this.getSession().createQuery("FROM MailBean WHERE targetid=:targetid AND isdelete=1 and mstatus!=127 ORDER BY maildate DESC",MailBean.class);
		query.setParameter("targetid", bean.getToId());
		return query.getResultList();
	}
	
	//選取所有mails
	@Override
	public List<MailBean> getMails(){
		return this.getSession().createQuery("FROM MailBean ORDER BY maildate DESC",MailBean.class).getResultList();	
	}
	
	@Override	
	public MailBean update(MailBean bean){
		if(bean!=null && bean.getMailid()!=null){
			this.getSession().saveOrUpdate(bean);
			return bean;
		}
		return null;	
	}
}
