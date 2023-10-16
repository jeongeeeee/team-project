package com.spring.huiloaelag.product;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MypageVO {
	private String pName;
	private String pCtyimg;
	private int pPrice;
	private int oCnt;
	private Date oDate;
	private int uCode;
	private int pCode;
	
	public MypageVO() {
		// TODO Auto-generated constructor stub
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpCtyimg() {
		return pCtyimg;
	}

	public void setpCtyimg(String pCtyimg) {
		this.pCtyimg = pCtyimg;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public int getoCnt() {
		return oCnt;
	}

	public void setoCnt(int oCnt) {
		this.oCnt = oCnt;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
	public Date getoDate() {
		return oDate;
	}

	public void setoDate(Date oDate) {
		this.oDate = oDate;
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

	@Override
	public String toString() {
		return "MypageVO [pName=" + pName + ", pCtyimg=" + pCtyimg + ", pPrice=" + pPrice + ", oCnt=" + oCnt
				+ ", oDate=" + oDate + ", uCode=" + uCode + ", pCode=" + pCode + "]";
	}
	
	
}
