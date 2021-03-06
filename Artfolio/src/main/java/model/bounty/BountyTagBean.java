package model.bounty;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;
@Component
@Entity
@Table(name="B_TAG")
public class BountyTagBean implements Serializable {
	
	public BountyTagBean(){
		
	}

	private Integer b_tagid;
	private BountyBean bountyBean;
	private String b_tag;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)  
	public Integer getB_tagid() {
		return b_tagid;
	}
	public void setB_tagid(Integer b_tagid) {
		this.b_tagid = b_tagid;
	}
	
	@ManyToOne 
	@JoinColumn(name = "B_ID") 
	@JsonBackReference
	public BountyBean getBountyBean() {
		return bountyBean;
	}
	public void setBountyBean(BountyBean bountyBean) {
		this.bountyBean = bountyBean;
	}
	
	public String getB_tag() {
		return b_tag;
	}
	public void setB_tag(String b_tag) {
		this.b_tag = b_tag;
	}
}
