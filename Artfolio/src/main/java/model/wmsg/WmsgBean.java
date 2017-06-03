package model.wmsg;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
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
@Table(name="tb_wmsg")
public class WmsgBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer wmsgid;
	@ManyToOne
	@JoinColumn(name="mid")
	private MemberBean memberBean;
	private Integer wid;
	private String wmsgcontent;
	@Column(insertable=false)
	private Timestamp wmsgdate;
	
	public Integer getWmsgid() {
		return wmsgid;
	}
	public void setWmsgid(Integer wmsgid) {
		this.wmsgid = wmsgid;
	}
	public MemberBean getMemberBean() {
		return memberBean;
	}
	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}
	public Integer getWid() {
		return wid;
	}
	public void setWid(Integer wid) {
		this.wid = wid;
	}
	public String getWmsgcontent() {
		return wmsgcontent;
	}
	public void setWmsgcontent(String wmsgcontent) {
		this.wmsgcontent = wmsgcontent;
	}
	public Timestamp getWmsgdate() {
		return wmsgdate;
	}
	public void setWmsgdate(Timestamp wmsgdate) {
		this.wmsgdate = wmsgdate;
	}
}
