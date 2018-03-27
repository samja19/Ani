package com.ani.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.ani.dto.Member;
import com.ani.mapper.MemberMapper;

@Repository(value="AccountDao")
public class AccountDao {
	@Autowired
	@Qualifier("memberMapper")
	MemberMapper memberMapper; 
	
	
	public void insertMember(Member member) {
		memberMapper.insertMember(member);
	}

	public Member selectMemberByIdAndPasswd(String id, String passwd) {
		Member member = null;
		HashMap<String,Object> params = new HashMap<>();
		params.put("id", id);
		params.put("passwd", passwd);
		member = memberMapper.selectMemberByIdAndPasswd(params);
		
		return member;
	}

	public Member seletMemberById(String id) {
		Member member =  null;
		member = memberMapper.selectMemberById(id);
		return member;
	}

	public void updateMemberById(Member updatemember) {
		memberMapper.updateMemberById(updatemember);
		
	}

	public ArrayList<Member> selectMemberList() {
		return memberMapper.seletMemberList();
	}
	
	public ArrayList<Member> selectMemberList(int start, int end) {
		HashMap<String,Object> params = new HashMap<>();
		params.put("start", start);
		params.put("end", end);
		return memberMapper.seletMemberListByParmas(params);
	}

 

	public int selectMemberCountById(String id) {
		HashMap<String,Object> params = new HashMap<>();
		params.put("id", id);
		return memberMapper.selectMemberCount(params);
	}

	public int selectMemberCount() {
		HashMap<String,Object> params = new HashMap<>();
		return memberMapper.selectMemberCount(params);
	}

	public int selectNickameCountByNickname(String nickname) {
		HashMap<String,Object> params = new HashMap<>();
		params.put("nickname", nickname);
		return memberMapper.selectNicknameCount(params);
	}

	
	
	
}
