package com.ani.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ani.dao.MyPageDao;
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

	
	
	
	
}