package model.score;

import org.springframework.stereotype.Component;

@Component
public class ScoreBean {
	private Integer wid;
	private Integer scoreversion;
	private String score_1;
	private String score_2;
	private String score_3;
	private String score_4;
	private String score_5;
	private java.util.Date retireddate;
	
	public ScoreBean(){}
	
	public ScoreBean(Integer wid, Integer scoreversion, String score_1, String score_2, String score_3, String score_4,
			String score_5) {
		this.wid = wid;
		this.scoreversion = scoreversion;
		this.score_1 = score_1;
		this.score_2 = score_2;
		this.score_3 = score_3;
		this.score_4 = score_4;
		this.score_5 = score_5;
	}

	public java.util.Date getRetireddate() {
		return retireddate;
	}
	public void setRetireddate(java.util.Date retireddate) {
		this.retireddate = retireddate;
	}
	public Integer getWid() {
		return wid;
	}
	public void setWid(Integer wid) {
		this.wid = wid;
	}
	public Integer getScoreversion() {
		return scoreversion;
	}
	public void setScoreversion(Integer scoreversion) {
		this.scoreversion = scoreversion;
	}
	public String getScore_1() {
		return score_1;
	}
	public void setScore_1(String score_1) {
		this.score_1 = score_1;
	}
	public String getScore_2() {
		return score_2;
	}
	public void setScore_2(String score_2) {
		this.score_2 = score_2;
	}
	public String getScore_3() {
		return score_3;
	}
	public void setScore_3(String score_3) {
		this.score_3 = score_3;
	}
	public String getScore_4() {
		return score_4;
	}
	public void setScore_4(String score_4) {
		this.score_4 = score_4;
	}
	public String getScore_5() {
		return score_5;
	}
	public void setScore_5(String score_5) {
		this.score_5 = score_5;
	}
	
}
