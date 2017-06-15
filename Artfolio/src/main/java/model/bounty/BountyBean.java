package model.bounty;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.springframework.stereotype.Component;
@Component
@Entity
@Table(name="TB_BOUNTY")
public class BountyBean implements Serializable {

	private static final long serialVersionUID = 1L;

	public BountyBean(){
	}
	
	private Integer b_id;
	private Integer mid;
	private Integer b_state;
	private String b_title;
	private String b_content;
	private String b_organizer;
	private String b_partimethod;
	private Integer b_bonus_total;
	private Integer b_bonus_max;
	private java.util.Date b_startdate;
	private java.util.Date b_enddate;
	private java.util.Date b_announced;
	private String b_attach_pic;
	private String b_attach_pdf;
	private Integer b_click;
	private java.util.Date b_uploaddate;
	private java.util.Date b_update;
	private java.util.Date b_end;
	
	
	private Set<BountyTagBean> tags = new HashSet<BountyTagBean>();
	
	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.EAGER, mappedBy="bountyBean") 
	//@OrderBy("b_tagid,asc") //�h��PK
	public Set<BountyTagBean> getTags() {
		return tags;
	}
	public void setTags(Set<BountyTagBean> tags) {
		this.tags = tags;
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getB_id() {
		return b_id;
	}
	public void setB_id(Integer b_id) {
		this.b_id = b_id;
	}
	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	@Column(insertable = false)
	public Integer getB_state() {
		return b_state;
	}
	public void setB_state(Integer b_state) {
		this.b_state = b_state;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getB_partimethod() {
		return b_partimethod;
	}
	public void setB_partimethod(String b_partimethod) {
		this.b_partimethod = b_partimethod;
	}
	public String getB_organizer() {
		return b_organizer;
	}
	public void setB_organizer(String b_organizer) {
		this.b_organizer = b_organizer;
	}
	public Integer getB_bonus_total() {
		return b_bonus_total;
	}
	public void setB_bonus_total(Integer b_bonus_total) {
		this.b_bonus_total = b_bonus_total;
	}
	public Integer getB_bonus_max() {
		return b_bonus_max;
	}
	public void setB_bonus_max(Integer b_bonus_max) {
		this.b_bonus_max = b_bonus_max;
	}
	public java.util.Date getB_startdate() {
		return b_startdate;
	}
	public void setB_startdate(java.util.Date b_startdate) {
		this.b_startdate = b_startdate;
	}
	public java.util.Date getB_enddate() {
		return b_enddate;
	}
	public void setB_enddate(java.util.Date b_enddate) {
		this.b_enddate = b_enddate;
	}
	public java.util.Date getB_announced() {
		return b_announced;
	}
	public void setB_announced(java.util.Date b_announced) {
		this.b_announced = b_announced;
	}
	public String getB_attach_pic() {
		return b_attach_pic;
	}
	public void setB_attach_pic(String b_attach_pic) {
		this.b_attach_pic = b_attach_pic;
	}
	public String getB_attach_pdf() {
		return b_attach_pdf;
	}
	public void setB_attach_pdf(String b_attach_pdf) {
		this.b_attach_pdf = b_attach_pdf;
	}
	@Column(insertable = false)
	public Integer getB_click() {
		return b_click;
	}
	public void setB_click(Integer b_click) {
		this.b_click = b_click;
	}
	@Column(insertable = false)
	public java.util.Date getB_uploaddate() {
		return b_uploaddate;
	}
	public void setB_uploaddate(java.util.Date b_uploaddate) {
		this.b_uploaddate = b_uploaddate;
	}
	@Column(insertable = false)
	public java.util.Date getB_update() {
		return b_update;
	}
	public void setB_update(java.util.Date b_update) {
		this.b_update = b_update;
	}
	@Column(insertable = false)
	public java.util.Date getB_end() {
		return b_end;
	}
	public void setB_end(java.util.Date b_end) {
		this.b_end = b_end;
	}
	@Override
	public String toString() {
		return "BountyBean [b_id=" + b_id + ", mid=" + mid + ", b_state=" + b_state + ", b_title=" + b_title
				+ ", b_content=" + b_content + ", b_organizer=" + b_organizer + ", b_bonus_total=" + b_bonus_total
				+ ", b_bonus_max=" + b_bonus_max + ", b_startdate=" + b_startdate + ", b_enddate=" + b_enddate
				+ ", b_announced=" + b_announced + ", b_attach_pic=" + b_attach_pic + ", b_attach_pdf=" + b_attach_pdf
				+ ", b_click=" + b_click + ", b_uploaddate=" + b_uploaddate + ", b_update=" + b_update + ", b_end="
				+ b_end + ", tags=" + tags + "]";
	}
}
