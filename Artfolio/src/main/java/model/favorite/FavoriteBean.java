package model.favorite;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name="tb_favorite")
public class FavoriteBean implements Comparable<FavoriteBean> {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer favoriteid;
	private Integer mid;
	private String tag;
	@Column(insertable = false)
	private int fcount;
	@Column(insertable = false)
	private Timestamp favoritedate;
	
	@Override
	public int compareTo(FavoriteBean o) {
		if(fcount > o.getFcount()){
			return -1;
		}else if(fcount < o.getFcount()){
			return 1;
		}
		return 0;
	}
	
	public Integer getFavoriteid() {
		return favoriteid;
	}
	public void setFavoriteid(Integer favoriteid) {
		this.favoriteid = favoriteid;
	}
	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public int getFcount() {
		return fcount;
	}
	public void setFcount(int fcount) {
		this.fcount = fcount;
	}
	public Timestamp getFavoritedate() {
		return favoritedate;
	}
	public void setFavoritedate(Timestamp favoritedate) {
		this.favoritedate = favoritedate;
	}
}
