package misc.schedule;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.work.WorkBean;
import model.work.WorkTopService;

@Component
public class CreateWorkTop {
	@Autowired
	private WorkTopService workTopService;
	
	public void createWorkTop(int top){
		int count = 0;
		Set<Integer> set = workTopService.selectIssueNO(true);
		for(Integer s : set){
			count = s;
		}
		List<WorkBean> list = workTopService.selectByIssue(0, top);
		if(list != null && !list.isEmpty()){
			for(WorkBean bean : list){
				workTopService.updateIssue(count+1, bean.getWid());
			}
		}
	}
}
