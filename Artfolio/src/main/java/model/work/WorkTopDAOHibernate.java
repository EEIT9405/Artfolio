package model.work;

import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WorkTopDAOHibernate implements WorkTopDAO {
	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	private static final String UPDATE_ISSUE = "update WorkBean set wissue=? where wid=?";

	@Override
	public boolean update(int issue, int wid) {
		return getSession().createQuery(UPDATE_ISSUE).setParameter(0, issue).setParameter(1, wid).executeUpdate() > 0
				? true : false;
	}

	private static final String SELECT_BY_ISSUE = "from WorkBean where wissue=? order by wlike desc";

	@Override
	public List<WorkBean> selectByIssue(int issue, int top) {
		Query query = getSession().createQuery(SELECT_BY_ISSUE, WorkBean.class).setParameter(0, issue)
				.setMaxResults(top);
		return query.getResultList();
	}

	private static final String SELECT_ISSUE_NO_DESC = "select wissue from WorkBean order by wissue desc";
	private static final String SELECT_ISSUE_NO = "select wissue from WorkBean";
	@Override
	public Set<Integer> selectIssueNO(boolean isNow) {
		if (isNow) {
			List<Integer> top1 = getSession().createQuery(SELECT_ISSUE_NO_DESC).setMaxResults(1).getResultList();
			return new HashSet<Integer>(top1);
		}else{
			List<Integer> list = getSession().createQuery(SELECT_ISSUE_NO_DESC).getResultList();
			return new LinkedHashSet<Integer>(list);
		}
	}

	private static final String SELECT_TOP = "from WorkBean where wissue=? order by wlike desc";

	@Override
	public List<WorkBean> selectTop(int issue) {
		return getSession().createQuery(SELECT_TOP, WorkBean.class).setParameter(0, issue).getResultList();
	}
}
