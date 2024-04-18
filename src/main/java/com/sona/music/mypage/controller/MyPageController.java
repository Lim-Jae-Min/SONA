package com.sona.music.mypage.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sona.music.mypage.service.MyPageService;

@Controller
public class MyPageController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MyPageService myPageService;
	
	@RequestMapping(value = "/studentPage.do")
	public String studentPage(Model model, HttpSession session) {
		String page = "member/login";
		String id = (String) session.getAttribute("logininfo");
		if (id != null) {
			myPageService.studentPage();
		}
		
		return "studentPage";
	}
}
