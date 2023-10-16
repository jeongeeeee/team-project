package com.spring.huiloaelag.community;

public class CommentsVO {
	int cmtCode; //댓글 고유번호
	int uCode; //회원 고유번호
	int mCode; //커뮤니티 글 고유번호
	String cmtContent; //댓글 내용
	int cmtPwd; //댓글 비밀번호(수정/삭제에 사용)
	String uNick;
	
	public int getCmtCode() {
		return cmtCode;
	}
	public void setCmtCode(int cmtCode) {
		this.cmtCode = cmtCode;
	}
	public int getuCode() {
		return uCode;
	}
	public void setuCode(int uCode) {
		this.uCode = uCode;
	}
	public int getmCode() {
		return mCode;
	}
	public void setmCode(int mCode) {
		this.mCode = mCode;
	}
	public String getCmtContent() {
		return cmtContent;
	}
	public void setCmtContent(String cmtContent) {
		this.cmtContent = cmtContent;
	}
	public int getCmtPwd() {
		return cmtPwd;
	}
	public void setCmtPwd(int cmtPwd) {
		this.cmtPwd = cmtPwd;
	}
	public String getuNick() {
		return uNick;
	}
	public void setuNick(String uNick) {
		this.uNick = uNick;
	}
	@Override
	public String toString() {
		return "CommentsVO [cmtCode=" + cmtCode + ", uCode=" + uCode + ", mCode=" + mCode + ", cmtContent=" + cmtContent
				+ ", cmtPwd=" + cmtPwd + ", uNick=" + uNick + "]";
	}
	
	
	
	
}
