package com.ani.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.ani.dto.MyPage;

public interface MyPageMapper {

	void insertmypage(MyPage mypage);
	
	ArrayList<MyPage> selectMyPageList(HashMap<String, Object> params);

	MyPage selectMypageBymypageNo(Integer mypageNo);

	void updatemypage(MyPage mypage);

	void deletemypage(Integer mypageNo);

	
	

}
