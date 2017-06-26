package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.like.LikeBean;
import model.like.LikeService;
import model.work.WorkBean;
import model.work.WorkService;

@Controller
@RequestMapping("like")
@ResponseBody
public class LikeController {
	@Autowired
	private LikeService likeService;
	@Autowired
	private HttpSession session;
	@Autowired
	private WorkService workService;

	@RequestMapping(path = "get.controller", method = RequestMethod.GET)
	public List<WorkBean> get(@RequestParam(name="orderby",defaultValue="alphabet")String orderby,
			@RequestParam(name="order",defaultValue="ascending")String order) {
		Integer mid = (Integer) session.getAttribute("mid");
		if (mid != null){
			List<WorkBean> list=new ArrayList<>();
			for(LikeBean lb:likeService.select(mid)){
				WorkBean wb=workService.getWork(lb.getWid());
				wb.setWstart(lb.getLikedate());
				list.add(wb);
			}
			return SearchController.sortWork(list,orderby,order);
		}
		return null;
	}

	@RequestMapping(path = "check.controller", method = RequestMethod.GET)
	public Info check(Integer wid) {
		if (wid != null) {
			Integer mid = (Integer) session.getAttribute("mid");
			if (mid == null)
				return null;
			List<LikeBean> list = likeService.selectLiked(wid);
			Info info = new Info(list.size(), false);
			for (LikeBean bean : list) {
				if (bean.getMid().equals(mid))
					info.setLiked(true);
			}
			return info;
		}
		return null;
	}

	@RequestMapping(path = "insert.controller", method = RequestMethod.POST)
	public Info insert(Integer wid) {
		if (wid != null) {
			Integer mid = (Integer) session.getAttribute("mid");
			if (mid != null && likeService.insert(new LikeBean(mid, wid, null)))
				return new Info(likeService.selectLiked(wid).size(), true);
		}
		return null;
	}

	@RequestMapping(path = "delete.controller", method = RequestMethod.POST)
	public Info delete(Integer wid) {
		if (wid != null) {
			Integer mid = (Integer) session.getAttribute("mid");
			if (mid != null && likeService.delete(new LikeBean(mid, wid, null)))
				return new Info(likeService.selectLiked(wid).size(), false);
		}
		return null;
	}
	
	class Info {
		private Integer likes;
		private Boolean liked;

		public Info() {
		}

		public Info(Integer likes, Boolean liked) {
			this.likes = likes;
			this.liked = liked;
		}

		public Integer getLikes() {
			return likes;
		}

		public void setLikes(Integer likes) {
			this.likes = likes;
		}

		public Boolean getLiked() {
			return liked;
		}

		public void setLiked(Boolean liked) {
			this.liked = liked;
		}
	}
}
