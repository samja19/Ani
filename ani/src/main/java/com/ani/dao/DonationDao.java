package com.ani.dao;

import java.util.ArrayList;

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

	public ArrayList<Donation> selectDonationListByAnino(int anino) {
		return mapper.selectDonationListByAnino(anino);
	}

	public ArrayList<Donation> selectDonationListByMemberno(int memberno) {
		return mapper.selectDonationListByMemberno(memberno);
	}

	public int selectDonationCountByAnino(int anino) {
		Integer result = mapper.selectDonationCountByAnino(anino);
		if(result==null)
			result=0;
		return result;
	}

	public int selectDonationCountByMemberno(int memberno) {
		return  mapper.selectDonationCountByMemberno(memberno);
	}

	public int selectDonationAmountByAnino(int anino) {
		return mapper.selectDonationAmountByAnino(anino);
	
	}

	public int selectDonationAmountByMemberno(int memberno) {
		return mapper.selectDonationAmountByMemberno(memberno);

	}
	 
 
	
}
