package com.ani.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.ani.dto.Ani;
import com.ani.dto.AniAttach;

public interface AniMMapper {

	public void insertAni(Ani ani);
	public void insertAniAttach(AniAttach attachment);
	
	ArrayList<Ani> selectAniList();
	Ani selectAniByAniNo(int aniNo);
	public ArrayList<AniAttach> selectAniAttach(int aniNo);
	
	void updateAni(Ani ani);
	void deleteAni(int aniNo);
}
