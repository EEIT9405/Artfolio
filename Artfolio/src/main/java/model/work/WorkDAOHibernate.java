package model.work;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.album.AlbumBean;
import model.work.WorkBean;
import model.work.WorkDAO;

@Repository
public class WorkDAOHibernate implements WorkDAO {
	@Autowired
	private SessionFactory sessionFactory;
	public WorkDAOHibernate(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	@Override
	public WorkBean select(int wid) {
		return getSession().get(WorkBean.class, wid);
	}
	@Override
	public List<WorkBean> select() {
		return this.getSession().createQuery("FROM WorkBean", WorkBean.class).getResultList();
	}
	
	@Override
	public WorkBean insert(WorkBean bean) {
		if(bean!=null) {
			if(bean.getWid()==0){
				this.getSession().save(bean);
			}
			return bean;
		}
		return null;
	}
	@Override
	public WorkBean update(int wid, int mid, String picurl, int aid, String winfo, String wtitle, int wlike, int wissue,
			boolean iswmsg, boolean isscore, Date wstart, Date wend, String score_1, String score_2, String score_3,
			String score_4, String score_5) {
		WorkBean bean = this.select(wid);
		if(bean!=null) {
			bean.setWid(wid);
			bean.setMid(mid);
			bean.setPicurl(picurl);
			bean.setWinfo(winfo);
			bean.setWtitle(wtitle);
			bean.setWlike(wlike);
			bean.setWissue(wissue);
			bean.setIswmsg(iswmsg);
			bean.setIsscore(isscore);
			bean.setWstart(wstart);
			bean.setWend(wend);
			bean.setScore_1(score_1);
			bean.setScore_2(score_2);
			bean.setScore_3(score_3);
			bean.setScore_4(score_4);
			bean.setScore_5(score_5);
		}
		return bean;
	}
	@Override
	public boolean delete(int wid) {
		WorkBean bean = this.select(wid);
		if(bean!=null) {
			this.getSession().delete(bean);
			return true;
		}
		return false;
	}

}

