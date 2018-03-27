package com.ani.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.ani.dto.Adoption;
import com.ani.dto.Ani;
import com.ani.mapper.AdoptionMapper;

@Repository("AdoptionDao")
public class AdoptionDao {
	@Autowired
	@Qualifier("adoptionMapper")
	AdoptionMapper mapper;
	
	public void insertAdoption(Adoption adoption) {
		mapper.insertAdoption(adoption);
	}

	public int selectAniCount() {
		return mapper.selectAniCount();
	}

	public ArrayList<Ani> selectAniList(int start, int end) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("start", start);
		map.put("end",end);
		return mapper.selectAniListByParam(map);
	}
 
 
	
}
