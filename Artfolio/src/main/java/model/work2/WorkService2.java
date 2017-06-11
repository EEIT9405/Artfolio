package model.work2;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
@Service
public class WorkService2 {
	@Autowired
	private WorkDAO2 workdao;
	@Transactional(readOnly=true)
	public WorkBean2 getWork(Integer wid){
		if(wid!=null)
		return workdao.select(wid);
		return null;
	}
	
	@Transactional(readOnly=true)
	public List<WorkBean2> selectByTitle(String[] and, String[] or, String[] not,boolean content){
		if(and!=null || or!=null ||not!=null)
			return workdao.searchByTitle(and, or, not,content);
		return null;
	}
	
	@Transactional(propagation=Propagation.MANDATORY)
	public boolean updateScore(WorkBean2 bean){
		if(bean!=null)
			return workdao.updateScore(bean);
		return false;
	}
	
	@Transactional(propagation=Propagation.MANDATORY)
	public boolean updateLike(Integer wid,Integer wlike){
		if(wid!=null&&wlike!=null)
			return workdao.updateLike(wid, wlike);
		return false;
	}
}
