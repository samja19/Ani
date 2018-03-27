package com.ani.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ani.dao.MyPageDao;
import com.ani.dto.Donation;
import com.ani.dto.InterestAni;
import com.ani.dto.Member;
import com.ani.dto.MyPage;

@Service(value="mypageService")
public class MyPageService {
	@Autowired
	@Qualifier("mypageDao")
	private MyPageDao dao;

	public void mypagewrite(MyPage mypage) {
		dao.insertMypage(mypage);		
	}
	
	public ArrayList<MyPage> getMypageList(int first, int last) {
		ArrayList<MyPage> mypages = dao.selectMyPageList(first,last);
		return mypages;
	}

	public int getPageCount() {
		int countMypage = dao.countMypage();
		return countMypage;
	}

	public MyPage getMypageByMypageNo(Integer mypageNo) {
		MyPage mypage = dao.selectMypageBymypageNo(mypageNo);
		return mypage;
	}

	public void mypageupdate(MyPage mypage) {
		dao.updatemypage(mypage);
	}

	public void mypagedelete(Integer mypageNo) {
		dao.deletemypage(mypageNo);
	}

	public Member getMyProfile() {
		Member member = dao.getMyProfile();
		return member;
	}

	public ArrayList<Donation> getDonateAniList() {
		ArrayList<Donation> donateAni = dao.getDonateAniList();
		return donateAni;
	}

	public ArrayList<InterestAni> getInterestAniList() {
		ArrayList<InterestAni> interestAni = dao.getInterestAniList();
		return interestAni;
	}

	
	
	
	
}
