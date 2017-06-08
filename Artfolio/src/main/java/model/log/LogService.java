package model.log;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.member.MemberBean;

@Service
@Transactional
public class LogService {
	@Autowired
	private LogDAO logDAO;
	
	public static void main(String[] args){
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.config.xml");
		LogService logService = (LogService) context.getBean("logService");
//		LogBean bean = new LogBean();
//		MemberBean admin = new MemberBean();
//		MemberBean target = new MemberBean();
//		admin.setMid(1);
//		bean.setLogid(1);
//		bean.setAdminBean(admin);
//		bean.setLogcontent("不爽");
//		bean.setLogtype(true);
//		target.setMid(3);
//		bean.setTargetBean(target);
//		bean.setLstatus(true);
//		System.out.println(logService.updateLog(bean));
		
//		System.out.println(logService.getAllLog(false, true).get(0).getLogid());
		
		System.out.println(logService.getLogBean(1).getLogid());
		((ConfigurableApplicationContext)context).close();
	}
	
	@Transactional(readOnly=true)
	public List<LogBean> getAllLog(boolean isContainExpired, boolean isDesc){
		return logDAO.selectAll(isContainExpired, isDesc);
	}
	
	public boolean createLog(LogBean bean) {
		return logDAO.insert(bean);
	}
	
	public LogBean updateLog(LogBean bean){
		return logDAO.update(bean);
	}
	
	public LogBean getLogBean(Integer logid){
		return logDAO.select(logid);
	}
}
