package model.bmsg;

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
@Table(name="TB_BMSG")
public class BmsgBean {
	
	private Integer b_msgid;
	private Integer mid;
	private Integer b_id;
	private String b_msgcontent;
	private java.sql.Date b_msgdate;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getB_msgid() {
		return b_msgid;
	}

	public void setB_msgid(Integer b_msgid) {
		this.b_msgid = b_msgid;
	}



	public Integer getMid() {
		return mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}

	public Integer getB_id() {
		return b_id;
	}

	public void setB_id(Integer b_id) {
		this.b_id = b_id;
	}

	public String getB_msgcontent() {
		return b_msgcontent;
	}

	public void setB_msgcontent(String b_msgcontent) {
		this.b_msgcontent = b_msgcontent;
	}
	@Column(insertable=false)
	public java.sql.Date getB_msgdate() {
		return b_msgdate;
	}

	public void setB_msgdate(java.sql.Date b_msgdate) {
		this.b_msgdate = b_msgdate;
	}

}
