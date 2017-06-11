package model.like;

import java.util.Date;

public class LikeBean {
	private Integer mid;
	private Integer wid;
	private java.util.Date likedate;
	
	
	public LikeBean() {
	}
	
	public LikeBean(Integer mid, Integer wid, Date likedate) {
		this.mid = mid;
		this.wid = wid;
		this.likedate = likedate;
	}

	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	public Integer getWid() {
		return wid;
	}
	public void setWid(Integer wid) {
		this.wid = wid;
	}
	public java.util.Date getLikedate() {
		return likedate;
	}
	public void setLikedate(java.util.Date likedate) {
		this.likedate = likedate;
	}
}
