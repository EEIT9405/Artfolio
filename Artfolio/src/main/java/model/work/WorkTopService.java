package model.work;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class WorkTopService {
	@Autowired
	private WorkTopDAO workTopDAO;

	public int selectIssueNO() {
		return workTopDAO.selectIssueNO();
	}

	public List<WorkBean> selectByIssue(int issue, int top) {
		return workTopDAO.selectByIssue(issue, top);
	}

	public boolean updateIssue(int issue, int wid) {
		return workTopDAO.update(issue, wid);
	}

	public List<WorkBean> selectTop(int issue) {
		return workTopDAO.selectTop(issue);
	}

	public Map<Integer, List<WorkBean>> selectAllTop() {
		int newIssue = workTopDAO.selectIssueNO()-1;
		if (newIssue > 0) {
			Map<Integer, List<WorkBean>> topMap = new HashMap<>();
			for (int i = 1; i <= newIssue; i++) {
				List<WorkBean> top = workTopDAO.selectTop(i);
				if(top != null && !top.isEmpty()){
					topMap.put(i, top);
				}
			}
			return topMap != null? topMap: null;
		}
		return null;
	}

	public static void main(String[] args) {

		ApplicationContext context = new ClassPathXmlApplicationContext("beans.config.xml");

		WorkTopService service = (WorkTopService) context.getBean("workTopService");
		System.out.println(service.selectTop(1));

		((ConfigurableApplicationContext) context).close();
	}
}
