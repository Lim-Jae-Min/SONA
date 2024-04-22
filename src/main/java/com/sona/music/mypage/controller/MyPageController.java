package com.sona.music.mypage.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@RequestMapping(value = "/editStudentPage.go")
	public String editUserInfo(HttpSession session, Model model) {
		String page = "member/login";
		if(session.getAttribute("loginId")!=null) {
			
			
			page = "studentMyPage/editStudentPage";
		}
		
		return page;
	}
	
	@RequestMapping("/studentPage.edit")
    public String updateUserInfo(@RequestParam Map<String, Object> map, HttpSession session, Model model) {
        String page = "member/login";
        String loginId = (String) session.getAttribute("loginId"); // 세션에서 loginId 가져오기

		if(session.getAttribute("loginId")!= null) {
		MyPageDTO userInfo = myPageService.getUserInfo(loginId);

		model.addAttribute("userInfo",userInfo);

		myPageService.updateUserInfo(map);
		page = "studentMyPage/editStudentPage";
		
		
		}
        return page;
    }
	
	 @RequestMapping(value = "/overlay.do", method = RequestMethod.POST)
	    @ResponseBody
	    public boolean overlay(
	        @RequestParam("newPassword") String newPassword,
	        @RequestParam("confirmPassword") String confirmPassword
	    ) {
	        return myPageService.overlay(newPassword, confirmPassword);
	 }
	
	
	
	
	
	 @RequestMapping(value = "/submitEdit", method = RequestMethod.POST)
	 public String editUserInfo(@RequestBody MyPageDTO requestData) {
	     // 서비스로 전달하여 처리
	     return myPageService.editUserInfo(requestData);
	 }
}

