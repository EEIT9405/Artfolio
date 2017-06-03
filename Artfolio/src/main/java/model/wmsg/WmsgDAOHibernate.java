package model.wmsg;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WmsgDAOHibernate implements WmsgDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public WmsgBean insert(WmsgBean bean) {
		int wmsgid = 0;
		if(bean != null){
			wmsgid = Integer.parseInt(getSession().save(bean).toString());
			getSession().clear();
		}
		if(wmsgid > 0){
			return select(wmsgid);
		}
		return null;
	}

	private static final String UPDATE = "update WmsgBean set wmsgcontent=? where wmsgid=?";
	@Override
	public WmsgBean update(WmsgBean bean) {
		int count = 0;
		if(bean != null){
			count = getSession().createQuery(UPDATE).setParameter(0, bean.getWmsgcontent()).setParameter(1, bean.getWmsgid()).executeUpdate();
			getSession().clear();
		}
		if(count > 0){
			return select(bean.getWmsgid());
		}
		return null;
	}

	private static final String DELETE = "delete from WmsgBean where wmsgid=?";
	@Override
	public boolean delete(Integer wmsgid) {
		return getSession().createQuery(DELETE).setParameter(0, wmsgid).executeUpdate() > 0? true: false;
	}

	private static final String SELECT_ALL = "from WmsgBean where wid=?";
	@Override
	public List<WmsgBean> selectAll(Integer wid) {
		return getSession().createQuery(SELECT_ALL, WmsgBean.class).setParameter(0, wid).getResultList();
	}

	@Override
	public WmsgBean select(Integer wmsgid) {
		return getSession().get(WmsgBean.class, wmsgid);
	}
}
