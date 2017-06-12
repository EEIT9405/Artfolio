package model.album;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import model.work.WorkBean;

@Entity
@Table(name="TB_ALBUM")
public class AlbumBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name ="aid")
	private int aid;
	private String aname;
	private int wid;
	private int mid;
	@Column(name ="adate",insertable=false, updatable=false)
	private java.util.Date adate;
	
	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.EAGER,mappedBy="albumBean")
	private Set<WorkBean> workBean=new HashSet<WorkBean>();
	
	public Set<WorkBean> getWorkBean() {
		return workBean;
	}
	public void setWorkBean(Set<WorkBean> workBean) {
		this.workBean = workBean;
	}
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public int getWid() {
		return wid;
	}
	public void setWid(int wid) {
		this.wid = wid;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public java.util.Date getAdate() {
		return adate;
	}
	public void setAdate(java.util.Date adate) {
		this.adate = adate;
	}
	

}
