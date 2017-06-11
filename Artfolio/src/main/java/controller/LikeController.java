package controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.like.LikeBean;
import model.like.LikeService;
import model.work2.WorkBean2;
import model.work2.WorkService2;

@Controller
@RequestMapping("like")
@ResponseBody
public class LikeController {
	@Autowired
	private LikeService likeService;
	@Autowired
	private HttpSession session;
	@Autowired
	private WorkService2 workService;

	@RequestMapping(path = "get.controller", method = RequestMethod.GET)
	public LikeList get() {
		Integer mid = (Integer) session.getAttribute("mid");
		if (mid != null){
			List<JointLikeBean> list=new ArrayList<>();
			for(LikeBean lb:likeService.select(mid)){
				WorkBean2 wb=workService.getWork(lb.getWid());
				list.add(new JointLikeBean(wb.getWid(),wb.getPicurl(),wb.getWtitle(),lb.getLikedate()));
			}
			return new LikeList(list);
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
	class JointLikeBean{
		private Integer wid;
		private String url;
		private String title;
		private java.util.Date date;
		public JointLikeBean(){}
		
		public JointLikeBean(Integer wid, String url, String title, Date date) {
			this.wid = wid;
			this.url = url;
			this.title = title;
			this.date = date;
		}

		public Integer getWid() {
			return wid;
		}

		public void setWid(Integer wid) {
			this.wid = wid;
		}

		public String getUrl() {
			return url;
		}

		public void setUrl(String url) {
			this.url = url;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public java.util.Date getDate() {
			return date;
		}
		public void setDate(java.util.Date date) {
			this.date = date;
		}
	}
	class LikeList{
		private List<JointLikeBean> list;
		private final String str="Like";
		public LikeList(List<JointLikeBean> list){
			this.list=list;
		}
		public List<JointLikeBean> getList() {
			return list;
		}
		public void setList(List<JointLikeBean> list) {
			this.list = list;
		}
		public String getStr() {
			return str;
		}
	}
}
