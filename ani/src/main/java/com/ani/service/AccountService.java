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
		String hashedPasswd = Util.getHashedString(member.getPasswd(), "SHA-256");
		member.setPasswd(hashedPasswd);
		
		
		dao.insertMember(member);
		
	}

	public Member loginMember(String id, String passwd) {
		String hashedPasswd = Util.getHashedString(passwd, "SHA-256");
		Member member = dao.selectMemberByIdAndPasswd(id,hashedPasswd);
		return member;
	}

	public Member getMemberInfoById(String id) {
		Member member = dao.seletMemberById(id);
		return member;
	}

	public void updateMemberInfoById(Member updatemember) {
		String hashedPasswd = Util.getHashedString(updatemember.getPasswd(), "SHA-256");
		updatemember.setPasswd(hashedPasswd);
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
