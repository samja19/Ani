package com.ani.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
 
import com.ani.dao.AdoptionDao;
import com.ani.dto.Adoption;
import com.ani.dto.Ani;

@Service("AdoptionService")
public class AdoptionService {
	@Autowired
	@Qualifier("AdoptionDao")
	AdoptionDao dao;

	public void insertAdoption(Adoption adoption) {
		dao.insertAdoption(adoption);
		
	}
 
	public int getAniCount() { 
		return dao.selectAniCount();
	}

	public ArrayList<Ani> getAniList(int start, int end) {
		return dao.selectAniList(start, end);
	}

	public ArrayList<Adoption> getAdoptionListByAnino(int anino) {
		return dao.selectAdoptionListByAnino(anino);
	}

	public ArrayList<Adoption> getAdoptionListByMemberno(int memberno) {
		return dao.selectAdoptionListByMemberno(memberno);
	}

	public int getAdoptionCountByAnino(int anino) {
		return dao.selectAdoptionCountByAnino(anino);
	}

	public int getAdoptionCountByMemberno(int memberno) {
		return dao.selectAdoptionCountByMemberno(memberno);
	}
 
}
