package model.tagvote;

import java.util.Date;

public class TagvoteBean {
	private Integer mid;
	private Integer wid;
	private String tag;
	private Date votedate;
	
	public TagvoteBean(){}
	
	
	public TagvoteBean(Integer mid, Integer wid, String tag, Date votedate) {
		this.mid = mid;
		this.wid = wid;
		this.tag = tag;
		this.votedate = votedate;
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
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public java.util.Date getVotedate() {
		return votedate;
	}
	public void setVotedate(java.util.Date votedate) {
		this.votedate = votedate;
	}
	

}
