package com.ani.dto;

import java.sql.Date;

public class MyPage {
	private int mypageNo;
	private int mypageDel;
	private int memberNo;
	private String mypageContent;
	private Date mypageDate;
	private String mypageTitle;
	
	public String getMypageTitle() {
		return mypageTitle;
	}
	public void setMypageTitle(String mypageTitle) {
		this.mypageTitle = mypageTitle;
	}
	public int getMypageNo() {
		return mypageNo;
	}
	public void setMypageNo(int mypageNo) {
		this.mypageNo = mypageNo;
	}
	public int getMypageDel() {
		return mypageDel;
	}
	public void setMypageDel(int mypageDel) {
		this.mypageDel = mypageDel;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getMypageContent() {
		return mypageContent;
	}
	public void setMypageContent(String mypageContent) {
		this.mypageContent = mypageContent;
	}
	public Date getMypageDate() {
		return mypageDate;
	}
	public void setMypageDate(Date mypageDate) {
		this.mypageDate = mypageDate;
	}
	
}
