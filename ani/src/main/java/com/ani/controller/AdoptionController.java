package com.ani.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ani.dto.Adoption;
import com.ani.dto.Ani;
import com.ani.service.AdoptionService;

@Controller
@RequestMapping(value="/adoption/")
public class AdoptionController {
	@Autowired
	@Qualifier("AdoptionService")
	AdoptionService service;
	
	@RequestMapping(value="main.action", method=RequestMethod.GET)
	public String adoptionMain( @RequestParam(value="anino",required=false)Integer anino,
			Model m ,HttpSession session) { 
		System.out.println(anino);
		if(anino==null)
			return "redirect:/adoption/list.action";
		
		m.addAttribute("anino",anino);
		return "adoption/adoption_main";
		
	}
	@RequestMapping(value="main.action", method=RequestMethod.POST)
	public String insertAdoption(Adoption adoption) { 
		
		System.out.println(adoption.getAddress());
		System.out.println(adoption.getAddressDetail());
		System.out.println(adoption.getAnino());
		System.out.println(adoption.getPhone());
		System.out.println(adoption.getPostcode());
		System.out.println(adoption.getReason());
		service.insertAdoption(adoption);
		
		 
		return "redirect:/";
	}
	
	@RequestMapping(value="list.action", method=RequestMethod.GET)
	public String aniList(Model model) {
		int count = service.getAniCount();
		model.addAttribute("aniCount",count);
		return "adoption/ani_list";
	}
	
	
	
	//동물리스트이니 주의
	
	@RequestMapping(value="list.action", method=RequestMethod.POST)
	@ResponseBody
	public ArrayList<Ani> getAniList(
			@RequestParam(value="pagecount",defaultValue="5")int pagecount, 
			@RequestParam(value="page",defaultValue="1")int page) {
		int start=0;
		int end=0; 
		
		start = pagecount*(page-1)+1;
		end = pagecount*page;	
		 
		ArrayList<Ani> list = service.getAniList(start,end);
		
		return list;
	} 
	
	
	
	
	
	
	@RequestMapping(value="getadoptionbyanino", method=RequestMethod.GET)
	public String getAdoptionTest1(
			@RequestParam(value="anino",required=false, defaultValue="12")int anino){
				
		
		ArrayList<Adoption> alist = service.getAdoptionListByAnino(anino);
		for(Adoption a : alist) {
			System.out.println(a.getAnino()+"/"+a.getMemberno()+":"+a.getPostcode());
		}
		
		
		return "redirect:/";
	}
	
	@RequestMapping(value="getadoptionbymemberno", method=RequestMethod.GET)
	public String getAdoptionTest2(
			@RequestParam(value="memberno",required=false, defaultValue="0")int memberno){
		
		ArrayList<Adoption> alist = service.getAdoptionListByMemberno(memberno);
		for(Adoption a : alist) {
			System.out.println(a.getAnino()+"/"+a.getMemberno()+":"+a.getPostcode());
		}
		return "redirect:/";
	}	
	
	@RequestMapping(value="getadoptioncountbyanino")
	public String getAdoptionTest3(
			@RequestParam(value="anino",required=false,defaultValue="12")int anino
			){
		
		int count = service.getAdoptionCountByAnino(anino);
		System.out.println(count);
		return "redirect:/";
	}
	
	@RequestMapping(value="getadoptioncountbymemberno")
	public String getAdoptionTest4(
			@RequestParam(value="memberno",required=false,defaultValue="0")int memberno
			){
		int count = service.getAdoptionCountByMemberno(memberno);
		System.out.println(count);
		return "redirect:/";
	}
	
	
	
	
	
	
}
