package model.mail;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import model.member.MemberBean;

@Entity
@Table(name="TB_MAIL")
public class MailBean implements Serializable{
	
	public MailBean(){	
	}
	
	public MailBean(Integer toId, Boolean isDelete){
		this.toId=toId;
		this.isdelete=isDelete;
	}
	
	public MailBean(Integer mailid){
		this.mailid=mailid;
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer mailid;//--信件編號
	@ManyToOne
	@JoinColumn(name = "mid") 
	private MemberBean memberBean;	
	@Column(name="targetid")
	private Integer toId; // mid FK
	private String mailtitle;
	private String mailcontent; 
	private String mattach;
	private byte mstatus;
	@Column(insertable = false)
	private Boolean isread;
	@Column(insertable = false)
	private Boolean isdelete;
	private Integer reid; // mailid FK
	@Column(insertable = false)
	private java.util.Date maildate;
	
	public MemberBean getMemberBean() {
		return memberBean;
	}
	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}	
	public Integer getMailid() {
		return mailid;
	}
	public void setMailid(Integer mailid) {
		this.mailid = mailid;
	}
	public Integer getToId() {
		return toId;
	}
	public void setToId(Integer toId) {
		this.toId = toId;
	}
	public String getMailtitle() {
		return mailtitle;
	}
	public void setMailtitle(String mailtitle) {
		this.mailtitle = mailtitle;
	}
	public String getMailcontent() {
		return mailcontent;
	}
	public void setMailcontent(String mailcontent) {
		this.mailcontent = mailcontent;
	}
	public byte getMstatus() {
		return mstatus;
	}
	public void setMstatus(byte mstatus) {
		this.mstatus = mstatus;
	}
	public Integer getReid() {
		return reid;
	}
	public void setReid(Integer reid) {
		this.reid = reid;
	}
	public java.util.Date getMaildate() {
		return maildate;
	}
	public void setMaildate(java.util.Date maildate) {
		this.maildate = maildate;
	}
	public String getMattach() {
		return mattach;
	}
	public void setMattach(String mattach) {
		this.mattach = mattach;
	}
	public Boolean getIsread() {
		return isread;
	}
	public void setIsread(Boolean isread) {
		this.isread = isread;
	}
	public Boolean getIsdelete() {
		return isdelete;
	}
	public void setIsdelete(Boolean isdelete) {
		this.isdelete = isdelete;
	}
	@Override
	public String toString() {
		return "MailBean [mailid=" + mailid + ", toId=" + toId + ", mailtitle=" + mailtitle
				+ ", mailcontent=" + mailcontent + "]";
	}	
}
