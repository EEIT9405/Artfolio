package model.bounty;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

@Entity
@IdClass(BountyTrackBean.class)
@Table(name = "TB_TRACK")
public class BountyTrackBean implements Serializable {

	public BountyTrackBean() {
	}

	@Id
	private Integer mid;
	@Id
	private Integer b_id;

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

	@Override
	public String toString() {
		return "BountyTrackBean [mid=" + mid + ", b_id=" + b_id + "]";
	}


	// 必須重新定義equals()與hashCode()
	public boolean equals(Object obj) {
		if (obj == this) {
			return true;
		}

		if (!(obj instanceof BountyTrackBean)) {
			return false;
		}

		BountyTrackBean bountyTrack = (BountyTrackBean) obj;
		return new EqualsBuilder().append(this.b_id, bountyTrack.getB_id()).append(this.mid, bountyTrack.getMid())
				.isEquals();
	}

	public int hashCode() {
		return new HashCodeBuilder().append(this.b_id).append(this.mid).toHashCode();
	}

}
