package model.work;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public WorkBean select(Integer wid) {
		return getSession().get(WorkBean.class, wid);
	}
	@Override
	public List<WorkBean> select() {
		return this.getSession().createQuery("FROM WorkBean", WorkBean.class).getResultList();
	}
	
	@Override
	public WorkBean insert(WorkBean bean) {
		if(bean!=null) {
			if(bean.getWid()==null){
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}
	@Override
	public WorkBean update(WorkBean wb) {
		WorkBean bean = this.select(wb.getWid());
		if(bean!=null) {
			bean.setWid(wb.getWid());
			bean.setMid(wb.getMid());
			bean.setPicurl(wb.getPicurl());
			bean.setWinfo(wb.getWinfo());
			bean.setWtitle(wb.getWtitle());
			bean.setWlike(wb.getWlike());
			bean.setWissue(wb.getWissue());
			bean.setIswmsg(wb.getIswmsg());
			bean.setIsscore(wb.getIsscore());
			bean.setWstart(wb.getWstart());
			bean.setWend(wb.getWend());
			bean.setScore_1(wb.getScore_1());
			bean.setScore_2(wb.getScore_2());
			bean.setScore_3(wb.getScore_3());
			bean.setScore_4(wb.getScore_4());
			bean.setScore_5(wb.getScore_5());
			bean.setScoreversion(wb.getScoreversion());
			bean.setAlbumBean(wb.getAlbumBean());
			bean.setWorder(wb.getWorder());
		}
		return bean;
	}
	@Override
	public boolean delete(Integer wid) {
		WorkBean bean = this.select(wid);
		if(bean!=null) {
			this.getSession().delete(bean);
			return true;
		}
		return false;
	}
	
	/////////////////////////////////////////////////////////////
	
	private static final String UPDATE_SCORE="update WorkBean set isscore=?,score_1=?,score_2=?,score_3=?,score_4=?,score_5=?,scoreversion=? where wid=?";
	@Override
	public boolean updateScore(WorkBean bean) {
			if (bean != null) {
				int i =this.getSession().createQuery(UPDATE_SCORE)
				.setParameter(0, bean.getIsscore())
				.setParameter(1, bean.getScore_1())
				.setParameter(2, bean.getScore_2())
				.setParameter(3, bean.getScore_3())
				.setParameter(4, bean.getScore_4())
				.setParameter(5, bean.getScore_5())
				.setParameter(6, bean.getScoreversion())
				.setParameter(7, bean.getWid()).executeUpdate();
				if (i == 1) {
					return true;
				}
			}
		
		return false;
	}
	
	private static final String SEARCH_BY_TITLE="from WorkBean where";
	private final String AND=" and",OR=" or",NOT=" not",LB=" (",RB=")";
	@Override
	public List<WorkBean> searchByTitle(String[] and, String[] or, String[] not,boolean content) {
		List<WorkBean> list=null;
		StringBuilder condition=new StringBuilder(SEARCH_BY_TITLE);
		boolean t=true;
		final String LIKE=content?" (wtitle like ? or winfo like ?)":" wtitle like ?";
		if(and!=null){
			for(int i=0;i<and.length;i++){
				if(i==0){
					condition.append(LIKE);
					t=false;
				}else{
					condition.append(AND).append(LIKE);
				}
			}
		}
		if(or!=null){
			for(int i=0;i<or.length;i++){
				if(t){
					condition.append(LB).append(LIKE);
					t=false;
				}else if(i==0){
					condition.append(AND).append(LB).append(LIKE);
				}else{
					condition.append(OR).append(LIKE);
				}
			}
			condition.append(RB);
		}
		if(not!=null){
			for(int i=0;i<not.length;i++){
				if(t){
					condition.append(NOT).append(LB).append(LIKE);
					t=false;
				}else if(i==0){
					condition.append(AND).append(NOT).append(LB).append(LIKE);
				}else{
					condition.append(OR).append(LIKE);
				}
			}
			condition.append(RB);
		}
		System.out.println(condition.toString());
		
		if (!t) {
			Query<WorkBean> query=this.getSession().createQuery(condition.toString(),WorkBean.class);
			list=new ArrayList<>();
			int i=0;
			if(and!=null)
				i=set(query,and,i,content);
				
			if(or!=null)
				i=set(query,or,i,content);	
				
			if(not!=null)
				i=set(query,not,i,content);	
				
			list=query.list();
		}
			
		return list;
	}
	
	private int set(Query<?> stmt,String[] conditions,int count,boolean content){
		for(String c:conditions){
			stmt.setParameter(count++, "%"+c+"%");
			if(content){
				stmt.setParameter(count++, "%"+c+"%");
			}
		}
		return count;
	}

	private static final String UPDATE_LIKE="update WorkBean set wlike=? where wid=?";
	@Override
	public boolean updateLike(Integer wid, Integer wlike) {
		if (wid != null && wlike!=null) {
			int i=this.getSession().createQuery(UPDATE_LIKE)
					.setParameter(1, wid)
					.setParameter(0, wlike)
					.executeUpdate();
			if (i == 1) {
				return true;
			}
		}
		
		return false;
	}
	
	private static final String SELECT_BY_MID="from WorkBean where mid=?";
	@Override
	public List<WorkBean> searchByMid(Integer mid) {
		List<WorkBean> list=null;
		if(mid!=null){
			list=this.getSession().createQuery(SELECT_BY_MID,WorkBean.class).setParameter(0, mid).list();
		}
		return list;
	}
	private static final String SELECT_RECENT="from WorkBean order by wstart desc";
	@Override
	public List<WorkBean> searchRecent() {
		return this.getSession().createQuery(SELECT_RECENT,WorkBean.class).setMaxResults(100).list();
	}
	
	private static final String SELECT_BY_AID="from WorkBean where aid=?";
	@Override
	public List<WorkBean> searchByAid(Integer aid) {
		List<WorkBean> list=null;
		if(aid!=null){
			list=this.getSession().createQuery(SELECT_BY_AID,WorkBean.class).setParameter(0, aid).list();
		}
		return list;
	}
	
	private static final String SELECT_DATE_BY_MID = "select wstart from WorkBean where mid=? order by wstart desc";
	@Override
	public Date getNewWorkDate(Integer mid) {
		List<Date> newDates = getSession().createQuery(SELECT_DATE_BY_MID, Date.class).setParameter(0, mid).setMaxResults(1).getResultList();
		if(newDates != null && !newDates.isEmpty()){
			return newDates.get(0);
		}
		return null;
	}
}

