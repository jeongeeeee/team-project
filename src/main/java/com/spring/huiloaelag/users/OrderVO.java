package com.spring.huiloaelag.users;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class OrderVO {
	private int oCode;
	private int uCode;
	private String cOucode;
	private int pCode;
	private Date oDate;
	private int oCnt;
	private int oPrice;
	private String oPay;
	private int cCode;
	
	public OrderVO() {
		System.out.println("Order() 객체 생성");
	}

	public int getoCode() {
		return oCode;
	}

	public void setoCode(int oCode) {
		this.oCode = oCode;
	}

	public int getuCode() {
		return uCode;
	}

	public void setuCode(int uCode) {
		this.uCode = uCode;
	}

	public String getcOucode() {
		return cOucode;
	}

	public void setcOucode(String cOucode) {
		this.cOucode = cOucode;
	}

	public int getpCode() {
		return pCode;
	}

	public void setpCode(int pCode) {
		this.pCode = pCode;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
	public Date getoDate() {
		return oDate;
	}

	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}

	public int getoCnt() {
		return oCnt;
	}

	public void setoCnt(int oCnt) {
		this.oCnt = oCnt;
	}

	public int getoPrice() {
		return oPrice;
	}

	public void setoPrice(int oPrice) {
		this.oPrice = oPrice;
	}

	public String getoPay() {
		return oPay;
	}

	public void setoPay(String oPay) {
		this.oPay = oPay;
	}

	public int getcCode() {
		return cCode;
	}

	public void setcCode(int cCode) {
		this.cCode = cCode;
	}

	@Override
	public String toString() {
		return "OrderVO [oCode=" + oCode + ", uCode=" + uCode + ", cOucode=" + cOucode + ", pCode=" + pCode
				+ ", oDate=" + oDate + ", oCnt=" + oCnt + ", oPrice=" + oPrice + ", oPay=" + oPay + ", cCode=" + cCode
				+ "]";
	}
	
	
	
}
