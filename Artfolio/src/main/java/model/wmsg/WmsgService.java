package model.wmsg;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class WmsgService {
	
	@Autowired
	private WmsgDAO wmsgDAO;
	
	@Transactional(readOnly=true)
	public List<WmsgBean> showAll(Integer wid){
		return wmsgDAO.selectAll(wid);
	}
	
	public WmsgBean showOne(Integer wmsgid){
		return wmsgDAO.select(wmsgid);
	}
	
	public WmsgBean insert(WmsgBean bean){
		return wmsgDAO.insert(bean);
	}
	
	public WmsgBean update(WmsgBean bean){
		return wmsgDAO.update(bean);
	}
	
	public boolean delete(Integer wmsgid){
		return wmsgDAO.delete(wmsgid);
	}
	
}
