package model.bounty;

import org.hibernate.Session;
import org.hibernate.SessionFactory;



public class BountyTagDAOHibernate {
	private SessionFactory sessionFactory;
	public BountyTagDAOHibernate(SessionFactory sessionFactory){
		this.sessionFactory=sessionFactory;
	}
	public Session getSessioin(){
		return sessionFactory.getCurrentSession();
	}
	

	
	
	
	
	
	
	
	
	
	
	
}
