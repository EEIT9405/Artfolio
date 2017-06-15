package model.album;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="TB_ALBUM")
public class AlbumBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name ="aid")
	private Integer aid;
	private String aname;
	private Integer wid;
	private Integer mid;
	@Column(name ="adate",insertable=false, updatable=false)
	private java.util.Date adate;
	public AlbumBean(){}
	
	public AlbumBean(Integer aid, String aname, Integer wid, Integer mid, Date adate) {
		this.aid = aid;
		this.aname = aname;
		this.wid = wid;
		this.mid = mid;
		this.adate = adate;
	}

	public Integer getAid() {
		return aid;
	}
	public void setAid(Integer aid) {
		this.aid = aid;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
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
	public java.util.Date getAdate() {
		return adate;
	}
	public void setAdate(java.util.Date adate) {
		this.adate = adate;
	}
}
