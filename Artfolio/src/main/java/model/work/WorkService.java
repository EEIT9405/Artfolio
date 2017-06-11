package model.work;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(
		transactionManager="transactionManager",
		//資料庫隔離層，使用底層資料庫預設的隔離層級
		isolation=Isolation.DEFAULT,
		readOnly=false,
		timeout=-1
)
public class WorkService {
	@Autowired
	private WorkDAO tbworkDao;
	public WorkService(WorkDAO tbworkDao) {
		this.tbworkDao = tbworkDao;
	}
	@Transactional(readOnly=true)
	public List<WorkBean> select(WorkBean bean) {
		List<WorkBean> result = null;
		if(bean!=null && bean.getWid()!=0) {
			WorkBean temp = tbworkDao.select(bean.getWid());
			if(temp!=null) {
				result = new ArrayList<WorkBean>();
				result.add(temp);
			}
		} else {
			result = tbworkDao.select(); 
		}
		return result;
	}
	public WorkBean insert(WorkBean bean) {
		WorkBean result = null;
		if(bean!=null) {
			result = tbworkDao.insert(bean);
		}
		return result;
	}
	public WorkBean update(WorkBean bean) {
		WorkBean result = null;
		if(bean!=null) {
			result = tbworkDao.update(bean.getWid(),bean.getMid(),bean.getPicurl(),0, bean.getWinfo(),bean.getWtitle(),bean.getWlike(),bean.getWissue(),bean.isIswmsg(),bean.isIsscore(),bean.getWstart(),bean.getWend(),bean.getScore_1(),bean.getScore_2(),bean.getScore_3(),bean.getScore_4(),bean.getScore_5());
		}
		return result;
	}
	public boolean delete(WorkBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = tbworkDao.delete(bean.getWid());
		}
		return result;
	}
}