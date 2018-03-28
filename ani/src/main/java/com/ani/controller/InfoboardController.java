package com.ani.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.ModelAndView;

import com.ani.common.Util;
import com.ani.dto.IBFileAttach;
import com.ani.dto.InfoBoard;
import com.ani.dto.Member;
import com.ani.service.InfoBoardService;
import com.ani.ui.IFBDownloadView;
 

@Controller
@RequestMapping(value="/infoboard/")
public class InfoboardController {
	
	@InitBinder
	public void InitBinder(WebDataBinder binder) {
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format, false));
	}
	
	@Autowired
	@Qualifier("infoBoardService")
	private InfoBoardService service;
	
	@RequestMapping(value = "/infoboardlist.action", method = RequestMethod.GET)
	public String infoboardlist(@RequestParam(value="pageno", required=false)Integer pageNo,
			Model model) {
		
		int pageSize =5;
		
		if (pageNo == null) pageNo = 1;
		
		int start = (pageNo - 1) * pageSize + 1;
		int last = start + pageSize;
		
		List<InfoBoard> ibs = service.getInfoboardBoardList(start, last);
		
		model.addAttribute("infoboardlist", ibs);
		return "infoboard/infoboardlist";
	}
	 
	@RequestMapping(value = "/infoboardwrite.action", method = RequestMethod.GET)
	public String infoboardwriteform() {
		return "infoboard/infoboardwrite";
	}
	
	public String infoboardwrite (InfoBoard board, HttpSession session) {
		Member user = (Member) session.getAttribute("loginuser");
		
		service.ibwrite(board);
		return "redirect:infoboardlist.action";
	}
	@RequestMapping(value = "/infoboardwirte.action", method = RequestMethod.POST)
	public String infoboardwrite2(MultipartHttpServletRequest req, InfoBoard board) {
		
		Member user = (Member) req.getSession().getAttribute("loginuser");
		
		
		IBFileAttach attach = null;
		MultipartFile file = req.getFile("attach");
		if (!file.isEmpty() &&
				file.getOriginalFilename().length() !=0) {
			String path = req.getServletContext().getRealPath("/WEB-INF/upload");
			String ibf_savename = file.getOriginalFilename();
			ibf_savename = Util.makeUniqueFileName(ibf_savename);
			try {
				file.transferTo(new File(path, ibf_savename));
				attach = new IBFileAttach();
				attach.setIbf_savename(ibf_savename);
				attach.setIbf_username(file.getOriginalFilename());
			}catch(Exception ex) {}
			
		}
		ArrayList<IBFileAttach> attachments = new ArrayList<>();
		if (attach !=null) {
			attachments.add(attach);
		}
		board.setAttachments(attachments);
		
		service.ibwrite2(board);
		
		
		return "redirect:infoboardlist.action";
	}
	
	@RequestMapping(value="infoboarddetail.action", method = RequestMethod.GET)
	
	public String infoboarddetail(@RequestParam(value = "ib_num",required=false) Integer ib_num, Model model) {
	
		if(ib_num ==  null) {
			return "redirect:infoboardlist.action";
		}
		InfoBoard board = service.findBoardByBoardNo(ib_num);
		
		model.addAttribute("infoboard", board);
		
		return "infoboard/infoboarddetail";
	}
	
	@RequestMapping(value="/download.action", method = RequestMethod.GET)
	public ModelAndView download(@RequestParam(value="attachno",required=false) Integer ibf_num, Model model) {
		
	System.out.println(ibf_num);
	IBFileAttach attachno = service.findIBFileAttachByAttachNo(ibf_num);
	model.addAttribute("IBFileAttach", attachno);
	
	ModelAndView mav = new ModelAndView();
	mav.addObject("savedFileName", attachno.getIbf_savename());
	mav.addObject("userFileName", attachno.getIbf_username());
	mav.setView(new IFBDownloadView());
	return mav;
	}
}
	
	
