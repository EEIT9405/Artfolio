package model.bmsg;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BmsgService {
	@Autowired
	private BmsgDAO bmsgdao;
//	PUBLIC BMSGSERVICE(BMSGDAO BMSGDAO) {
//		THIS.BMSGDAO = BMSGDAO;
//	}
	
	public List<BmsgBean> select(BmsgBean bean) {
		List<BmsgBean> result = null;
		if(bean!=null && bean.getB_id()!=0) {
			BmsgBean temp = bmsgdao.select(bean.getB_msgid());
			if(temp!=null) {
				result = new ArrayList<BmsgBean>();
				result.add(temp);
			}
		} else {
			result = bmsgdao.select(); 
		}
		return result;
	}
	
	public List<BmsgBean> selectByBid(Integer b_id){
		return  bmsgdao.selectByBid(b_id);
	}
	
	
	public BmsgBean insert(BmsgBean bean) {
		BmsgBean result = null;
		if(bean!=null) {
			result = bmsgdao.insert(bean);
		}
		return result;
	}
	
	public BmsgBean update(BmsgBean bean) {
		BmsgBean result = null;
		if(bean!=null) {
			result = bmsgdao.update(bean);
		}
		return result;
	}
	public boolean delete(BmsgBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = bmsgdao.delete(bean.getB_msgid());
		}
		return result;
	}
	//6/12
	public boolean deleteByB_id(Integer b_id){
		return  bmsgdao.deleteByB_id(b_id);	
	}
	
	//6/15
	public boolean delete(Integer b_msgid){
		return  bmsgdao.delete(b_msgid);	
	}
	
	public BmsgBean select(Integer b_msgid){
		return  bmsgdao.select(b_msgid);
	}
	
	//6/7
	public long countAllMsgs(Integer b_id){	
		return bmsgdao.countAllMsgs(b_id);
	}
	
}
