package com.ani.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
				//지정된 경로에 업로드된 파일 저장
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
		
		
	
		  
		return "redirect:/admin/aniM/anilist.action";
		
	}	
	
}
