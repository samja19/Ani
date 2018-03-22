package com.ani.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ani.dto.Adoption;
import com.ani.service.AdoptionService;

@Controller
@RequestMapping(value="/adoption/")
public class AdoptionController {
	@Autowired
	@Qualifier("AdoptionService")
	AdoptionService service;
	
	@RequestMapping(value="main.action", method=RequestMethod.GET)
	public String adoptionMain() { 
		return "adoption/adoption_main";
		
	}
	@RequestMapping(value="main.action", method=RequestMethod.POST)
	public String insertAdoption(Adoption adoption) { 
		service.insertAdoption(adoption);
		
		 
		return "redirect:/";
	}
}
