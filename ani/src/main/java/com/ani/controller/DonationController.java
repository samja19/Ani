package com.ani.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ani.dto.Ani;
import com.ani.dto.Donation;
import com.ani.service.DonationService;

@Controller
@RequestMapping(value="/donation/")
public class DonationController {
	@Autowired
	@Qualifier("DonationService")
	DonationService service;
	
	@RequestMapping(value="main.action", method=RequestMethod.GET)
	public String donationMain() { 
		return "donation/donation_main";
		
	}

	@RequestMapping(value="main.action", method=RequestMethod.POST)
	public String insertDonation(Donation d) { 
		service.insertDonation(d);
		 //
		return "redirect:/";
		
	}
	
	
	@RequestMapping(value="selectdobyanino.action", method=RequestMethod.GET)
	public String selectTest1(
			@RequestParam(value="anino", required=false, defaultValue="7")int anino) {
		ArrayList<Donation> dlist = service.selectDonationListByAni(anino);
		for(Donation d : dlist) {
			System.out.println("ano="+d.getAnino()+", mno="+d.getMemberno()+":"+d.getDoamount());
		}
		return "redirect:/";
	}
	
	@RequestMapping(value="selectdobymemberno.action", method=RequestMethod.GET)
	public String selectTest2(
			@RequestParam(value="memberno", required=false, defaultValue="0")int memberno) {
		ArrayList<Donation> dlist = service.selectDonationListByMemberno(memberno);
		
		for(Donation d : dlist) {
			System.out.println("ano="+d.getAnino()+", mno="+d.getMemberno()+":"+d.getDoamount());
		}
		return "redirect:/";
	}
	
	
	@RequestMapping(value="getdcountbyanino")
	public String getAdoptionTest3(
			@RequestParam(value="anino",required=false,defaultValue="12")int anino
			){
		
		int count = service.getDonationCountByAnino(anino);
		System.out.println(count);
		return "redirect:/";
	}
	
	@RequestMapping(value="getdcountbymemberno")
	public String getAdoptionTest4(
			@RequestParam(value="memberno",required=false,defaultValue="0")int memberno
			){
		int count = service.getDonationCountByMemberno(memberno);
		System.out.println(count);
		return "redirect:/";
	}
	
	@RequestMapping(value="getdamountbyanino")
	public String getAdoptionTest5(
			@RequestParam(value="anino",required=false,defaultValue="7")int anino
			){
		int amount = service.getDonationAmountByAnino(anino);
		System.out.println(amount);
		return "redirect:/";
	}
	
	@RequestMapping(value="getdamountbymemberno")
	public String getAdoptionTest6(
			@RequestParam(value="memberno",required=false,defaultValue="0")int memberno
			){
		int amount = service.getDonationAmountByMemberno(memberno);
		System.out.println(amount);
		return "redirect:/";
	}
	 
	
}
