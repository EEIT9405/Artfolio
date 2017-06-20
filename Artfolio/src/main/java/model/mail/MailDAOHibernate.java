package model.mail;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Repository;

import model.mail.MailBean;
import model.member.MemberBean;

@Repository
public class MailDAOHibernate implements MailDAO {
	@Autowired
	private SessionFactory sessionFactory;
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	//測試
	public static void main(String[] args){
		
		
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.cfg.xml");	
		SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");

		
		try{
			sessionFactory.getCurrentSession().beginTransaction();
			MailDAOHibernate dao =  (MailDAOHibernate) context.getBean("mailDAOHibernate");

//insert
//			MailBean bean = new MailBean();
//			bean.setFromId(2);
//			bean.setToId(1);
//			bean.setMailtitle("XXXXX");
//			bean.setMailcontent("XXXXXXX?");
//			MailBean result = dao.insert(bean);
//			System.out.println(result);
		
//選取
			MailBean bean = new MailBean();
			bean.setMailid(7);
			MailBean result = dao.getMailByPrimaryKey(bean);
			System.out.println(result);
//			bean.setToId(1);
//			List<MailBean> result = dao.getMails(bean);
//			for(MailBean b:result){
//				System.out.println(b);
//			}
			sessionFactory.getCurrentSession().getTransaction().commit();
		}catch(Exception e){
			e.printStackTrace();
			sessionFactory.getCurrentSession().getTransaction().rollback();
		}finally{
			sessionFactory.getCurrentSession().close();
			sessionFactory.close();
		
		((ConfigurableApplicationContext)context).close();
	}
}
	
	//  insert 
	@Override
	public MailBean insert(MailBean bean){
		if(bean!=null && bean.getMailid()==null){
			this.getSession().saveOrUpdate(bean);
			return bean;
		}
		return null;
	}

	//選取byreid		//select * from tb_mail where mailid=2 or reid=2 order by maildate 
	@Override
	public List<MailBean> getReplyMails(Integer id){
		Query<MailBean> query = this.getSession().createQuery("FROM MailBean WHERE mailid=:mailid or reid=:reid order by maildate",MailBean.class);
		query.setParameter("mailid", id);
		query.setParameter("reid", id);
		return query.getResultList();
	}
	
	//選取bymailid(pk)
	@Override
	public MailBean getMailByPrimaryKey(MailBean bean){
		return this.getSession().get(MailBean.class,bean.getMailid());
	}
	
	//選取byunDelete
	@Override
	public List<MailBean> getUnDeleteMails(MailBean bean){
		Query<MailBean> query = this.getSession().createQuery("FROM MailBean WHERE targetid=:targetid AND isdelete=0 AND mstatus!=127 ORDER BY maildate DESC",MailBean.class);
		query.setParameter("targetid", bean.getToId());
		return query.getResultList();
	}
	
	//選取byDelete
	@Override
	public List<MailBean> getDeleteMails(MailBean bean){
		Query<MailBean> query = this.getSession().createQuery("FROM MailBean WHERE targetid=:targetid AND isdelete=1 AND mstatus!=127 ORDER BY maildate DESC",MailBean.class);
		query.setParameter("targetid", bean.getToId());
		return query.getResultList();
	}
	
	//選取by未讀
	@Override
	public List<MailBean> getUnReadMails(MailBean bean){
		Query<MailBean> query = this.getSession().createQuery("FROM MailBean WHERE targetid=:targetid AND isread=0 AND mstatus!=127 ORDER BY maildate DESC",MailBean.class);
		query.setParameter("targetid", bean.getToId());
		return query.getResultList();
	}
	
	//選取by已讀
	@Override
	public List<MailBean> getReadMails(MailBean bean){
		Query<MailBean> query = this.getSession().createQuery("FROM MailBean WHERE targetid=:targetid AND isread=1 AND mstatus!=127 ORDER BY maildate DESC",MailBean.class);
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
	
	// create method by Lin Teiu
		private static final String SELECT_REPORT_MAILS = "from MailBean where (toId=1 or toId=?) and isdelete != 1 and mstatus=3 and reid=null order by maildate desc";

		@Override
		public List<MailBean> selectReportMails(MemberBean admin) {
			if (admin != null)
				return getSession().createQuery(SELECT_REPORT_MAILS, MailBean.class).setParameter(0, admin.getMid()).getResultList();
			return null;
		}
		// create method by Lin Teiu
		private static final String SELECT_SERVICE_MAILS = "from MailBean where (toId=1 or toId=?) and isdelete != 1 and mstatus=2 and reid=null order by maildate desc";
		@Override
		public List<MailBean> selectServiceMails(MemberBean admin) {
			if (admin != null)
				return getSession().createQuery(SELECT_SERVICE_MAILS, MailBean.class).setParameter(0, admin.getMid()).getResultList();
			return null;
		}
		// create method by Lin Teiu
		private static final String SELECT_JUNK_MAILS = "from MailBean where toId=? and isdelete=1 and reid=null order by maildate desc";
		@Override
		public List<MailBean> selectJunkMails(MemberBean admin) {
			if (admin != null)
				return getSession().createQuery(SELECT_JUNK_MAILS, MailBean.class).setParameter(0, admin.getMid()).getResultList();
			return null;
		}
}
