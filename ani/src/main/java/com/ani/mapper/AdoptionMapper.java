package com.ani.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.ani.dto.Adoption;
import com.ani.dto.Ani;

public interface AdoptionMapper {
	void insertAdoption(Adoption adoption);

	int selectAniCount();

	ArrayList<Ani> selectAniListByParam(HashMap<String, Object> map);

	ArrayList<Adoption> selectAdoptioinListByAnino(int anino);

	ArrayList<Adoption> selectAdoptioinListByMemberno(int memberno);

	int selectAdoptionCountByAnino(int anino);

	int selectAdoptionCountByMemberno(int memberno);
 
}
