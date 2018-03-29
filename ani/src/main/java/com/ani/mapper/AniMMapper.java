package com.ani.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.ani.dto.Ani;
import com.ani.dto.AniAttach;

public interface AniMMapper {

	public void insertAni(Ani ani);
	public void insertAniAttach(AniAttach attachment);
	

	public int selectAniCount(HashMap<String, Object> params);
	ArrayList<Ani> selectAniList();
	ArrayList<Ani> selectAniListByParams(HashMap<String, Object> params);
	Ani selectAniByAniNo(int aniNo);
	public ArrayList<AniAttach> selectAniAttach(int aniNo);
	
	void updateAni(Ani ani);
	void deleteAni(int aniNo);
	void deleteAniAttach(int aniAttachNo);
	void updateAdopted(HashMap<String, Object> params);
	
}
