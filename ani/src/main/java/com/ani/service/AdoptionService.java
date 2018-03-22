package com.ani.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ani.dao.AdoptionDao;
import com.ani.dto.Adoption;

@Service("AdoptionService")
public class AdoptionService {
	@Autowired
	@Qualifier("AdoptionDao")
	AdoptionDao dao;

	public void insertAdoption(Adoption adoption) {
		dao.insertAdoption(adoption);
		
	}
 
}
