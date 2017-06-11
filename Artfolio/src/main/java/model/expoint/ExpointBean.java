package model.expoint;

import java.util.Date;

public class ExpointBean {
	private Integer pno;
	private Integer mid;
	private Boolean ptype;
	private Integer point;
	private java.util.Date expointdate;
	
	public ExpointBean(){}
	
	public ExpointBean(Integer pno, Integer mid, Boolean ptype, Integer point, Date expointdate) {
		this.pno = pno;
		this.mid = mid;
		this.ptype = ptype;
		this.point = point;
		this.expointdate = expointdate;
	}

	public Integer getPno() {
		return pno;
	}
	public void setPno(Integer pno) {
		this.pno = pno;
	}
	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	public Boolean getPtype() {
		return ptype;
	}
	public void setPtype(Boolean ptype) {
		this.ptype = ptype;
	}
	public Integer getPoint() {
		return point;
	}
	public void setPoint(Integer point) {
		this.point = point;
	}
	public java.util.Date getExpointdate() {
		return expointdate;
	}
	public void setExpointdate(java.util.Date expointdate) {
		this.expointdate = expointdate;
	}
}
