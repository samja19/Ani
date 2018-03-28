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

import com.ani.dto.Donation;
import com.ani.dto.InterestAni;
import com.ani.dto.Member;
import com.ani.dto.MyPage;
import com.ani.service.MyPageService;

@Controller
@RequestMapping(value="/mypage/")
public class MyPageController {

	@Autowired
	@Qualifier("mypageService")
	private MyPageService service;
	
	@RequestMapping(value= "mypagelist.action", method = RequestMethod.GET)
	public String mypagelist(@RequestParam(value="pageNo", required=false)Integer pageNo, Model model) {
		String linkUrl = "mypagelist.action";
		
		int maxPost = 10;
		int sizeOfPage = 5;	
		
		if (pageNo == null) pageNo = 1;
		
		int first = (pageNo - 1) * maxPost + 1;
		int last = first + maxPost;
		
		ArrayList<MyPage> mypagelist = service.getMypageList(first, last);
		int countMypage = service.getPageCount();
		Member member = service.getMyProfile();
		
		
		model.addAttribute("mypagelist", mypagelist);	
		//model.addAttribute("paging", paging);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("member", member);

		
		return "mypage/mypagelist";
		
	}
	
	@RequestMapping(value = "mypagewrite.action", method = RequestMethod.GET)
	public String mypagewriteform() {
		return "mypage/mypagewrite";
	}
	
	@RequestMapping(value = "mypagewrite.action", method = RequestMethod.POST)
	public String mypagewrite(HttpSession session, MyPage mypage) {
		//Member m = (Member) session.getAttribute("loginuser");
		//mypage.setId(m.getId());
		service.mypagewrite(mypage);	
		return "redirect:mypagelist.action";
	}
	
	@RequestMapping(value="mypagedetail.action", method = RequestMethod.GET)
	public String mypagedetail (@RequestParam(value="mypageNo", required=false)Integer mypageNo, Model model) {
		
		if (mypageNo == null) {
			return "redirect:mypagelist.action";
		}
		
		MyPage mypage = service.getMypageByMypageNo(mypageNo);
		
		model.addAttribute("mypage", mypage);
		
		return "mypage/mypagedetail";
	}
	
	@RequestMapping(value="mypageupdate.action", method = RequestMethod.GET)
	public String mypageupdateform (@RequestParam(value="mypageNo", required=false)Integer mypageNo, Model model) {
		
		if (mypageNo == null) {
			return "redirect:mypagelist.action";
		}
		
		MyPage mypage = service.getMypageByMypageNo(mypageNo);
		model.addAttribute("mypage", mypage);
		
		return "mypage/mypageupdate";
	}
	
	@RequestMapping(value="mypageupdate.action", method = RequestMethod.POST)
	public String mypageupdateform (MyPage mypage) {	
		service.mypageupdate(mypage);
		return String.format("redirect:mypagedetail.action?mypage=%d", mypage.getMypageNo());
	}
	
	@RequestMapping(value="deletemypage.action", method = RequestMethod.GET)
	public String deletemypage (HttpSession session, @RequestParam(value="mypageNo", required=false)Integer mypageNo) {
		//Member m = (Member)session.getAttribute("loginuser");
		
		service.mypagedelete(mypageNo);
		
		return "redirect:mypagelist.action";
	}
	
	@RequestMapping(value="myinterestlist.action", method = RequestMethod.GET)
	public String myinterestlist(HttpSession session, Member member, Model model) {
		//Member m = (Member) session.getAttribute("loginuser");
		
		//member.setId(m.getId());
		
		ArrayList<InterestAni> ani = service.getInterestAniList(member);
		
		model.addAttribute("ani",ani);
		
		return "mypage/myinterestlist";
	}
	
	@RequestMapping(value="mydonationlist.action", method = RequestMethod.GET)
	public String mydonationlist(HttpSession session, Member member, Model model) {
		
		//Member m = (Member) session.getAttribute("loginuser");
		
		//member.setId(m.getId());
		
		ArrayList<Donation> ani = service.getDonateAniList();
		
		model.addAttribute("ani",ani);
		
		return "mypage/myinterestlist";
	}
	
}
