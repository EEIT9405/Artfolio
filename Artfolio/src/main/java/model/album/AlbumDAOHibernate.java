package model.album;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.album.AlbumBean;
import model.album.AlbumDAO;

@Repository
public class AlbumDAOHibernate implements AlbumDAO {
	@Autowired
	private SessionFactory sessionFactory;
	public AlbumDAOHibernate(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	@Override
	public AlbumBean select(int aid) {
		return getSession().get(AlbumBean.class, aid);
	}
	@Override
	public List<AlbumBean> select() {
		return this.getSession().createQuery("FROM AlbumBean", AlbumBean.class).getResultList();
	}
	@Override
	public AlbumBean insert(AlbumBean bean) {
		if (bean != null) {
			this.getSession().save(bean);
			return bean;
		}
		return null;
	}
	@Override
	public AlbumBean update(int aid, String aname, int wid, int mid, Date adate) {
		AlbumBean bean = this.select(aid);
		if(bean!=null) {
			bean.setAid(aid);
			bean.setAname(aname);
			bean.setWid(wid);
			bean.setMid(mid);
			bean.setAdate(adate);
		}
		return bean;
	}
	@Override
	public boolean delete(int aid) {
		AlbumBean bean = this.select(aid);
		if(bean!=null) {
			this.getSession().delete(bean);
			return true;
		}
		return false;
	}
	
}

