package com.ani.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/adoption/")
public class AdoptionController {
	
	@RequestMapping(value="main.action")
	public String adoptionMain() { 
		return "adoption/adoption_main";
	}
}
