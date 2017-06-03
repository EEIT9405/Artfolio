package misc.schedule;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.work.WorkBean;
import model.work.WorkTopService;

@Component
public class CreateWorkTop {
	@Autowired
	private WorkTopService workTopService;
	
	public void createWorkTop(){
		int count = workTopService.selectIssueNO();
		List<WorkBean> list = workTopService.selectByIssue(0, 2);
		if(list != null && !list.isEmpty()){
			for(WorkBean bean : list){
				workTopService.updateIssue(count+1, bean.getWid());
			}
		}
	}
}
