package com.spring.huiloaelag.admin;

public class ProductVO {
	private int pcode;
	private String pname;
	private int pprice;
	private String pinfo;
	private String pimg;
	private String pdetailimg;
	private String pctyimg;
	private int psweet;
	private int psour;
	private int pbody;
	private String plocal;
	
	private int pType;
	private String pTypeTitle;
	private String pTypeInfo;
	
	private int cCnt;
	private int opprice; /* 총 상품 금액 (수량 * 가격)*/
	
	private String searchKeyword;
	public ProductVO() {
		cCnt = 1;
	}
	
	

	// 카테고리 종류 type
	public int getpType() {
		return pType;
	}
	public void setpType(int pType) {
		this.pType = pType;
	}
	
	// 카테고리 종류 안내
	public String getpTypeTitle() {
		return pTypeTitle;
	}
	public void setpTypeTitle(String pTypeTitle) {
		this.pTypeTitle = pTypeTitle;
	}
	public String getpTypeInfo() {
		return pTypeInfo;
	}
	public void setpTypeInfo(String pTypeInfo) {
		this.pTypeInfo = pTypeInfo;
	}	
	//-----------------------------------------
	/* 상세페이지 가격 관련 */
	public int getcCnt() {
		return cCnt;
	}
	public void setcCnt(int cCnt) {
		this.cCnt = cCnt;
	}
	public int getOpprice() {
		return opprice;
	}
	public void setOpprice(int opprice) {
		this.opprice = opprice;
	}
	
	// --------------------------------------------------
	// 검색어
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getPlocal() {
		return plocal;
	}
	public void setPlocal(String plocal) {
		this.plocal = plocal;
	}
	public int getPcode() {
		return pcode;
	}
	public void setPcode(int pcode) {
		this.pcode = pcode;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
		opprice = pprice * cCnt;
		this.pprice = opprice;
		
	}
	public String getPinfo() {
		return pinfo;
	}
	public void setPinfo(String pinfo) {
		this.pinfo = pinfo;
	}
	public String getPimg() {
		return pimg;
	}
	public void setPimg(String pimg) {
		this.pimg = pimg;
	}
	public String getPdetailimg() {
		return pdetailimg;
	}
	public void setPdetailimg(String pdetailimg) {
		this.pdetailimg = pdetailimg;
	}
	public String getPctyimg() {
		return pctyimg;
	}
	public void setPctyimg(String pctyimg) {
		this.pctyimg = pctyimg;
	}
	public int getPsweet() {
		return psweet;
	}
	public void setPsweet(int psweet) {
		this.psweet = psweet;
	}
	public int getPsour() {
		return psour;
	}
	public void setPsour(int psour) {
		this.psour = psour;
	}
	public int getPbody() {
		return pbody;
	}
	public void setPbody(int pbody) {
		this.pbody = pbody;
	}



	@Override
	public String toString() {
		return "ProductVO [pcode=" + pcode + ", pname=" + pname + ", pprice=" + pprice + ", pinfo=" + pinfo + ", pimg="
				+ pimg + ", pdetailimg=" + pdetailimg + ", pctyimg=" + pctyimg + ", psweet=" + psweet + ", psour="
				+ psour + ", pbody=" + pbody + ", plocal=" + plocal + ", pType=" + pType + ", pTypeTitle=" + pTypeTitle
				+ ", pTypeInfo=" + pTypeInfo + ", cCnt=" + cCnt + ", opprice=" + opprice + ", searchKeyword="
				+ searchKeyword + "]";
	}


	

	
}
