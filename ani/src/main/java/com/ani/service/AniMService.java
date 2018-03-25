package com.ani.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ani.dao.AniMDao;
import com.ani.dto.Ani;
import com.ani.dto.AniAttach;

@Service(value = "aniMService")
public class AniMService {
	
	@Autowired
	@Qualifier("aniMDao")
	private AniMDao dao;
	
	public void aniRegister(Ani ani) {
		dao.insertAni(ani);
		
		//첨부파일
		ArrayList<AniAttach> attachments = ani.getAttachments();
		for (AniAttach attachment : attachments) {
			attachment.setAniNo(ani.getAniNo());
			dao.insetAniAttach(attachment);
		}
	}
	
	public ArrayList<Ani> getAniList() {  
		ArrayList<Ani> aniList = dao.selectAniList();
		for (Ani ani : aniList) {
			int aniNo = ani.getAniNo();
			ArrayList<AniAttach> attach = dao.selectAniAttach(aniNo);
			ani.setAttachments(attach);
		}
		return aniList;
	}
	
	public Ani getAniByAniNo(int aniNo) {  
		Ani ani = dao.selectAniByAniNo(aniNo);
		ArrayList<AniAttach> attach = dao.selectAniAttach(aniNo);
		ani.setAttachments(attach);
		return ani;
	}
	
	public void updateAni(Ani ani) {
		dao.updateAni(ani);
	}

	public void deleteAni(int aniNo) {
		dao.deleteAni(aniNo);
	}

	
}
