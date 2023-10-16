package com.spring.huiloaelag.users;

public class UserVO {
	private int ucode;
	private String userId;
	private String userPwd;
	private String uname;
	private String unick;
	private String uaddr;
	private int ugender;
	private String uemail;
	private int ubirth;
	private String uphone;
	
	public int getUcode() {
		return ucode;
	}
	public void setUcode(int ucode) {
		this.ucode = ucode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUnick() {
		return unick;
	}
	public void setUnick(String unick) {
		this.unick = unick;
	}
	public String getUaddr() {
		return uaddr;
	}
	public void setUaddr(String uaddr) {
		this.uaddr = uaddr;
	}
	public int getUgender() {
		return ugender;
	}
	public void setUgender(int ugender) {
		this.ugender = ugender;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public int getUbirth() {
		return ubirth;
	}
	public void setUbirth(int ubirth) {
		this.ubirth = ubirth;
	}
	public String getUphone() {
		return uphone;
	}
	public void setUphone(String uphone) {
		this.uphone = uphone;
	}
	
	@Override
	public String toString() {
		return "userVO [ucode=" + ucode + ", userId=" + userId + ", userPwd=" + userPwd + ", uname=" + uname
				+ ", unick=" + unick + ", uaddr=" + uaddr + ", ugender=" + ugender + ", uemail=" + uemail + ", ubirth="
				+ ubirth + ", uphone=" + uphone + "]";
	}

}
