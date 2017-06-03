package model.browsed;

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
public class BrowsedService {
	@Autowired
	private BrowsedDAO browsedDAO;
	
	public static void main(String[] args){
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.config.xml");
		BrowsedService dao = (BrowsedService) context.getBean("browsedService");
		MemberBean memberBean = new MemberBean();
		memberBean.setMid(1);
		System.out.println(dao.selectAll(memberBean).get(0).getBrowsedid());
		
		((ConfigurableApplicationContext)context).close();
	}
	
	public boolean insert(BrowsedBean bean){
		
		return browsedDAO.insert(bean);
	}
	
	public List<BrowsedBean> selectAll(MemberBean memberBean){
		return browsedDAO.selectAll(memberBean);
	}
}
