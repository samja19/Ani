package com.ani.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.ani.dto.Adoption;
import com.ani.mapper.AdoptionMapper;

@Repository("AdoptionDao")
public class AdoptionDao {
	@Autowired
	@Qualifier("adoptionMapper")
	AdoptionMapper mapper;
	
	public void insertAdoption(Adoption adoption) {
		mapper.insertAdoption(adoption);
	}
	
}
