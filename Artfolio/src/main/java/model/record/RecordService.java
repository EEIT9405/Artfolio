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
		if (wid!=null && recordversion!=null){
			List<RecordBean> raw=recorddao.get(wid,recordversion);
			if(raw.isEmpty())
				return null;
			RecordBean max=new RecordBean(0, wid, 0.0, 0.0, 0.0, 0.0, 0.0, recordversion);
			RecordBean min=new RecordBean(0, wid, 9990.0, 9990.0, 9990.0,9990.0, 9990.0, recordversion);
			
			RecordBean dev=new RecordBean(0, wid, 0.0, 0.0, 0.0, 0.0, 0.0, recordversion);
			RecordBean sum=new RecordBean(0, wid, 0.0, 0.0, 0.0, 0.0, 0.0, recordversion);
			for(RecordBean bean :raw){		
				sum.setRecord_1(sum.getRecord_1()+bean.getRecord_1());
				sum.setRecord_2(sum.getRecord_2()+bean.getRecord_2());
				sum.setRecord_3(sum.getRecord_3()+bean.getRecord_3());
				sum.setRecord_4(sum.getRecord_4()+bean.getRecord_4());
				sum.setRecord_5(sum.getRecord_5()+bean.getRecord_5());
				
				dev.setRecord_1(dev.getRecord_1()+bean.getRecord_1()*bean.getRecord_1());
				dev.setRecord_2(dev.getRecord_2()+bean.getRecord_2()*bean.getRecord_2());
				dev.setRecord_3(dev.getRecord_3()+bean.getRecord_3()*bean.getRecord_3());
				dev.setRecord_4(dev.getRecord_4()+bean.getRecord_4()*bean.getRecord_4());
				dev.setRecord_5(dev.getRecord_5()+bean.getRecord_5()*bean.getRecord_5());
				
				
				if(bean.getRecord_1()>max.getRecord_1())
					max.setRecord_1(bean.getRecord_1());
				if(bean.getRecord_2()>max.getRecord_2())
					max.setRecord_2(bean.getRecord_2());
				if(bean.getRecord_3()>max.getRecord_3())
					max.setRecord_3(bean.getRecord_3());
				if(bean.getRecord_4()>max.getRecord_4())
					max.setRecord_4(bean.getRecord_4());
				if(bean.getRecord_5()>max.getRecord_5())
					max.setRecord_5(bean.getRecord_5());
				
				if(bean.getRecord_1()<min.getRecord_1())
					min.setRecord_1(bean.getRecord_1());
				if(bean.getRecord_2()<min.getRecord_2())
					min.setRecord_2(bean.getRecord_2());
				if(bean.getRecord_3()<min.getRecord_3())
					min.setRecord_3(bean.getRecord_3());
				if(bean.getRecord_4()<min.getRecord_4())
					min.setRecord_4(bean.getRecord_4());
				if(bean.getRecord_5()<min.getRecord_5())
					min.setRecord_5(bean.getRecord_5());
				
			}
			double s=raw.size();
			RecordBean avg=new RecordBean(0, wid, sum.getRecord_1()/s, 
					sum.getRecord_2()/s, sum.getRecord_3()/s, 
					sum.getRecord_4()/s, sum.getRecord_5()/s, recordversion);
			
			dev.setRecord_1(Math.sqrt(dev.getRecord_1()/s-avg.getRecord_1()*avg.getRecord_1()));
			dev.setRecord_2(Math.sqrt(dev.getRecord_2()/s-avg.getRecord_2()*avg.getRecord_2()));
			dev.setRecord_3(Math.sqrt(dev.getRecord_3()/s-avg.getRecord_3()*avg.getRecord_3()));
			dev.setRecord_4(Math.sqrt(dev.getRecord_4()/s-avg.getRecord_4()*avg.getRecord_4()));
			dev.setRecord_5(Math.sqrt(dev.getRecord_5()/s-avg.getRecord_5()*avg.getRecord_5()));
			
			raw.clear();
			raw.add(max);
			raw.add(min);
			raw.add(avg);
			raw.add(dev);
			raw.add(sum);
			return raw;
		}
		return null;
	}
	
}
