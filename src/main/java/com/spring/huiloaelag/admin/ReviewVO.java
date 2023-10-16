package com.spring.huiloaelag.admin;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ReviewVO {
	private int rCode;
	private int uCode;
	private int pCode;
	private int rStar;
	private Date rDate;
	private String rTitle;
	private String rContent;
	private String userId;
	private String pName;
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}
	
	public ReviewVO() {
		System.out.println("Review() 객체 실행");
	}

	public int getrCode() {
		return rCode;
	}

	public void setrCode(int rCode) {
		this.rCode = rCode;
	}

	public int getuCode() {
		return uCode;
	}

	public void setuCode(int uCode) {
		this.uCode = uCode;
	}

	public int getpCode() {
		return pCode;
	}

	public void setpCode(int pCode) {
		this.pCode = pCode;
	}

	public int getrStar() {
		return rStar;
	}

	public void setrStar(int rStar) {
		this.rStar = rStar;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
	public Date getrDate() {
		return rDate;
	}

	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}

	public String getrTitle() {
		return rTitle;
	}

	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	@Override
	public String toString() {
		return "ReviewVO [rCode=" + rCode + ", uCode=" + uCode + ", pCode=" + pCode + ", rStar=" + rStar + ", rDate="
				+ rDate + ", rTitle=" + rTitle + ", rContent=" + rContent + ", userId=" + userId + ", pName=" + pName
				+ "]";
	}

}
