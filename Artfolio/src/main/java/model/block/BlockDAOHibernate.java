package model.block;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Repository;

import model.member.MemberBean;

@Repository
public class BlockDAOHibernate implements BlockDAO {
	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.config.xml");
		BlockDAOHibernate dao = (BlockDAOHibernate) context.getBean("blockDAOHibernate");
		BlockBean bean = new BlockBean();
		bean.setMyBean(new MemberBean());
		bean.setTargetBean(new MemberBean());
		dao.insert(bean);

		((ConfigurableApplicationContext) context).close();
	}

	@Override
	public boolean insert(BlockBean bean) {
		System.out.println("bean=" + bean.getMyBean().getMid());
		if (bean != null) {
			List<BlockBean> select = this.selectOne(bean.getMyBean(), bean.getTargetBean());

			if (select == null || select.isEmpty()) {
				return Integer.parseInt(getSession().save(bean).toString()) > 0 ? true : false;
			}
		}
		return false;
	}

	private static final String DELETE = "delete from BlockBean where mid=? and targetid=?";

	@Override
	public boolean delete(MemberBean midBean, MemberBean targetBean) {
		int count = 0;
		if (midBean != null && targetBean != null) {
			count = getSession().createQuery(DELETE).setParameter(0, midBean)
					.setParameter(1, targetBean).executeUpdate();
		}
		if (count > 0)
			return true;
		return false;
	}

	private static String SELECT_ONE = "from BlockBean where mid=? and targetid=?";
	@Override
	public List<BlockBean> selectOne(MemberBean midBean, MemberBean targetBean) {
		if (midBean != null && targetBean != null) {
			return getSession().createQuery(SELECT_ONE, BlockBean.class).setParameter(0, midBean)
					.setParameter(1, targetBean).getResultList();
		}
		return null;
	}

	private static String SELECT_ALL_BLOCK = "from BlockBean where mid=?";
	@Override
	public List<BlockBean> selectAllBlock(MemberBean midBean) {
		if (midBean != null)
			return getSession().createQuery(SELECT_ALL_BLOCK, BlockBean.class).setParameter(0, midBean).getResultList();
		return null;
	}

	private static String SELECT_ALL = "from BlockBean where mid=? or targetid=?";

	@Override
	public List<BlockBean> selectAll(MemberBean midBean) {
		if (midBean != null)
			return getSession().createQuery(SELECT_ALL, BlockBean.class).setParameter(0, midBean)
					.setParameter(1, midBean).getResultList();
		return null;
	}

}
