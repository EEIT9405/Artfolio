package model.work;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import model.album.AlbumBean;

@Entity
@Table(name="TB_WORK")
public class WorkBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer wid;
	private Integer mid;
	private String picurl;
	private String winfo;
	private String wtitle;
	@Column(insertable=false)
	private Integer wlike;
	@Column(insertable=false)
	private Integer wissue;
	private Boolean iswmsg;
	private Boolean isscore;
	@Column(insertable=false, updatable=false)
	private java.util.Date wstart;
	private java.util.Date wend;
	private String score_1;
	private String score_2;
	private String score_3;
	private String score_4;
	private String score_5;
	@ManyToOne
	@JoinColumn(name ="aid")
	private AlbumBean albumBean;
	private Integer scoreversion=0;
	private Integer worder=0;
	
	public Boolean getIswmsg() {
		return iswmsg;
	}
	public void setIswmsg(Boolean iswmsg) {
		this.iswmsg = iswmsg;
	}
	public Integer getWorder() {
		return worder;
	}
	public void setWorder(Integer worder) {
		this.worder = worder;
	}
	public void setIsscore(Boolean isscore) {
		this.isscore = isscore;
	}
	public Integer getScoreversion() {
		return scoreversion;
	}
	public void setScoreversion(Integer scoreversion) {
		this.scoreversion = scoreversion;
	}
	
	@Override
	public int hashCode() {
		return wid.hashCode();
	}
	@Override
	public boolean equals(Object obj) {
		if(obj == null) return false;
		if(this == obj) return true;
		if(obj instanceof WorkBean){
			WorkBean workBean = (WorkBean) obj;
			if(workBean.wid == this.wid) return true;
		}
		return false;
	}
	
	public AlbumBean getAlbumBean() {
		return albumBean;
	}
	public void setAlbumBean(AlbumBean albumBean) {
		this.albumBean = albumBean;
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
	public String getWinfo() {
		return winfo;
	}
	public void setWinfo(String winfo) {
		this.winfo = winfo;
	}
	public String getWtitle() {
		return wtitle;
	}
	public void setWtitle(String wtitle) {
		this.wtitle = wtitle;
	}
	public Integer getWlike() {
		return wlike;
	}
	public void setWlike(Integer wlike) {
		this.wlike = wlike;
	}
	public Integer getWissue() {
		return wissue;
	}
	public void setWissue(Integer wissue) {
		this.wissue = wissue;
	}
	
	public Boolean getIsscore() {
		return isscore;
	}

	public java.util.Date getWstart() {
		return wstart;
	}
	public void setWstart(java.util.Date wstart) {
		this.wstart = wstart;
	}
	public java.util.Date getWend() {
		return wend;
	}
	public void setWend(java.util.Date wend) {
		this.wend = wend;
	}
	public String getScore_1() {
		return score_1;
	}
	public void setScore_1(String score_1) {
		this.score_1 = score_1;
	}
	public String getScore_2() {
		return score_2;
	}
	public void setScore_2(String score_2) {
		this.score_2 = score_2;
	}
	public String getScore_3() {
		return score_3;
	}
	public void setScore_3(String score_3) {
		this.score_3 = score_3;
	}
	public String getScore_4() {
		return score_4;
	}
	public void setScore_4(String score_4) {
		this.score_4 = score_4;
	}
	public String getScore_5() {
		return score_5;
	}
	public void setScore_5(String score_5) {
		this.score_5 = score_5;
	}

}
