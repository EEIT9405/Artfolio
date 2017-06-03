package model.block;

import java.sql.Timestamp;

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

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import model.member.MemberBean;

@Component
@Entity
@Table(name="TB_BLOCK")
@JsonAutoDetect
@JsonIgnoreProperties(value={"hibernateLazyInitializer"})
public class BlockBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer blockid;
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="MID")
	private MemberBean myBean;
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="targetid")
	private MemberBean targetBean;
	@Column(insertable=false)
	private Timestamp blockdate;
	
	
	
	public Integer getBlockid() {
		return blockid;
	}
	public void setBlockid(Integer blockid) {
		this.blockid = blockid;
	}
	public MemberBean getMyBean() {
		return myBean;
	}
	public void setMyBean(MemberBean myBean) {
		this.myBean = myBean;
	}
	public MemberBean getTargetBean() {
		return targetBean;
	}
	public void setTargetBean(MemberBean targetBean) {
		this.targetBean = targetBean;
	}
	public Timestamp getBlockdate() {
		return blockdate;
	}
	public void setBlockdate(Timestamp blockdate) {
		this.blockdate = blockdate;
	}
}
