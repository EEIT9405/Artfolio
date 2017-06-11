package model.donate;

import java.util.Date;

public class DonateBean {
	private Integer dno;
	private Integer mid;
	private Integer targetid;
	private Integer point;
	private java.util.Date donatedate;
	
	public DonateBean(){}
	public DonateBean(Integer dno, Integer mid, Integer targetid, Integer point, Date donatedate) {
		this.dno = dno;
		this.mid = mid;
		this.targetid = targetid;
		this.point = point;
		this.donatedate = donatedate;
	}
	public Integer getDno() {
		return dno;
	}
	public void setDno(Integer dno) {
		this.dno = dno;
	}
	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	public Integer getTargetid() {
		return targetid;
	}
	public void setTargetid(Integer targetid) {
		this.targetid = targetid;
	}
	public Integer getPoint() {
		return point;
	}
	public void setPoint(Integer point) {
		this.point = point;
	}
	public java.util.Date getDonatedate() {
		return donatedate;
	}
	public void setDonatedate(java.util.Date donatedate) {
		this.donatedate = donatedate;
	}
}
