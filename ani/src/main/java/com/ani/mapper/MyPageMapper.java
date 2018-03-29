package com.ani.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.ani.dto.Ani;
import com.ani.dto.Donation;
import com.ani.dto.InterestAni;
import com.ani.dto.Member;
import com.ani.dto.MyPage;

public interface MyPageMapper {

	void insertmypage(MyPage mypage);
	
	ArrayList<MyPage> selectMyPageList(HashMap<String, Object> params);

	MyPage selectMypageBymypageNo(Integer mypageNo);

	void updatemypage(MyPage mypage);

	void deletemypage(Integer mypageNo);

	Member getMyProfile();

	ArrayList<Donation> getDonationAniList();

	ArrayList<Ani> selectAniByMemberno();

	ArrayList<Ani> selectSpeciesByMemberno();

	ArrayList<Donation> selectDonationListByMemberno();

	
	

}
