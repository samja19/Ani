package com.ani.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.bind.annotation.ResponseBody;
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
		List<MultipartFile> files =req.getFiles("aniAttach");
		ArrayList<AniAttach> attachments =new ArrayList<>();
		if (!files.isEmpty()) {
			for (MultipartFile file : files) {
				if (file.getOriginalFilename().length() != 0) {
					String path = req.getServletContext().getRealPath("/resources/animg/");	
	                // 저장되는 파일명
					String aniSaveName =file.getOriginalFilename();
					aniSaveName = Util.makeUniqueFileName(aniSaveName);
					// 파일 사이즈
					long aniFileSize = file.getSize(); 
					try {
						file.transferTo(new File(path, aniSaveName));
						attach= new AniAttach();
						attach.setAniSaveName(aniSaveName);
						attach.setAniUserName(file.getOriginalFilename());
						attach.setAniFileSize(aniFileSize);
					}catch(Exception ex) {
						ex.printStackTrace();
					}
					attachments.add(attach);
				}	
			}
		}
		ani.setAttachments(attachments);
		service.aniRegister(ani);
		
		return "redirect:/aniM/anilist.action";
	}	
	
	@RequestMapping(value="allanilist.action", method = RequestMethod.GET)
	public String allaniList(Model model) {
		ArrayList<Ani> aniList = service.getAniList();
		model.addAttribute("aniList", aniList);
		return "admin/aniM/allanilist";
	}
	
	@RequestMapping(value="anilist.action", method = RequestMethod.GET)
	public String aniList(Model model) {
		int count = 0;
		count = service.getAniCount();
		model.addAttribute("aniCount",count);
		return "admin/aniM/anilist";
	}
	
	@RequestMapping(value="anilist.action", method=RequestMethod.POST )
	@ResponseBody
	public ArrayList<Ani> aniList(
			@RequestParam(value="pagecount",defaultValue="5")int pagecount,
			@RequestParam(value="pageno",defaultValue="1")int page) {
//		System.out.println(pageno+"/"+pagecount);
		
//		int start = (pageno-1)*pagecount+1;
//		int end = pageno*pagecount;
//		System.out.println(start+"/"+end);
		int start=0;
		int end=0; 
		start = pagecount*(page-1)+1;
		end = pagecount*page;	
		 
		ArrayList<Ani> aniList = service.getAniListByParams(start, end);;
		
		return aniList;
	}
	
    @RequestMapping(value = "aniDetail.action", method = RequestMethod.POST)	
    @ResponseBody
	public Ani aniDetail(
			@RequestParam(value="aniNo")int aniNo, Model model) {
		Ani ani = service.getAniByAniNo(aniNo);		
		return ani;	
	}

	@RequestMapping(value="aniupdate.action", method = RequestMethod.GET)
	public String updateAniform (@RequestParam(value="aniNo", required=false)Integer aniNo, Model model) {
		Ani ani = service.getAniByAniNo(aniNo);
		model.addAttribute("ani", ani);
		return "admin/aniM/aniupdate";
	}
	
	
	@RequestMapping(value = "aniupdate.action", method = RequestMethod.POST)
	public String updateAni(MultipartHttpServletRequest req, Ani ani) {
		AniAttach attach = null;
		List<MultipartFile> files =req.getFiles("aniAttach");
		ArrayList<AniAttach> attachments =new ArrayList<>();
		if (!files.isEmpty()) {
			for (MultipartFile file : files) {
				if (file.getOriginalFilename().length() != 0) {
					String path = req.getServletContext().getRealPath("/resources/animg/");	
	                // 저장되는 파일명
					String aniSaveName =file.getOriginalFilename();
					aniSaveName = Util.makeUniqueFileName(aniSaveName);
					// 파일 사이즈
					long aniFileSize = file.getSize(); 
					try {
						file.transferTo(new File(path, aniSaveName));
						attach= new AniAttach();
						attach.setAniSaveName(aniSaveName);
						attach.setAniUserName(file.getOriginalFilename());
						attach.setAniFileSize(aniFileSize);
					}catch(Exception ex) {
						ex.printStackTrace();
					}
					attachments.add(attach);
				}	
			}
		}
		ani.setAttachments(attachments);
		service.updateAni(ani);	
		
		//return String.format("redirect:freeboarddetail.action?fbNum=%d", board.getFreeNum());		
		//return "redirect:cpmain.action?productNo=" + productNo;
		return "redirect:anilist.action";
		
	}
	
	@RequestMapping(value = "anidelete.action", method = RequestMethod.POST)
	@ResponseBody
	public String deleteAni(
			@RequestParam(value="aniNo")int aniNo) {
		service.deleteAni(aniNo);
		
		//return "redirect:cpmain.action?productNo=" + productNo;
		//return "redirect:anilist.action";
		return String.valueOf(aniNo);
	}
	
	@RequestMapping(value = "anidelete.action", method = RequestMethod.GET)
	public String deleteAni(Ani ani, @RequestParam(value="aniNo")int aniNo) {
		service.deleteAni(aniNo);
		
		//return "redirect:cpmain.action?productNo=" + productNo;
		return "redirect:allanilist.action";
	}
	
    @RequestMapping(value = "anifiledel.action", method = RequestMethod.POST)	
    @ResponseBody
	public void aniFileDel(
			@RequestParam(value="aniAttachNo")int aniAttachNo) {
		service.deleteAniAttach(aniAttachNo);
	}
    
    @RequestMapping(value = "updateadopted.action", method = RequestMethod.POST)	
    @ResponseBody
	public void updateAdopted(
			@RequestParam(value="aniNo")int aniNo,
			@RequestParam(value="adopted")int adopted) {
//    	ani.setAdopted(adopted);
//    	ani.setAniNo(aniNo);
    	service.updateAdopted(aniNo, adopted);
	}
/*    @RequestMapping(value = "updateadopted.action", method = RequestMethod.GET)	
	public void updateAdopted(
			@RequestParam(value="aniNo")int aniNo,
			@RequestParam(value="adopted")int adopted) {
		service.updateAdopted(aniNo, adopted);
	}*/
}
