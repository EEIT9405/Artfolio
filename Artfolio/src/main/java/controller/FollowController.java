package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.follow.FollowBean;
import model.follow.FollowService;
import model.member.MemberBean;
import model.member.MemberInfo;
import model.member.MemberService;
import model.work.WorkBean;
import model.work.WorkService;



@Controller
@RequestMapping("follow")
@ResponseBody
public class FollowController {
	@Autowired
	private HttpSession session;
	@Autowired
	private FollowService followService;
	@Autowired
	private WorkService workService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(path="get.controller",method=RequestMethod.GET)
	public List<MemberInfo> get(@RequestParam(name="orderby",defaultValue="alphabet")String orderby,
			@RequestParam(name="order",defaultValue="ascending")String order){
		Integer mid = (Integer) session.getAttribute("mid");
		if (mid != null){
			List<MemberInfo> list=new ArrayList<>();
			for(FollowBean fb:followService.selectFollowing(mid)){
				MemberBean mb=memberService.select(fb.getFollowid());
				list.add(new MemberInfo(mb.getMid(), mb.getName(), mb.getInfo(), mb.getGender(), mb.getMphoto(), mb.getMstart()));
			}
			return SearchController.sortMember(list, orderby, order);
		}
		return null;
	}
	
	@RequestMapping(path="check.controller",method=RequestMethod.GET)
	public Info check(Integer wid){
		if(wid!=null){
			Integer mid=(Integer) session.getAttribute("mid");
			if(mid==null)
				return null;
			List<FollowBean> list=followService.selectFollowed(workService.getWork(wid).getMid());
			Info info=new Info(list.size(),false);
			for (FollowBean bean:list){
				if(bean.getMid().equals(mid))
					info.setFollowed(true);
			}
			return info;
		}
		return null;
	}
	
	@RequestMapping(path="check2.controller",method=RequestMethod.GET)
	public int check2(){
		Integer mid=(Integer) session.getAttribute("mid");
		MemberBean targetBean = (MemberBean) session.getAttribute("targetBean");
		Integer followid = null;
		if(targetBean != null){
			followid = targetBean.getMid();
		}
		if(followid != null){
			List<FollowBean> list = followService.selectFollowed(followid);
			for (FollowBean bean:list){
				if(bean.getMid().equals(mid)){
					return 1;
				}	
			}
		}
		return 0;
	}
	
	@RequestMapping(value="/getFollowCount.controller", method=RequestMethod.GET)
	public Map<String, Integer> getFollowCount(Integer mid){
		Map<String, Integer> map = new HashMap<>();
		if(mid != null){
			List<FollowBean> follow = followService.selectFollowed(mid);
			if(follow != null){
				map.put("followCount", follow.size());
			}
			List<WorkBean> work = workService.selectByMid(mid);
			if(work != null){
				map.put("workCount", work.size());
			}
		}
		return map;
	}
	
	@RequestMapping(path="insert.controller",method=RequestMethod.POST)
	public Info insert(Integer wid){
		if(wid!=null){
			Integer mid=(Integer) session.getAttribute("mid");
			Integer followid=workService.getWork(wid).getMid();
			if(mid!=null && followService.insert(new FollowBean(mid,followid,null)))
				return new Info(followService.selectFollowed(followid).size(),true);
		}
		return null;
	}
	
	@RequestMapping(value="/create.controller", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	@ResponseBody
	public String follow(){
		Integer mid = (Integer) session.getAttribute("mid");
		MemberBean targetBean = (MemberBean) session.getAttribute("targetBean");
		Integer followid = targetBean.getMid();
		boolean result = followService.insert(new FollowBean(mid, followid, null));
		if(result){
			return "追踪成功";
		}
		return "追踪失敗，請重新登入後再試";
	}
	
	@RequestMapping(path="deleteByWid.controller",method=RequestMethod.POST)
	public Info deleteByWid(Integer wid){
		if(wid!=null){
			return delete(workService.getWork(wid).getMid());
		}	
		return null;
	}
	@RequestMapping(path="delete.controller",method=RequestMethod.POST)
	public Info delete(Integer followid){
		if(followid!=null){
			Integer mid=(Integer) session.getAttribute("mid");
			if(mid!=null && followService.delete(new FollowBean(mid,followid,null)))
				return new Info(followService.selectFollowed(followid).size(),false);
		}	
		return null;
	}
	
	class Info{
		private Integer followers;
		private Boolean followed;
		public Info() {
		}
		public Integer getFollowers() {
			return followers;
		}
		public void setFollowers(Integer followers) {
			this.followers = followers;
		}
		public Boolean getFollowed() {
			return followed;
		}
		public void setFollowed(Boolean followed) {
			this.followed = followed;
		}
		public Info(Integer followers, Boolean followed) {
			this.followers = followers;
			this.followed = followed;
		}
		
	}
	
}
