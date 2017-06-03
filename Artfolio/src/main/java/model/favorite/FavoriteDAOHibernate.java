package model.favorite;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.tag.TagBean;

@Repository
public class FavoriteDAOHibernate implements FavoriteDAO {

	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public void insert(FavoriteBean favoriteBean) {
		if (favoriteBean != null) {
			getSession().save(favoriteBean);
			getSession().clear();
		}
	}

	private static final String UPDATE = "update FavoriteBean set fcount=? where mid=? and tag=?";

	@Override
	public int update(int mid, String tag) {
		int upcount = 0;
		if (tag != null) {
			int count = selectCount(mid, tag);
			upcount += getSession().createQuery(UPDATE).setParameter(0, count + 1).setParameter(1, mid)
					.setParameter(2, tag).executeUpdate();
		}
		return upcount;
	}

	private static final String SELECT = "from FavoriteBean where mid=? and tag=?";

	@Override
	public FavoriteBean select(int mid, String tag) {
		List<FavoriteBean> list = getSession().createQuery(SELECT, FavoriteBean.class).setParameter(0, mid)
				.setParameter(1, tag).getResultList();
		if (list != null && !list.isEmpty())
			return list.get(0);
		return null;
	}

	private static final String SELECT_COUNT = "select fcount from FavoriteBean where mid=? and tag=?";

	@Override
	public int selectCount(int mid, String tag) {
		List<Integer> list = getSession().createQuery(SELECT_COUNT).setParameter(0, mid).setParameter(1, tag)
				.getResultList();
		return list.get(0);
	}
}
