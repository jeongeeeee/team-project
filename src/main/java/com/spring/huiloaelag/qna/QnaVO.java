package com.spring.huiloaelag.qna;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(value = { "searchDivision", "searchKeyword"})
public class QnaVO {
	private int qCode;
	private int uCode;
	private String qTitle;
	private String qContent;
	private String qPwd;
	private Date qDate;
	private String qComment;
	//*표시할 작성자 이름
	private String uName;
	
	private String searchDivision;
	private String searchKeyword;
	
	public QnaVO() {
		System.out.println(">> QnaVO() 객체 생성");
	}
	
	public int getqCode() {
		return qCode;
	}
	public void setqCode(int qCode) {
		this.qCode = qCode;
	}
	public int getuCode() {
		return uCode;
	}
	public void setuCode(int uCode) {
		this.uCode = uCode;
	}
	public String getqTitle() {
		return qTitle;
	}
	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public String getqContent() {
		return qContent;
	}
	public void setqContent(String qContent) {
		this.qContent = qContent;
	}
	public String getqPwd() {
		return qPwd;
	}
	public void setqPwd(String qPwd) {
		this.qPwd = qPwd;
	}
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
	public Date getqDate() {
		return qDate;
	}
	public void setqDate(Date qDate) {
		this.qDate = qDate;
	}
	public String getqComment() {
		return qComment;
	}
	public void setqComment(String qComment) {
		this.qComment = qComment;
	}
	public String getSearchCondition() {
		return searchDivision;
	}
	public void setSearchCondition(String searchDivision) {
		this.searchDivision = searchDivision;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	@Override
	public String toString() {
		return "QnaVO [qCode=" + qCode + ", uCode=" + uCode + ", qTitle=" + qTitle + ", qContent=" + qContent
				+ ", qPwd=" + qPwd + ", qDate=" + qDate + ", qComment=" + qComment + ", uName=" + uName
				+ ", searchDivision=" + searchDivision + ", searchKeyword=" + searchKeyword + "]";
	}

	
}
