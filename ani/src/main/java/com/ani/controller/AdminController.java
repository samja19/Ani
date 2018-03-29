package com.ani.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ani.dto.Member;
import com.ani.service.AccountService;



@Controller
@RequestMapping(value="/admin/")
public class AdminController {
	
	@Autowired
	@Qualifier("AccountService")
	AccountService service;

	@RequestMapping(value="memberlist.action", method=RequestMethod.GET)
	public String memberlistForm( Model model) {
		int count = 0;
		count = service.getMemberCount();
		
		model.addAttribute("memberCount",count);
		return "admin/memberlist";
		
	}
	@RequestMapping(value="memberlist.action", method=RequestMethod.POST )
	@ResponseBody
	public ArrayList<Member> memberlist(HttpServletResponse resp,
			@RequestParam(value="pageno")int pageno,
			@RequestParam(value="pagecount")int pagecount) throws IOException {
//		System.out.println(pageno+"/"+pagecount);
		
		int start = (pageno-1)*pagecount+1;
		int end = pageno*pagecount;
//		System.out.println(start+"/"+end);
		ArrayList<Member> list = service.getMemberList(start, end);
		
		return list;
		
	}
	@RequestMapping(value="admin.action", method = RequestMethod.GET)
	public String adminPage() {
		return "admin/admin";
	}
	
	
	
	
}
