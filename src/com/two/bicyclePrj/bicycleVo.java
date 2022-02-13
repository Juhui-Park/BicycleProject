package com.two.bicyclePrj;

import java.sql.Date;

public class bicycleVo {
	private String bicycleId;
	private Date rentalDatetime;
	private String rentalOfficeNo;
	private String rentalOfficeName;
	private Date returnDatetime;
	private String returnOfficeNo;
	private String returnOfficeName;
	private int ridingTime;
	private int ridingDistance;
	
	public bicycleVo() {
		super();
	}
	public String getBicycleId() {
		return bicycleId;
	}
	public void setBicycleId(String bicycleId) {
		this.bicycleId = bicycleId;
	}
	public Date getRentalDatetime() {
		return rentalDatetime;
	}
	public void setRentalDatetime(Date rentalDatetime) {
		this.rentalDatetime = rentalDatetime;
	}
	public String getRentalOfficeNo() {
		return rentalOfficeNo;
	}
	public void setRentalOfficeNo(String rentalOfficeNo) {
		this.rentalOfficeNo = rentalOfficeNo;
	}
	public String getRentalOfficeName() {
		return rentalOfficeName;
	}
	public void setRentalOfficeName(String rentalOfficeName) {
		this.rentalOfficeName = rentalOfficeName;
	}
	public Date getReturnDatetime() {
		return returnDatetime;
	}
	public void setReturnDatetime(Date returnDatetime) {
		this.returnDatetime = returnDatetime;
	}
	public String getReturnOfficeNo() {
		return returnOfficeNo;
	}
	public void setReturnOfficeNo(String returnOfficeNo) {
		this.returnOfficeNo = returnOfficeNo;
	}
	public String getReturnOfficeName() {
		return returnOfficeName;
	}
	public void setReturnOfficeName(String returnOfficeName) {
		this.returnOfficeName = returnOfficeName;
	}
	public int getRidingTime() {
		return ridingTime;
	}
	public void setRidingTime(int ridingTime) {
		this.ridingTime = ridingTime;
	}
	public int getRidingDistance() {
		return ridingDistance;
	}
	public void setRidingDistance(int ridingDistance) {
		this.ridingDistance = ridingDistance;
	}
	@Override
	public String toString() {
		return "bicycleVo [bicycleId=" + bicycleId + ", rentalDatetime=" + rentalDatetime + ", rentalOfficeNo="
				+ rentalOfficeNo + ", rentalOfficeName=" + rentalOfficeName + ", returnDatetime=" + returnDatetime
				+ ", returnOfficeNo=" + returnOfficeNo + ", returnOfficeName=" + returnOfficeName + ", ridingTime="
				+ ridingTime + ", ridingDistance=" + ridingDistance + "]";
	}

	
}
