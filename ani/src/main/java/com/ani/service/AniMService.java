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
	
	public int getAniCount() {
		return dao.selectAniCount();
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
	
	public ArrayList<Ani> getAniListByParams(int start, int end) {  
		ArrayList<Ani> aniList = dao.selectAniListByParams(start, end);
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
		//첨부파일
		ArrayList<AniAttach> attachments = ani.getAttachments();
		for (AniAttach attachment : attachments) {
			attachment.setAniNo(ani.getAniNo());
			dao.insetAniAttach(attachment);
		}
	}

	public void deleteAni(int aniNo) {
		
		ArrayList<AniAttach> attachments = dao.selectAniAttach(aniNo);
		for (AniAttach attachment : attachments) {
			int aniAttachNo = attachment.getAniAttachNo();
			dao.deleteAniAttach(aniAttachNo);
		}
		dao.deleteAni(aniNo);
	}

	public void deleteAniAttach(int aniAttachNo) {
		dao.deleteAniAttach(aniAttachNo);
	}
	
	public void updateAdopted(int aniNo, int adopted) { 
		dao.updateAdopted(aniNo, adopted);
	}
}
