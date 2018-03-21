package com.ani.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
@RequestMapping(value="/admin/")
public class AdminController {

	@RequestMapping(value="admin.action", method = RequestMethod.GET)
	public String adminPage() {
		return "admin/admin";
	}
	
	
	
	
}
