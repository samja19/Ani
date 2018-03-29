package com.ani.service;
 
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ani.common.Util;
import com.ani.dao.AccountDao;
import com.ani.dto.Member;



@Service(value="AccountService")
public class AccountService {
	@Autowired
	@Qualifier("AccountDao")
	AccountDao dao;
	
	public void registerMember(Member member) {
		String hashedPassword = Util.getHashedString(member.getPassword(), "SHA-256");
		member.setPassword(hashedPassword);
		
		
		dao.insertMember(member);
		
	}

	public Member loginMember(String id, String password) {
		String hashedPassword = Util.getHashedString(password, "SHA-256");
		Member member = dao.selectMemberByIdAndPassword(id,hashedPassword);
		return member;
	}

	public Member getMemberInfoById(String id) {
		Member member = dao.seletMemberById(id);
		return member;
	}

	public void updateMemberInfoById(Member updatemember) {
		String hashedPassword = Util.getHashedString(updatemember.getPassword(), "SHA-256");
		updatemember.setPassword(hashedPassword);
		dao.updateMemberById(updatemember);
	}

	public ArrayList<Member> getMemberList() {
		return dao.selectMemberList();
	}

	public ArrayList<Member> getMemberList(int start, int end) {
		return dao.selectMemberList(start, end);
	}
	
	
	public int getMemberCount() {
		return dao.selectMemberCount();
	}

	public int validationId(String id) {
		return dao.selectMemberCountById(id);
	}

	public int validationNickname(String nickname) {
		return dao.selectNickameCountByNickname(nickname);
	}


	
	
}
