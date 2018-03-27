package com.ani.mapper;

import java.util.ArrayList;

import com.ani.dto.Donation;

public interface DonationMapper {

	void insertDonation(Donation d);

	ArrayList<Donation> selectDonationListByAnino(int anino);

	ArrayList<Donation> selectDonationListByMemberno(int memberno);

	int selectDonationCountByAnino(int anino);

	int selectDonationCountByMemberno(int memberno);

	int selectDonationAmountByAnino(int anino);

	int selectDonationAmountByMemberno(int memberno);
 
}
