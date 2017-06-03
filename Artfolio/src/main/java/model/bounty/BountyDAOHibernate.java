package model.bounty;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;


@Repository
public class BountyDAOHibernate implements BountyDAO {
	
	private SessionFactory sessionFactory;
	public BountyDAOHibernate(SessionFactory sessionFactory){
		this.sessionFactory=sessionFactory;
	}
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	//測試
	public static void main(String[] args) {
//		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
//		sessionFactory.getCurrentSession().beginTransaction();
//		
//		BountyDAOHibernate dao = new BountyDAOHibernate(sessionFactory);
//		
//		//● 新增-1(一方bountyBean.hbm.xml必須有cascade="save-update" 或cascade="all"的設定)(雖然強大,不過實務上並不常用)(但,可用在訂單主檔與明細檔一次新增成功)
//		BountyBean bountyBean = new BountyBean();
//		Set<BountyTagBean> set = new HashSet<BountyTagBean>();// 準備置入tag數,以便cascade="save-update"的測試
//
//		BountyTagBean tag1 = new BountyTagBean();   // tag1
//		tag1.setB_tag("測試-1");
//		tag1.setBountyBean(bountyBean);
//		
//		BountyTagBean tag2 = new BountyTagBean();   // tag2
//		tag2.setB_tag("測試-2");
//		tag2.setBountyBean(bountyBean);
//
//		set.add(tag1);
//		set.add(tag2);
//
//		bountyBean.setB_content("Web程式設計開發");
//		bountyBean.setMid(1);
//		bountyBean.setTags(set);;
//		dao.insertInfo(bountyBean);
		
//		新增
//		BountyBean bean = new BountyBean();
//		bean.setMid(1);
//		bean.setB_content("test-5");
//		dao.insertInfo(bean);
			
//		更新
//		BountyBean bean = new BountyBean();
//		bean.setMid(1);
//		bean.setB_content("test-1000");
//		bean.setB_id(21);
//		dao.update(bean);
		
//		刪除
//		dao.delete(21);
	
//		查詢
//		List<BountyBean> list = dao.select();
//		for(BountyBean l:list){
//			System.out.println(l);
//		}
		
			
		//● 查詢-一方多方資訊一起呈現 (一方必須設為lazy="false")
//		BountyBean b = dao.select(21);
//		System.out.print(b.getB_title() + ",");
//		System.out.print(b.getB_content() + ",");
//		System.out.print(b.getB_organizer());
//		System.out.println("\n-----------------");
//		Set<BountyTagBean> set3 = b.getTags();
//		for (BountyTagBean tb : set3) {
//			System.out.print(tb.getB_tagid() + ",");
//			System.out.print(tb.getB_tag() + ",");
//
//			System.out.println();
//		}
//		
//		sessionFactory.getCurrentSession().getTransaction().commit();
//		sessionFactory.getCurrentSession().close();
//		sessionFactory.close();
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
}
