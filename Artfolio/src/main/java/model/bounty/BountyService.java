package model.bounty;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BountyService {
	@Autowired
	private BountyDAO bountydao;
	public BountyService(BountyDAO bountydao) {
		this.bountydao = bountydao;
	}
	
	//選取活動by bean
	public List<BountyBean> select(BountyBean bean) {
		List<BountyBean> result = null;
		if(bean!=null && bean.getB_id()!=0) {
			BountyBean temp = bountydao.select(bean.getB_id());
			if(temp!=null) {
				result = new ArrayList<BountyBean>();
				result.add(temp);
			}
		} else {
			result = bountydao.select(); 
		}
		return result;
	}
	
	//選取活動by id
		public BountyBean selectById(int b_id) {
			return bountydao.select(b_id);
				
		}
	
	
	//選取活動+標籤
	
//	public List<BountyBean> select(BountyBean bean) {
//		List<BountyBean> result = null;
//		if(bean!=null && bean.getB_id()!=0) {
//			BountyBean temp = bountydao.select(bean.getB_id());
//			if(temp!=null) {
//				result = new ArrayList<BountyBean>();
//				result.add(temp);
//			}
//		} else {
//			result = bountydao.select(); 
//		}
//		return result;
//		
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
//	}
	
	
	//新增活動
	public BountyBean insertInfo(BountyBean bean) {
		BountyBean result = null;
		if(bean!=null) {
			result = bountydao.insertInfo(bean);
		}
		return result;
	}
	
	//新增活動+標籤
	public BountyBean insertInfo(BountyBean bean,String[] tags) {
		Set<BountyTagBean> set = new HashSet<BountyTagBean>();// 準備置入tag數,以便cascade="save-update"的測試
		BountyBean result = null;
		if(bean!=null){
			for(int i=0;i<tags.length;i++){			
				BountyTagBean tag = new BountyTagBean();
				tag.setB_tag(tags[i]);
				tag.setBountyBean(bean);	
				set.add(tag);
			}
			bean.setTags(set);;
			result = bountydao.insertInfo(bean);
		}
		return result;	
	}
	
	//更新活動
	public BountyBean update(BountyBean bean) {
		BountyBean result = null;
		if(bean!=null) {
			result = bountydao.update(bean);
		}
		return result;
	}
	
	//刪除活動
	public boolean delete(BountyBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = bountydao.delete(bean.getB_id());
		}
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
