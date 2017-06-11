package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import misc.schedule.WorkTopScheduler;
import model.member.MemberService;
import model.work.WorkBean;
import model.work.WorkTopService;

@Controller
@RequestMapping
public class WorkTopControlller {
	@Autowired
	private WorkTopScheduler workTopScheduler;
	@Autowired
	private WorkTopService workTopService;
	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/workTop.controller", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String changeTimer(String cron, String timetext) {

		if (!"".equals(cron)) {
			boolean off = workTopScheduler.pause(true);
			if (!"stop".equals(cron)) {
				if (off) {
					boolean on = workTopScheduler.start(cron);
					if (on) {
						return "計時器已更改" + timetext;
					} else
						return "錯誤: 未更改";
				}
				return "錯誤: 計時器未正確重啟";
			}
			WorkTopScheduler.setCronStatus("stop");
			return "計時器已停止";
		}
		return "請選擇";
	}

	@RequestMapping(value = "/WorkTopStatus.controller", method = RequestMethod.GET, produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String getStatus() {
		String cron = WorkTopScheduler.getCronStatus();

		switch (cron) {
		case "stop":
			return "計時器狀態：停止運作中";
		case "0 0/5 * * * ?":
			return "計時器狀態：每五分鐘執行";
		case "59 59 23 * * ?":
			return "計時器狀態：每日24:00執行";
		case "59 59 23 * * 7":
			return "計時器狀態：每週六24:00執行";
		case "0 0 0 1 * ?":
			return "計時器狀態：每月底24:00執行";
		}
		return "計時器狀態：不明";
	}

	@RequestMapping(value = "/showTop.controller", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<Map<String, Object>> showTop(Integer issue) {
		if (issue == null || issue.equals(0)) {
			Set<Integer> set = workTopService.selectIssueNO(true);
			for (Integer s : set) {
				issue = s;
			}
		}
		if (issue > 0){
			List<WorkBean> workList = workTopService.selectTop(issue);
			List<Map<String, Object>> mapList = new ArrayList<>();
			for(WorkBean work : workList){
				Map<String, Object> map = new HashMap<>();
				map.put("memberBean", memberService.select(work.getMid()));
				map.put("workBean", work);
				mapList.add(map);
			}
			return mapList;
		}
		return null;
	}
	
	@RequestMapping(value = "/showAllIssueNo.controller", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<Integer> getAllIssueNo(){
		Set<Integer> set = workTopService.selectIssueNO(false);
		Iterator<Integer> iterator = set.iterator();
		while(iterator.hasNext()){
			if(iterator.next().equals(0)){
				iterator.remove();
			}
		}
		return new ArrayList<Integer>(set);
	}

	@RequestMapping(value = "/showAllTop.controller", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<Integer, List<WorkBean>> showAllTop() {
		return workTopService.selectAllTop();
	}
}
