package com.ani.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
 
import com.ani.dao.DonationDao;
import com.ani.dto.Donation; 

@Service("DonationService")
public class DonationService {
	@Autowired
	@Qualifier("DonationDao")
	DonationDao dao;

	public int getDonationCount() { 
		return 0;
	}

	public void insertDonation(Donation d) {
		dao.insertDonation(d);
		
	}
 
}
