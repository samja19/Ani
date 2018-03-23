package com.ani.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.AbstractView;

import com.ani.common.Util;
import com.ani.dto.Member;
import com.ani.service.AccountService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;

@Controller
@RequestMapping(value="/account/")
public class AccountController {
	
	@Autowired
	@Qualifier("AccountService")
	AccountService service;
	
	
	@RequestMapping(value="register.action", method = RequestMethod.GET)
	public String registerForm(Member member) {
		
		return "account/register";
	}
	
	@RequestMapping(value="register.action", method = RequestMethod.POST)
	public String register(
			@Valid
			Member member,BindingResult bindingResult) {
		
		if (bindingResult.hasErrors()) {
			return "account/register";
		}
		
		System.out.println(member.getId());
		service.registerMember(member);
		
		
 
		return "home";
	}
	 
	@RequestMapping(value="login.action", method = RequestMethod.GET)
	public String loginForm() {
		 
		return "account/login";
		
	}
	
	
	
	@RequestMapping(value="login.action", method = RequestMethod.POST)
	@ResponseBody
	public String login(@RequestParam(value="loginid") String id, 
			@RequestParam(value="loginpasswd")String passwd,
			HttpSession session  ) {
		
		System.out.println(id);
		System.out.println(Util.getHashedString(passwd, "SHA-256"));
		Member member= service.loginMember(id,passwd);
		String result = "fail";
		  
		System.out.println(result);
		return result;
	}
	
	
	@RequestMapping(value="logout.action", method = RequestMethod.GET)
	public String logout(
			HttpSession session) {
		 
		if(session.getAttribute("loginuser")!=null) {
			session.removeAttribute("loginuser");
		}
		
		return "redirect:/home.action";
		
	}
	
	
	@RequestMapping(value="update.action", method = RequestMethod.GET)
	public String updateForm(HttpSession session, Model model ) {
		Member userid = (Member) session.getAttribute("loginuser");
		Member member = service.getMemberInfoById(userid.getId());
		
		model.addAttribute("userinfo",member);
		
		return "account/update";
		
	}
	
	@RequestMapping(value="update.action", method = RequestMethod.POST)
	public String update(HttpSession session, Member updatemember) {
		

		Member userid = (Member) session.getAttribute("loginuser");
		//멤버 수정.
		updatemember.setId(userid.getId());
		
		service.updateMemberInfoById(updatemember);
		
		// 수정된 내용 세션에 업데이트
		
		Member member= service.getMemberInfoById(userid.getId());
		session.removeAttribute("loginuser");
		session.setAttribute("loginuser", member);
		
		
		return "home";
		
	}
	
	@RequestMapping(value="valiid.action", method=RequestMethod.POST)
	@ResponseBody
	public int valiId(HttpServletResponse resp, @RequestParam(value="id")String id) throws IOException{
		int exist = service.validationId(id);
		return exist;
		
	}
	
	@RequestMapping(value="valinick.action", method=RequestMethod.POST)
	@ResponseBody
	public int valiNick(HttpServletResponse resp, @RequestParam(value="nickname")String nickname) throws IOException{
		int exist = service.validationNickname(nickname);
		return exist;
		
	}
	
	
	@RequestMapping(value="test.action", method=RequestMethod.GET)
	public String testform(Member member){
		return "account/test";
	}
	
	@RequestMapping(value="test.action", method=RequestMethod.POST)
	public String test(
			@Valid
			Member member,BindingResult bindingResult){
		if(bindingResult.hasErrors()) {	
			System.out.println(member.getId());
			System.out.println("에러발생");
			return "account/test";
		}
		
		return "home";
	}
	

	

	
	
	
	
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(df,false));
		//필수 입력이 아니면 allow 필수입력이면 false
	}
	
	
	
}
