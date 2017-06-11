package model.follow;

import java.util.Date;

public class FollowBean {
	private Integer mid;
	private Integer followid;
	private java.util.Date followdate;
	
	
	
	public FollowBean() {
	}
	
	public FollowBean(Integer mid, Integer followid, Date followdate) {
		this.mid = mid;
		this.followid = followid;
		this.followdate = followdate;
	}

	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	public Integer getFollowid() {
		return followid;
	}
	public void setFollowid(Integer followid) {
		this.followid = followid;
	}
	public java.util.Date getFollowdate() {
		return followdate;
	}
	public void setFollowdate(java.util.Date followdate) {
		this.followdate = followdate;
	}
}
