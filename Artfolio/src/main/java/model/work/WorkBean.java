package model.work;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import model.member.MemberBean;

@Entity
@Table(name="tb_work")
public class WorkBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer wid;
	private Integer mid;
	private String picurl;
	private Integer wissue;
	private Integer wlike;
	
	public Integer getWissue() {
		return wissue;
	}
	public void setWissue(Integer wissue) {
		this.wissue = wissue;
	}
	public Integer getWlike() {
		return wlike;
	}
	public void setWlike(Integer wlike) {
		this.wlike = wlike;
	}
	
	public Integer getWid() {
		return wid;
	}
	public void setWid(Integer wid) {
		this.wid = wid;
	}
	
	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	public String getPicurl() {
		return picurl;
	}
	public void setPicurl(String picurl) {
		this.picurl = picurl;
	}
	
}
