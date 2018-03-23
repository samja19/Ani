package com.ani.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.ani.dto.Member;


public interface MemberMapper {

	void insertMember(Member member);

	Member selectMemberByIdAndPasswd(HashMap<String, Object> params);

	Member selectMemberById(String id);

	void updateMemberById(Member updatemember);

	ArrayList<Member> seletMemberList();


	ArrayList<Member> seletMemberListByParmas(HashMap<String, Object> params);
	
	int selectMemberCount(HashMap<String, Object> params);

	int selectNicknameCount(HashMap<String, Object> params);


	 
		
}
