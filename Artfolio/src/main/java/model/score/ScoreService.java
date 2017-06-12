package model.score;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.work.WorkBean;
import model.work.WorkService;

@Service
public class ScoreService {
	@Autowired
	private ScoreDAO scoredao;
	@Autowired
	private WorkService workservice;
	
	
	@Transactional
	public Boolean updateScore(WorkBean bean,Boolean lock){
		if(bean!=null && lock!=null){
			if(!lock){
				if(checkFrequency(bean.getWid(),bean.getScoreversion()))
					return null;
				WorkBean current = workservice.select(bean).get(0);
				scoredao.insert(new ScoreBean(current.getWid(),current.getScoreversion(),
								current.getScore_1(),current.getScore_2(),current.getScore_3(),current.getScore_4(),current.getScore_5()));
				bean.setScoreversion(bean.getScoreversion()+1);
			}
			return workservice.updateScore(bean);
		}
		return false;
	}
	
	
	public boolean checkFrequency(Integer wid,Integer currentversion){
		if(currentversion<3)
			return false;
		return (System.currentTimeMillis()-select(wid, currentversion-2).getRetireddate().getTime())<=86400000;
	}
	
	@Transactional(readOnly=true)
	public ScoreBean select(Integer wid,Integer scoreversion){
		if(wid!=null && scoreversion!=null)
		return scoredao.select(wid, scoreversion);
		return null;
	}
	
	@Transactional(readOnly=true)
	public Integer select(Integer wid){
		if(wid!=null)
		return scoredao.select(wid);
		return null;
	}
	
}
