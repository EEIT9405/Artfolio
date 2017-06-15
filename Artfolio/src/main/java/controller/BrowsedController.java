package controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import model.browsed.BrowsedBean;
import model.browsed.BrowsedService;
import model.favorite.FavoriteService;
import model.like.LikeBean;
import model.like.LikeService;
import model.member.MemberBean;
import model.tag.TagService;
import model.work.WorkBean;
import model.work.WorkService;

//用於新增觀看紀錄、喜好標籤
@Controller
public class BrowsedController {

	@Autowired
	private BrowsedService browsedService;
	@Autowired
	private FavoriteService favoriteService;
	@Autowired
	private TagService tagService;
	@Autowired
	private WorkService workService;
	@Autowired
	private LikeService likeService;

	@RequestMapping(value = "/browsed.controller", method = RequestMethod.POST)
	@ResponseBody
	public void insert(@SessionAttribute("loginOK") MemberBean user, Integer wid) {
		System.out.println(wid);
		System.out.println(user.getMid());
		if(user != null && wid != null){
			BrowsedBean bean = new BrowsedBean();
			bean.setMid(user.getMid());
			bean.setWorkBean(workService.select(wid).get(0));
			browsedService.insert(bean);
			favoriteService.insertOrUpdate(user, tagService.getTags(wid));
		}
		return;
	}

	@RequestMapping(value = "/showRelationalWork.controller", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public Set<WorkBean> getAllRelational(@SessionAttribute("loginOK") MemberBean user, int wid) {
		if (user != null) {
			List<BrowsedBean> browsedList = browsedService.selectTop5Relational(user.getMid(), wid);
			if (browsedList != null && !browsedList.isEmpty()) {
				Set<WorkBean> workSet = new HashSet<>();
				for (BrowsedBean browsedBean : browsedList) {
					List<LikeBean> likeList = likeService.select(browsedBean.getMid());
					if (likeList != null && !likeList.isEmpty()) {
						for (LikeBean likeBean : likeList) {
							if (likeBean.getWid() != wid) {
								List<WorkBean> wl = workService.select(likeBean.getWid());
								if (wl != null && !wl.isEmpty()) {
									workSet.add(wl.get(0));
								}
							}
						}
					}
				}
				List<WorkBean> list = new ArrayList<>(workSet);
				workSet.clear();
				for(int i = 0 ; i < 5 ; i++){
					if(list.isEmpty()){
						break;
					}
					int ran = (int) (Math.random() * list.size());
					workSet.add(list.remove(ran));
				}
				return workSet;
			}
		}
		return null;
	}
}
