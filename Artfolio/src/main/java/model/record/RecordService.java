package model.record;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class RecordService {
	
	@Autowired
	private RecordDAO recorddao;
	
	
	@Transactional
	public boolean insert(RecordBean bean){
		if(bean!=null)
		return recorddao.insert(bean);
		return false;
	}
	@Transactional(readOnly=true)
	public RecordBean select(RecordBean bean){
		if(bean!=null)
		return recorddao.select(bean);
		return null;
	}
	@Transactional
	public boolean updateRecord(RecordBean bean){
		if(bean!=null)
		return recorddao.update(bean);
		return false;
	}
	@Transactional
	public boolean delete(RecordBean bean){
		if(bean!=null)
		return recorddao.delete(bean);
		return false;
	}
	@Transactional(readOnly=true)
	public List<RecordBean> calStat(Integer wid,Integer recordversion){
		if (wid!=null && recordversion!=null)
		return recorddao.calStat(wid,recordversion);
		return null;
	}
	
}
