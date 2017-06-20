package model.bounty;

import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Repository;

@Repository
public class BountyDAOHibernate implements BountyDAO {
	@Autowired
	private SessionFactory sessionFactory;
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	//新增活動資料
	@Override
	public BountyBean insertInfo(BountyBean bean) {		
			if(bean!=null && bean.getB_id()==null){
				this.getSession().saveOrUpdate(bean);
				return bean;
			}
			return null;
	}
	
	//查詢活動資訊
	@Override
	public List<BountyBean> select(){
		return this.getSession().createQuery("FROM BountyBean",BountyBean.class).getResultList();
	}
	
	//查詢活動資訊by pk
	@Override
	public BountyBean select(Integer b_id) {
		return this.getSession().get(BountyBean.class, b_id);
	}
	
	public List<BountyBean> selectByMember(Integer mid) {
		Query<BountyBean> query = this.getSession().createQuery("FROM BountyBean WHERE mid=:mid",BountyBean.class);
		query.setParameter("mid", mid);
		return query.getResultList();
	}
	
	
	//根據獎金查詢
	@Override
	public List<BountyBean> selectByBouns(Integer min, Integer max){
		Query<BountyBean> query = getSession().createQuery("FROM BountyBean WHERE b_bonus_total Between :min AND :max ORDER BY b_bonus_total DESC",BountyBean.class);
		query.setParameter("min", min);
		query.setParameter("max", max);
		return query.getResultList();
	}
	@Override
	public List<BountyBean> selectByBouns(Integer max){
		Query<BountyBean> query = getSession().createQuery("FROM BountyBean WHERE b_bonus_total >= :max ORDER BY b_bonus_total DESC",BountyBean.class);
		query.setParameter("max", max);
		return query.getResultList();
	}	
	@Override
	public List<BountyBean> selectByClick(){
		Query<BountyBean> query = getSession().createQuery("FROM BountyBean ORDER BY b_click DESC",BountyBean.class);	
		return query.getResultList();
	}
	@Override
	public List<BountyBean> selectByUpdateDate(){
		Query<BountyBean> query = getSession().createQuery("FROM BountyBean ORDER BY b_update DESC",BountyBean.class);	
		return query.getResultList();
	}
	@Override
	public List<BountyBean> selectByMaxBouns(){
		Query<BountyBean> query = getSession().createQuery("FROM BountyBean ORDER BY b_bonus_total DESC",BountyBean.class);	
		return query.getResultList();
	}
	@Override	
	public List<BountyBean> selectByState(Integer b_state){
		Query<BountyBean> query = getSession().createQuery("FROM BountyBean WHERE b_state=:b_state ORDER BY b_uploaddate DESC",BountyBean.class);	
		return query.setParameter("b_state", b_state).getResultList();
	}
	//6/8 選擇byTags	
	//select * from tb_bounty where b_id IN (SELECT b_id FROM b_tag WHERE b_tag='??')
	@Override
	public List<BountyBean> selectByTags(String b_tag){
		Query<BountyBean> query = getSession().createQuery("From BountyBean WHERE b_id IN (SELECT bountyBean FROM BountyTagBean WHERE b_tag=:b_tag)", BountyBean.class);
		query.setParameter("b_tag", b_tag);
		return query.getResultList();
	}
		
	@Override
	public boolean delete(Integer b_id){
		BountyBean bean = this.select(b_id);
		if(bean!=null) {
			this.getSession().delete(bean);
			return true;
		}
		return false;
	}
	
	@Override
	public BountyBean update(BountyBean bean) {
		if(bean!=null && bean.getB_id()!=null){
			this.getSession().saveOrUpdate(bean);
			return bean;
		}
		return null;
	}

	private static final String UPDATE_FOR_EXPIRED = "update BountyBean set b_state=1 where b_enddate != 1 and b_enddate <= getDate()";
	private static final String UPDATE_FOR_EXPIRE = "update BountyBean set b_state=2 where (b_enddate != 1 or b_enddate != 2) and b_enddate <= getDate() + 14";
	@Override
	public boolean updateByDate(int state) {
		if(state == 1){
			return getSession().createQuery(UPDATE_FOR_EXPIRED).executeUpdate() > 0? true:false;
		}else if(state == 2){
			return getSession().createQuery(UPDATE_FOR_EXPIRE).executeUpdate() > 0? true:false;
		}
		return false;
	}
	
	//6/16活動狀態更新
	@Override
	public boolean stateUpdate(Integer b_id, Integer b_state){
		Query query = getSession().createQuery("UPDATE BountyBean SET b_state=:b_state WHERE b_id=:b_id");
		query.setParameter("b_state", b_state);
		query.setParameter("b_id", b_id);
		int n = query.executeUpdate();
		if(n!=0){
			return true;
		}
		return false;
	}
}
