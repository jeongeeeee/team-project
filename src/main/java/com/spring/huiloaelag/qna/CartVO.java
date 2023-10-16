package com.spring.huiloaelag.qna;

public class CartVO {
	/* 장바구니에서 필요한 것 
	 * 장바구니코드
	 * 유저코드
	 * 상품코드
	 * 상품개수
	 * 유저이름(?)
	 * 상품명
	 * 상품가격
	 * 상품이미지(pcty)
	 * 총 주문금액
	 */
	private int cCode;
	private int uCode;
	private int pCode;
	private int cCnt;
	private String uName;
	private String pName;
	private int pPrice;
	private String pCtyimg;
	private int cPrice;
	
	public int getcCode() {
		return cCode;
	}
	public void setcCode(int cCode) {
		this.cCode = cCode;
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
	public int getcCnt() {
		return cCnt;
	}
	public void setcCnt(int cCnt) {
		this.cCnt = cCnt;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
		cPrice = pPrice * cCnt;
	}
	public String getpCtyimg() {
		return pCtyimg;
	}
	public void setpCtyimg(String pCtyimg) {
		this.pCtyimg = pCtyimg;
	}
	public int getcPrice() {
		return cPrice;
	}
	public void setcPrice(int cPrice) {
		this.cPrice = cPrice;
	}
	
	@Override
	public String toString() {
		return "CartVO [cCode=" + cCode + ", uCode=" + uCode + ", pCode=" + pCode + ", cCnt=" + cCnt + ", uName="
				+ uName + ", pName=" + pName + ", pPrice=" + pPrice + ", pCtyimg=" + pCtyimg + ", cPrice=" + cPrice
				+ "]";
	}

}
