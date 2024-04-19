package com.sona.music.mypage.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sona.music.mypage.dto.MyPageDTO;
import com.sona.music.mypage.service.MyPageService;

@Controller
public class MyPageController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MyPageService myPageService;
	
	@RequestMapping(value = "/studentPage.do")
	public String getUserInfo(Model model, HttpSession session) {
		String page = "member/login";
		String loginId = (String) session.getAttribute("loginId");
		if (loginId != null) {
			MyPageDTO userInfo = myPageService.getUserInfo(loginId);
			model.addAttribute("userInfo",userInfo);
			page = "studentMyPage/studentPage";
		}
		
		return page;
	}
	
	@RequestMapping(value = "/studentPage.edit")
	public String editUserInfo(HttpSession session, Model model) {
		String page = "member/login";
		if(session.getAttribute("loginId")!=null) {
			
			
			page = "studentMyPage/editStudentPage";
		}
		
		return page;
	}
	
		@RequestMapping("/submitSelectedDays")
	    @ResponseBody
	    public String submitSelectedDays(@RequestParam String selectedDays) {
	        // 선택한 요일 정보를 처리하는 로직 구현
	        System.out.println("선택한 요일: " + selectedDays);
	        return "Success";
	    }
	}

