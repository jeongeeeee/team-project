package com.spring.huiloaelag.notify;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class NoticeVO {
	private int ncode;
	private int ucode;
	private String ntitle;
	private String ncontent;
	private Date ndate;
	public int getNcode() {
		return ncode;
	}
	public void setNcode(int ncode) {
		this.ncode = ncode;
	}
	public int getUcode() {
		return ucode;
	}
	public void setUcode(int ucode) {
		this.ucode = ucode;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNcontent() {
		return ncontent;
	}
	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
	public Date getNdate() {
		return ndate;
	}
	public void setNdate(Date ndate) {
		this.ndate = ndate;
	}
	
	@Override
	public String toString() {
		return "NoticeVO [ncode=" + ncode + ", ucode=" + ucode + ", ntitle=" + ntitle + ", ncontent=" + ncontent
				+ ", ndate=" + ndate + "]";
	}
}
