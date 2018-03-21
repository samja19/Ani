package com.ani.dao;

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

}
