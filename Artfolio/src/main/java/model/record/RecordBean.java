package model.record;

import org.springframework.stereotype.Component;

@Component
public class RecordBean {
	private Integer mid;
	private Integer wid;
	private Double record_1;
	private Double record_2;
	private Double record_3;
	private Double record_4;
	private Double record_5;
	private Integer recordversion;
	private java.util.Date recorddate;
	public RecordBean(Integer mid, Integer wid, Double record_1, Double record_2, Double record_3, Double record_4,
			Double record_5, Integer recordversion) {
		this.mid = mid;
		this.wid = wid;
		this.record_1 = record_1;
		this.record_2 = record_2;
		this.record_3 = record_3;
		this.record_4 = record_4;
		this.record_5 = record_5;
		this.recordversion = recordversion;
	}
	public RecordBean() {
		
	}
	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	public Integer getWid() {
		return wid;
	}
	public void setWid(Integer wid) {
		this.wid = wid;
	}
	public Double getRecord_1() {
		return record_1;
	}
	public void setRecord_1(Double record_1) {
		this.record_1 = record_1;
	}
	public Double getRecord_2() {
		return record_2;
	}
	public void setRecord_2(Double record_2) {
		this.record_2 = record_2;
	}
	public Double getRecord_3() {
		return record_3;
	}
	public void setRecord_3(Double record_3) {
		this.record_3 = record_3;
	}
	public Double getRecord_4() {
		return record_4;
	}
	public void setRecord_4(Double record_4) {
		this.record_4 = record_4;
	}
	public Double getRecord_5() {
		return record_5;
	}
	public void setRecord_5(Double record_5) {
		this.record_5 = record_5;
	}
	public java.util.Date getRecorddate() {
		return recorddate;
	}
	public void setRecorddate(java.util.Date recorddate) {
		this.recorddate = recorddate;
	}
	public Integer getRecordversion() {
		return recordversion;
	}
	public void setRecordversion(Integer recordversion) {
		this.recordversion = recordversion;
	}
}
