package com.spring.huiloaelag.community;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(value = { "searchDivision", "searchKeyword" })
public class CommunityVO {
	private int mCode;
	private int uCode;
	private String mTitle;
	private String mContent;
	private Date mDate;
	private String mPwd;
	private int mGood;
	private String uNick;
	
	//--검색조건 처리용
	//@JsonIgnore // JSON 데이터 변경 제외
	private String searchDivision;
	//@JsonIgnore
	private String searchKeyword;
	
	public CommunityVO() {
		System.out.println("Community() 객체 생성");
	}

	public int getmCode() {
		return mCode;
	}

	public void setmCode(int mCode) {
		this.mCode = mCode;
	}

	public int getuCode() {
		return uCode;
	}

	public void setuCode(int uCode) {
		this.uCode = uCode;
	}

	public String getmTitle() {
		return mTitle;
	}

	public void setmTitle(String mTitle) {
		this.mTitle = mTitle;
	}
	
	public String getmContent() {
		return mContent;
	}

	public void setmContent(String mContent) {
		this.mContent = mContent;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
	public Date getmDate() {
		return mDate;
	}

	public void setmDate(Date mDate) {
		this.mDate = mDate;
	}

	public String getmPwd() {
		return mPwd;
	}

	public void setmPwd(String mPwd) {
		this.mPwd = mPwd;
	}

	public int getmGood() {
		return mGood;
	}

	public void setmGood(int mGood) {
		this.mGood = mGood;
	}
	

//	@Override
//	public String toString() {
//		return "CommunityVO [mCode=" + mCode + ", uCode=" + uCode + ", mTitle=" + mTitle + ", mContent=" + mContent
//				+ ", mDate=" + mDate + ", mPwd=" + mPwd + ", mGood=" + mGood + "]";
//	}
	
	public String getuNick() {
		return uNick;
	}

	public void setuNick(String uNick) {
		this.uNick = uNick;
	}

	@Override
	public String toString() {
		return "CommunityVO [mCode=" + mCode + ", uCode=" + uCode + ", mTitle=" + mTitle + ", mContent=" + mContent
				+ ", mDate=" + mDate + ", mPwd=" + mPwd + ", mGood=" + mGood + ", uNick=" + uNick + ", searchDivision="
				+ searchDivision + ", searchKeyword=" + searchKeyword + "]";
	}

	//------------------------
	public String getSearchDivision() {
		return searchDivision;
	}

	public void setSearchDivision(String searchDivision) {
		this.searchDivision = searchDivision;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
}
