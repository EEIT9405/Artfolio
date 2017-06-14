package model.member;

import java.util.Date;

public class MemberInfo{
	private Integer mid;
	private String name;
	private String info;
	private Boolean gender;
	private String mphoto;
	private java.util.Date mstart;
	public MemberInfo(){}
	
	
	public MemberInfo(Integer mid, String name, String info, Boolean gender, String mphoto, Date mstart) {
		this.mid = mid;
		this.name = name;
		this.info = info;
		this.gender = gender;
		this.mphoto = mphoto;
		this.mstart = mstart;
	}


	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public Boolean getGender() {
		return gender;
	}
	public void setGender(Boolean gender) {
		this.gender = gender;
	}
	public String getMphoto() {
		return mphoto;
	}
	public void setMphoto(String mphoto) {
		this.mphoto = mphoto;
	}
	public java.util.Date getMstart() {
		return mstart;
	}
	public void setMstart(java.util.Date mstart) {
		this.mstart = mstart;
	}
	
}
