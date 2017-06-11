package model.browsed;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.member.MemberBean;
import model.work.WorkBean;

@Repository
public class BrowsedDAOHitbernate implements BrowsedDAO {
	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public boolean insert(BrowsedBean bean) {
		if (bean != null) {
			if (selectOne(bean.getMid(), bean.getWorkBean()) == null)
				return Integer.parseInt(getSession().save(bean).toString()) > 0 ? true : false;
		}
		return false;
	}

	@Override
	public boolean update(BrowsedBean bean) {
		// TODO Auto-generated method stub
		return false;
	}

	private static final String SELECT_ALL = "from BrowsedBean where mid=?";

	@Override
	public List<BrowsedBean> selectAll(MemberBean memberBean) {
		if (memberBean != null)
			return getSession().createQuery(SELECT_ALL, BrowsedBean.class).setParameter(0, memberBean.getMid())
					.getResultList();
		return null;
	}

	private static final String SELECT_ONE = "from BrowsedBean where mid=? and wid=?";

	@Override
	public BrowsedBean selectOne(Integer mid, WorkBean workBean) {

		List<BrowsedBean> list = getSession().createQuery(SELECT_ONE, BrowsedBean.class).setParameter(0, mid)
				.setParameter(1, workBean).getResultList();
		if (list != null && !list.isEmpty()) {
			return list.get(0);
		}
		return null;
	}

	private static final String SELECT_BY_WORK = "from BrowsedBean where wid=? and mid !=? order by browseddate desc";

	@Override
	public List<BrowsedBean> selectByWork(Integer mid, Integer wid) {
		if (wid != null) {
			Query query = getSession().createQuery(SELECT_BY_WORK, BrowsedBean.class).setParameter(0, wid).setParameter(1, mid).setMaxResults(5);
			return query.getResultList();
		}
		return null;
	}
}
