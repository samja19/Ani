package com.ani.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.ani.dto.Adoption;
import com.ani.dto.Ani;

public interface AdoptionMapper {
	void insertAdoption(Adoption adoption);

	int selectAniCount();

	ArrayList<Ani> selectAniListByParam(HashMap<String, Object> map);
 
}
