package com.ani.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.ani.dto.Ani;
import com.ani.dto.AniAttach;
import com.ani.mapper.AniMMapper;

@Repository(value = "aniMDao")
public class AniMDao {

	@Autowired
	@Qualifier("aniMMapper")
	AniMMapper aniMMapper;
	
	
	public void insertAni(Ani ani) {
		aniMMapper.insertAni(ani);
	}

	public void insetAniAttach(AniAttach attachment) {
		aniMMapper.insertAniAttach(attachment);
	}

	public int selectAniCount() {
		HashMap<String,Object> params = new HashMap<>();
		return aniMMapper.selectAniCount(params);
	}
	
	public ArrayList<Ani> selectAniList() {
		return aniMMapper.selectAniList();
	}
	
	public ArrayList<Ani> selectAniListByParams(int start, int end) {
		HashMap<String,Object> params = new HashMap<>();
		params.put("start", start);
		params.put("end", end);
		return aniMMapper.selectAniListByParams(params);
	}

	public Ani selectAniByAniNo(int aniNo) {
		Ani ani = aniMMapper.selectAniByAniNo(aniNo);
		return ani;
	}
	
	public ArrayList<AniAttach> selectAniAttach(int aniNo) {		
		return aniMMapper.selectAniAttach(aniNo);
	}
	
	public void updateAni(Ani ani) {
		aniMMapper.updateAni(ani);
	}
	
	public void deleteAni(int aniNo) {
		aniMMapper.deleteAni(aniNo);
	}
	
	public void deleteAniAttach(int aniAttachNo) {
		aniMMapper.deleteAniAttach(aniAttachNo);	
	}

	public void updateAdopted(int aniNo, int adopted) {
		HashMap<String,Object> params = new HashMap<>();
		params.put("aniNo", aniNo);
		params.put("adopted", adopted);
		aniMMapper.updateAdopted(params);
	}
	
}
