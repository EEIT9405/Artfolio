package model.bmsg;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class BmsgDAOHibernate implements BmsgDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public BmsgBean select(Integer b_msgid) {
		return getSession().get(BmsgBean.class, b_msgid);
	}
	@Override
	public BmsgBean insert(BmsgBean bean) {
		if(bean!=null && bean.getB_msgid()==null){
			this.getSession().saveOrUpdate(bean);
			getSession().clear();
			return bean;
		}
		return null;
	}

	

	@Override
	public List<BmsgBean> select() {
		return this.getSession().createQuery("FROM BmsgBean",BmsgBean.class).getResultList();
	}
	@Override
	public boolean delete(Integer b_msgid) {
		BmsgBean bean = this.select(b_msgid);
		if(bean!=null) {
			this.getSession().delete(bean);
			return true;
		}
		return false;
	}
	
	
	public BmsgBean update(BmsgBean bean) {
		if(bean!=null && bean.getB_msgid()!=null){
			this.getSession().saveOrUpdate(bean);
			return bean;
		}
		return null;
	}
	@Override
	public List<BmsgBean> selectByBid(Integer b_id) {
		
		Query<BmsgBean> query = getSession().createQuery("FROM BmsgBean where b_id=? ORDER BY b_msgid DESC",BmsgBean.class).setParameter(0, b_id);	
		return query.getResultList();
	}
}
