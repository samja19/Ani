package com.ani.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ani.common.Util;
import com.ani.dto.Ani;
import com.ani.dto.AniAttach;
import com.ani.service.AniMService;

@Controller
@RequestMapping(value="/aniM/")
public class AniMController {

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format, false));
	}
	
	
	@Autowired
	@Qualifier("aniMService")
	private AniMService service;
	
	@RequestMapping(value="aniregister.action", method = RequestMethod.GET)
	public String aniRegisterForm(Ani ani) {
		return "admin/aniM/aniregister";
	}
	
	
	@RequestMapping(value = "/aniregister.action", method = RequestMethod.POST)
	public String aniRegister(MultipartHttpServletRequest req, Ani ani) {
		
		AniAttach attach = null;
		MultipartFile file =req.getFile("aniAttach");
		if (!file.isEmpty() && 
				file.getOriginalFilename().length() != 0) {
			String path = req.getServletContext().getRealPath("/resources/animg/");	
			String aniSaveName =file.getOriginalFilename();
			aniSaveName = Util.makeUniqueFileName(aniSaveName);
			try {
				file.transferTo(new File(path, aniSaveName));
				attach= new AniAttach();
				attach.setAniSaveName(aniSaveName);
				attach.setAniUserName(file.getOriginalFilename());
			}catch(Exception ex) {}
				
		}
		ArrayList<AniAttach> attachments =new ArrayList<>();
		if (attach !=null) {
			attachments.add(attach);
		}
		ani.setAttachments(attachments);
		
		service.aniRegister(ani);

		  
		return "redirect:/admin/admin.action";
		
	}	
	
	@RequestMapping(value="anilist.action", method = RequestMethod.GET)
	public String aniList(Model model) {
		ArrayList<Ani> aniList = service.getAniList();
		model.addAttribute("aniList", aniList);
		return "admin/aniM/anilist";
	}
	
	
/*	@RequestMapping(value = "aniDetail.action", method = RequestMethod.GET)	
	public String aniDetail(
			@RequestParam(value="aniNo")int aniNo, Model model) {
		Ani ani = service.getAniByAniNo(aniNo);		
		model.addAttribute("ani", ani); 

		return "admin/aniM/aniDetail";	
	}*/

	@RequestMapping(value="aniupdate.action", method = RequestMethod.GET)
	public String updateAniform (@RequestParam(value="aniNo", required=false)Integer aniNo, Model model) {
		Ani ani = service.getAniByAniNo(aniNo);
		model.addAttribute("ani", ani);
		return "admin/aniM/aniupdate";
	}
	
	
	@RequestMapping(value = "aniupdate.action", method = RequestMethod.POST)
	public String updateAni(Ani ani) {
		service.updateAni(ani);	
		//return String.format("redirect:freeboarddetail.action?fbNum=%d", board.getFreeNum());		
		//return "redirect:cpmain.action?productNo=" + productNo;
		return "redirect:anilist.action";
		
	}
	
	@RequestMapping(value = "anidelete.action", method = RequestMethod.GET)
	public String deleteAni(int aniNo) {
		service.deleteAni(aniNo);
		
		//return "redirect:cpmain.action?productNo=" + productNo;
		return "redirect:anilist.action";
	}

}
