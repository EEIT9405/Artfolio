package model.member;

import java.util.Comparator;
import java.util.Set;
import java.util.TreeSet;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import model.favorite.FavoriteBean;

@Component
@Entity
@Table(name = "TB_MEMBER")
public class MemberBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer mid;
	private String pwd;
	private String name;
	@Column(insertable = false)
	private Boolean isname;
	@Column(unique = true)
	private String email;
	@Column(insertable = false)
	private Boolean ismail;
	private String info;
	@Column(insertable = false)
	private Boolean isinfo;
	private Boolean gender;
	@Column(insertable = false)
	private Boolean isgender;
	private String mphoto;
	@Column(insertable = false)
	private Integer point;
	@Column(insertable = false)
	private java.util.Date mstart;
	@Column(insertable = false)
	private java.util.Date mend;
	private java.util.Date mupdate;
	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name="mid")
	private Set<FavoriteBean> favorites = new TreeSet<FavoriteBean>(new Comparator<FavoriteBean>() {
		@Override
		public int compare(FavoriteBean o1, FavoriteBean o2) {
			if (o1.getFcount() > o2.getFcount()) {
				return -1;
			} else if (o1.getFcount() == o2.getFcount()) {
				return 0;
			}
			return 1;
		}
	});
	public MemberBean(){}
	public MemberBean(Integer mid){this.mid=mid;}
	
	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public Boolean getIsinfo() {
		return isinfo;
	}

	public void setIsinfo(Boolean isinfo) {
		this.isinfo = isinfo;
	}

	public Set<FavoriteBean> getFavorites() {
		return favorites;
	}

	public void setFavorites(Set<FavoriteBean> favorites) {
		this.favorites = favorites;
	}

	public Integer getMid() {
		return mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Boolean getIsname() {
		return isname;
	}

	public void setIsname(Boolean isname) {
		this.isname = isname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Boolean getIsmail() {
		return ismail;
	}

	public void setIsmail(Boolean ismail) {
		this.ismail = ismail;
	}

	public Boolean getGender() {
		return gender;
	}

	public void setGender(Boolean gender) {
		this.gender = gender;
	}

	public Boolean getIsgender() {
		return isgender;
	}

	public void setIsgender(Boolean isgender) {
		this.isgender = isgender;
	}

	public String getMphoto() {
		return mphoto;
	}

	public void setMphoto(String mphoto) {
		this.mphoto = mphoto;
	}

	public Integer getPoint() {
		return point;
	}

	public void setPoint(Integer point) {
		this.point = point;
	}

	public java.util.Date getMstart() {
		return mstart;
	}

	public void setMstart(java.util.Date mstart) {
		this.mstart = mstart;
	}

	public java.util.Date getMend() {
		return mend;
	}

	public void setMend(java.util.Date mend) {
		this.mend = mend;
	}

	public java.util.Date getMupdate() {
		return mupdate;
	}

	public void setMupdate(java.util.Date mupdate) {
		this.mupdate = mupdate;
	}

}
