package com.spring.huiloaelag.admin.pageing;

public class PagingVO {
	//product
	private int divisionNum;
	
	//user, QNA
	private String searchDivision;
	private String searchKeyword;
	
	//공통
	private int nowPageNum;
	private int totalNum;
	private int startPage;
	private int endPage;
	private int lastPage;
	private int cntPerPage;
	private int sqlStart;
	private int sqlEnd;
	private int cntPage = 10;
	
	public PagingVO() {}
	
	//product생성자
	public PagingVO(int total, int nowPage, int cntPerPage, int divisionNum) {
		setNowPageNum(nowPage);
		setCntPerPage(cntPerPage);
		setTotalNum(total);
		setDivisionNum(divisionNum);
		calcLastPage(getTotalNum(), getCntPerPage());
		calcStartEndPage(getNowPageNum(), cntPage);
		calcStartEnd(getNowPageNum(), getCntPerPage());
	}
	
	//User검색생성자
	public PagingVO(String searchDivision, String searchKeyword) {
		setSearchDivision(searchDivision);
		setSearchKeyword(searchKeyword);
	}
	//User생성자
	public PagingVO(int total, int nowPage, int cntPerPage, String searchDivision, String searchKeyword) {
		setNowPageNum(nowPage);
		setCntPerPage(cntPerPage);
		setTotalNum(total);
		setSearchDivision(searchDivision);
		setSearchKeyword(searchKeyword);
		calcLastPage(getTotalNum(), getCntPerPage());
		calcStartEndPage(getNowPageNum(), cntPage);
		calcStartEnd(getNowPageNum(), getCntPerPage());
	}
	
	//리뷰생성자
	public PagingVO(int total, int nowPage, int cntPerPage) {
		setNowPageNum(nowPage);
		setCntPerPage(cntPerPage);
		setTotalNum(total);
		calcLastPage(getTotalNum(), getCntPerPage());
		calcStartEndPage(getNowPageNum(), cntPage);
		calcStartEnd(getNowPageNum(), getCntPerPage());
	}
	
	//QnA생성자
	public PagingVO(int total, int nowPage, int cntPerPage, String searchKeyword) {
		setNowPageNum(nowPage);
		setCntPerPage(cntPerPage);
		setTotalNum(total);
		setSearchKeyword(searchKeyword);
		calcLastPage(getTotalNum(), getCntPerPage());
		calcStartEndPage(getNowPageNum(), cntPage);
		calcStartEnd(getNowPageNum(), getCntPerPage());
	}

	// 제일 마지막 페이지 계산
	public void calcLastPage(int total, int cntPerPage) {
		setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
	}
	// 시작, 끝 페이지 계산
	public void calcStartEndPage(int nowPage, int cntPage) {
		setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
		if (getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - cntPage + 1);
		if (getStartPage() < 1) {
			setStartPage(1);
		}
	}
	// DB 쿼리에서 사용할 start, end값 계산
	public void calcStartEnd(int nowPage, int cntPerPage) {
		setSqlEnd(nowPage * cntPerPage);
		setSqlStart(getSqlEnd() - cntPerPage + 1);
	}
	
	public int getDivisionNum() {
		return divisionNum;
	}

	public void setDivisionNum(int divisionNum) {
		this.divisionNum = divisionNum;
	}

	public int getNowPageNum() {
		return nowPageNum;
	}
	public void setNowPageNum(int nowPageNum) {
		this.nowPageNum = nowPageNum;
	}
	public int getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getCntPerPage() {
		return cntPerPage;
	}
	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}
	public int getSqlStart() {
		return sqlStart;
	}
	public void setSqlStart(int sqlStart) {
		this.sqlStart = sqlStart;
	}
	public int getSqlEnd() {
		return sqlEnd;
	}
	public void setSqlEnd(int sqlEnd) {
		this.sqlEnd = sqlEnd;
	}
	public int getCntPage() {
		return cntPage;
	}
	public void setCntPage(int cntPage) {
		this.cntPage = cntPage;
	}

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

	@Override
	public String toString() {
		return "PagingVO [divisionNum=" + divisionNum + ", searchDivision=" + searchDivision + ", searchKeyword="
				+ searchKeyword + ", nowPageNum=" + nowPageNum + ", totalNum=" + totalNum + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", lastPage=" + lastPage + ", cntPerPage=" + cntPerPage + ", sqlStart="
				+ sqlStart + ", sqlEnd=" + sqlEnd + ", cntPage=" + cntPage + "]";
	}
	

}
