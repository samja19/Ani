package com.ani.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.ani.dto.Donation;
import com.ani.mapper.DonationMapper;

@Repository("DonationDao")
public class DonationDao {
	@Autowired
	@Qualifier("donationMapper")
	DonationMapper mapper;

	public void insertDonation(Donation d) {
		mapper.insertDonation(d);
		
	}
	
	 
 
 
	
}
