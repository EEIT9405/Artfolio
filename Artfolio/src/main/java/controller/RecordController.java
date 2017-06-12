package controller;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.record.RecordBean;
import model.record.RecordService;
import model.score.ScoreBean;
import model.score.ScoreService;
import model.work.WorkBean;
import model.work.WorkService;

@Controller
@RequestMapping("record")
@ResponseBody
public class RecordController {
	@Autowired
	WorkService workService;
	@Autowired
	RecordService recordService;
	@Autowired
	ScoreService scoreService;
	@Autowired
	HttpSession session;
	
	@RequestMapping(path="getw.controller",method=RequestMethod.GET)
	public WorkBean getCurrent(Integer wid){
		if(wid!=null){
			return workService.getWork(wid);
		}
		return null;
	}
	
	@RequestMapping(path="update.controller",method=RequestMethod.POST)
	public Boolean updateScore(WorkBean bean,Boolean lock){
		if(bean!=null){
			if(bean.getWid()!=null && bean.getScoreversion()!=null){
				if(bean.getIsscore()==null)
					bean.setIsscore(false);
				if(lock || bean.getScore_1().trim().length()>0 || 
				   bean.getScore_2().trim().length()>0 ||
				   bean.getScore_3().trim().length()>0 || 
				   bean.getScore_4().trim().length()>0 || 
				   bean.getScore_5().trim().length()>0)
				return scoreService.updateScore(bean,lock); 
			}
		}
		return false;
	}
	
	
	@RequestMapping(path="insert.controller",method=RequestMethod.POST)
	public boolean insert(RecordBean bean,Boolean update){
		if(bean!=null){
			Integer mid=(Integer) session.getAttribute("mid");
			bean.setMid(mid);
			if(bean.getWid()==null || bean.getRecordversion()==null || bean.getMid()==null)
				return false;
			if(update)
				return recordService.updateRecord(bean);
			else
				return recordService.insert(bean);
		}
		return false;
	}
	
	@RequestMapping(path="getr.controller",method=RequestMethod.GET)
	public RecordBean getRecord(RecordBean bean){
		if(bean!=null){
			Integer mid=(Integer) session.getAttribute("mid");
			bean.setMid(mid);
			if(bean.getWid()==null || bean.getRecordversion()==null || bean.getMid()==null)
				return null;
			return recordService.select(bean);
		}
		return null;
	}
	
	@RequestMapping(path="delete.controller",method=RequestMethod.POST)
	public boolean delete(RecordBean bean){
		if(bean!=null){
			Integer mid=(Integer) session.getAttribute("mid");
			bean.setMid(mid);
			if(bean.getWid()==null || bean.getRecordversion()==null || bean.getMid()==null)
				return false;
			return recordService.delete(bean);
		}
		return false;
	}
	
	@RequestMapping(path="getsv.controller",method=RequestMethod.GET)
	public Integer getScoreVersions(Integer wid){
		if(wid!=null){
			return scoreService.select(wid)+1;
		}
		return null;
	}
	@RequestMapping(path="gets.controller",method=RequestMethod.GET)
	public ScoreBean getScore(Integer wid,Integer scoreversion){
		if(wid!=null && scoreversion!=null){
			return scoreService.select(wid,scoreversion);
		}
		return null;
	}
	@RequestMapping(path="getst.controller",method=RequestMethod.GET)
	public List<RecordBean> getStats(Integer wid,Integer scoreversion){
		if(wid!=null && scoreversion!=null){
			return recordService.calStat(wid, scoreversion);
		}
		return null;
	}
	
	
}
