package model.browsed;

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

import model.work.WorkBean;

@Component
@Entity
@Table(name="tb_browsed")
public class BrowsedBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer browsedid;
	private Integer mid;
	@ManyToOne
	@JoinColumn(name = "wid")
	private WorkBean workBean;
	@Column(insertable = false)
	private Timestamp browseddate;
	
	public Integer getBrowsedid() {
		return browsedid;
	}
	public void setBrowsedid(Integer browsedid) {
		this.browsedid = browsedid;
	}
	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	public WorkBean getWorkBean() {
		return workBean;
	}
	public void setWorkBean(WorkBean workBean) {
		this.workBean = workBean;
	}
	public Timestamp getBrowseddate() {
		return browseddate;
	}
	public void setBrowseddate(Timestamp browseddate) {
		this.browseddate = browseddate;
	}
	
}
