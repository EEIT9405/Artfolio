package model.bounty;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="B_TAG")
@JsonAutoDetect
@JsonIgnoreProperties(value={"hibernateLazyInitializer","bountyBean"})
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
	@JoinColumn(name = "B_ID")  //�@��PK
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
//	@Override
//	public String toString() {
//		return "BountyTagBean [b_tagid=" + b_tagid + ", bountyBean=" + bountyBean + ", b_tag=" + b_tag + "]";
//	}
	

	
}
