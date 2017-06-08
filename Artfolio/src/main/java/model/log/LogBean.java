package model.log;

import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import model.member.MemberBean;

@Component
@Entity
@Table(name="tb_log")
public class LogBean {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer logid;
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="mid")
	private MemberBean adminBean;
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="targetid")
	private MemberBean targetBean;
	private String logcontent;
	private Boolean logtype;
	private Boolean lstatus;
	@Column(insertable=false)
	private Timestamp logdate;
	public Integer getLogid() {
		return logid;
	}
	public void setLogid(Integer logid) {
		this.logid = logid;
	}
	public MemberBean getAdminBean() {
		return adminBean;
	}
	public void setAdminBean(MemberBean adminBean) {
		this.adminBean = adminBean;
	}
	public MemberBean getTargetBean() {
		return targetBean;
	}
	public void setTargetBean(MemberBean targetBean) {
		this.targetBean = targetBean;
	}
	public String getLogcontent() {
		return logcontent;
	}
	public void setLogcontent(String logcontent) {
		this.logcontent = logcontent;
	}
	public Boolean getLogtype() {
		return logtype;
	}
	public void setLogtype(Boolean logtype) {
		this.logtype = logtype;
	}
	public Boolean getLstatus() {
		return lstatus;
	}
	public void setLstatus(Boolean lstatus) {
		this.lstatus = lstatus;
	}
	public Timestamp getLogdate() {
		return logdate;
	}
	public void setLogdate(Timestamp logdate) {
		this.logdate = logdate;
	}
}
