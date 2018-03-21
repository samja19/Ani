package com.ani.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
@RequestMapping(value="/aniM/")
public class AniRegisterController {

	@RequestMapping(value="aniregister.action", method = RequestMethod.GET)
	public String aniRegisterForm() {
		return "admin/aniM/aniregister";
	}
	
	
	
	
}
