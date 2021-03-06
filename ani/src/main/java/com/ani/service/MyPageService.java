package com.ani.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ani.dao.MyPageDao;
import com.ani.dto.Ani;
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


	public ArrayList<Ani> selectAniByMemberno() {
		ArrayList<Ani> ani = dao.selectAniByMemberno();
		return ani;
	}


	public ArrayList<Donation> selectDonationListByMemberno() {
		ArrayList<Donation> don = dao.selectDonationListByMemberno();
		return don;
	}

	public ArrayList<InterestAni> selectInterestListByMemberno(Member member) {
		ArrayList<InterestAni> intr = dao.selectInterestListByMemberno(member);
		return intr;
	}

	public ArrayList<Ani> selectAniByMemberno2(Member member) {
		ArrayList<Ani> ani = dao.selectAniByMemberno2(member);
		return ani;
	}

}
