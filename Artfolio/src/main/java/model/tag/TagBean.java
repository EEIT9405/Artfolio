package model.tag;

import org.springframework.stereotype.Component;

@Component
public class TagBean {
	private Integer wid;
	private String tag;
	private Boolean lock=false;
	private Integer vote;
	
	
	public TagBean(){}
	public TagBean(Integer wid,String tag){
		this.wid=wid;
		this.tag=tag;
	}
	public TagBean(Integer wid,String tag,Boolean lock){
		this.wid=wid;
		this.tag=tag;
		this.lock=lock;
	}
	public TagBean(Integer wid,String tag,Boolean lock,Integer vote){
		this.wid=wid;
		this.tag=tag;
		this.lock=lock;
		this.vote=vote;
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
	
	
	public Integer getVote() {
		return vote;
	}
	public void setVote(Integer vote) {
		this.vote = vote;
	}
	public Boolean getLock() {
		return lock;
	}
	public void setLock(Boolean lock) {
		this.lock = lock;
	}
	
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof TagBean){
			TagBean bean=(TagBean) obj;
			if(bean.getWid().equals(this.getWid()) && bean.getTag().equals(this.getTag()))
				return true;
		}
		return false;
	}
	
}
