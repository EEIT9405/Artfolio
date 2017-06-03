package model.mail;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MailService {
	@Autowired
	private MailDAO mailDao;
	
	//選取
	public List<MailBean> select(MailBean bean) {
		List<MailBean> result = null;
		if(bean!=null) {
			if(bean.getMailid()!=null){
				result = new ArrayList<MailBean>();
				MailBean b = mailDao.getMailByPrimaryKey(bean);
				result.add(b);
			}	
			if(bean.getIsdelete()!=null){
				if(bean.getIsdelete()){
					result = mailDao.getDeleteMails(bean);
				}else{
					result = mailDao.getUnDeleteMails(bean);
				}
			}	
		} else {
			result = mailDao.getMails(); 
		}
		return result;
	}
	
	//新增
	public MailBean insert(MailBean bean) {
		MailBean result = null;
		if(bean!=null) {
			result = mailDao.insert(bean);
		}
		return result;
	}
	
	//更新
	public MailBean update(MailBean bean) {		
		MailBean result = null;
		if(bean!=null) {
			result = mailDao.update(bean);
		}
		return result;
	}
}
