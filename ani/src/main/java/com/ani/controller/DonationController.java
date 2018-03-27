package com.ani.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	
	
	
	@RequestMapping(value="list.action", method=RequestMethod.GET)
	public String aniList(Model model) {
		int count = service.getDonationCount();
		model.addAttribute("dcount",count);
		return "adoption/donation_list";
	}
	
	@RequestMapping(value="list.action", method=RequestMethod.POST)
	@ResponseBody
	public ArrayList<Ani> adoptionList(int pagecount, int page) {
		ArrayList<Ani> list = null;
		
		return list;
	} 
}
