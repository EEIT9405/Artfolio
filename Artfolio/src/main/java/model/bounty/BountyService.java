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
		public BountyBean selectById(Integer b_id) {
			return bountydao.select(b_id);		
		}
		
	// 選取活動by member
	public List<BountyBean> selectByMember(Integer mid) {
		return bountydao.selectByMember(mid);
	}
		
	//6/8 選擇byTags	
	//select * from b_tag where b_tag='asfd'
	public List<BountyBean> selectByTags(String Selector){
		List<BountyBean> result = null;
		if(Selector!=null){
			result =  bountydao.selectByTags(Selector);	
		}	
		return result;
	}
	
	// 6/8 選擇byState
	public List<BountyBean> selectByState(String Selector){
		Integer selector = null;
		if(Selector!=null){
			selector = Integer.parseInt(Selector);
		}
		return bountydao.selectByState(selector);
	}
	
	//選擇byOther(最高獎金 熱門活動 最新活動)
	public List<BountyBean> selectBySelector(String selector) {
		List<BountyBean> result = new ArrayList<BountyBean>();
		switch(selector){
			case "b_click": result = bountydao.selectByClick();break;
			case "b_update": result = bountydao.selectByUpdateDate();break;
			case "b_bonus_total": result = bountydao.selectByMaxBouns();break;
		}
		return result;
	}
			
	//選擇byBouns
	public List<BountyBean> selectByBouns(Integer min, Integer max){
		List<BountyBean> result = new ArrayList<BountyBean>();
		if(min==null){
			result = bountydao.selectByBouns(max);
		}else{
			result = bountydao.selectByBouns(min, max);
		}
		return result;
	}
			
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
		
	//更新活動狀態
	public boolean stateUpdate(Integer b_id, Integer b_state){	
		return bountydao.stateUpdate(b_id, b_state);	
	}
	
	//刪除活動
	public boolean delete(BountyBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = bountydao.delete(bean.getB_id());
		}
		return result;
	}
	
	public boolean updateByDate(int state){
		return bountydao.updateByDate(state);
	}
	
	public List<BountyBean> search(Integer orderby,Integer[] amount,
			Integer[] state,String[] tag){
		if(orderby==null && amount==null && state==null && tag==null)
			return null;
		return bountydao.search(orderby, amount, state, tag);
	}
	
}
