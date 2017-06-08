package model.log;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LogDAOHibernate implements LogDAO {
	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	private static final String SELECT_ALL = "from LogBean order by logdate";
	private static final String SELECT_VALIDITY = "from LogBean where lstatus= 0 or getDate() - logdate < 7 order by logdate";

	@Override
	public List<LogBean> selectAll(boolean isContainExpired, boolean isDesc) {
		if (isContainExpired) {
			return isDesc ? getSession().createQuery(SELECT_ALL + " DESC", LogBean.class).getResultList()
					: getSession().createQuery(SELECT_ALL, LogBean.class).getResultList();
		} else {
			return isDesc ? getSession().createQuery(SELECT_VALIDITY + " DESC", LogBean.class).getResultList()
					: getSession().createQuery(SELECT_VALIDITY, LogBean.class).getResultList();
		}
	}

	@Override
	public boolean insert(LogBean bean) {
		if (bean != null)
			return Integer.parseInt(getSession().save(bean).toString()) > 0 ? true : false;
		return false;
	}
	
	private static final String UPDATE = "update LogBean set logdate= getDate(), lstatus=1 where logid=?";
	@Override
	public LogBean update(LogBean bean) {
		int count = 0;
		if(bean != null){
			count = getSession().createQuery(UPDATE).setParameter(0, bean.getLogid()).executeUpdate();
			getSession().clear();
		}
		if(count > 0){
			return getSession().get(LogBean.class, bean.getLogid());
		}
		return null;
	}

	@Override
	public LogBean select(Integer logid) {
		if(logid != null){
			return getSession().get(LogBean.class, logid);
		}
		return null;
	}
}
