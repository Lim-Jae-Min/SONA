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
		logger.info("회원 정보 페이지 이동");
		String page = "member/login";
		String loginId = (String) session.getAttribute("loginId");
		if (loginId != null) {
			MyPageDTO userInfo = myPageService.getUserInfo(loginId);
			model.addAttribute("userInfo",userInfo);
			logger.info("회원 정보 페이지 이동 성공 !");

			page = "studentMyPage/studentPage";
		}
		
		return page;
	}
	@RequestMapping(value = "/editStudentPage.go")
	public String editUserInfo(HttpSession session, Model model) {
	 logger.info("회원 수정 페이지 이동");
	    String page = "member/login";
	    String loginId = (String) session.getAttribute("loginId");
	    if(loginId != null) {
	        // 세션에서 로그인 아이디를 가져와 사용자 정보를 조회
	        MyPageDTO userInfo = myPageService.getUserInfo(loginId);
	        // 모델에 사용자 정보 추가
	        model.addAttribute("userInfo", userInfo);
	        logger.info("회원 수정 페이지 이동 성공 !");
	        page = "studentMyPage/editStudentPage";
	    }
	    return page;
	}

	
	@RequestMapping(value = "/studentPage.edit", method = RequestMethod.POST)
	public String updateUserInfo(@RequestParam Map<String, Object> map, HttpSession session, Model model) {
	    String page = "member/login";
	    logger.info("회원 수정하기 요청이요~ ");
	    String loginId = (String) session.getAttribute("loginId");
	    logger.info("전달된 데이터: {}", map);

	    if (loginId != null) {
	        logger.info("회원 수정하기~ ", map);
	        myPageService.updateUserInfo(map, loginId); // 로그인 ID를 전달
	        page = "studentMyPage/editStudentPage";
	    }
	    return page;
	}
	
	 @RequestMapping(value = "/confirmPw.ajax", method = RequestMethod.POST)
	 @ResponseBody
	    public boolean confirmPw(@RequestParam("newPassword") String newPassword, @RequestParam("confirmPassword") String confirmPassword) {
		 
 			logger.info("비밀번호 수정 요청~ ");

	        return myPageService.confirmPw(newPassword, confirmPassword);
	 }

	
	
	
	
	
	 @RequestMapping(value = "/submitEdit.ajax", method = RequestMethod.POST)
	 public String editUserInfo(@RequestBody MyPageDTO requestData) {
	     // 서비스로 전달하여 처리
 		logger.info("수강신청폼 수정 요청~ ");

	     return myPageService.editUserInfo(requestData);
	 }
	 
	 @RequestMapping(value = "/myTeacher.go")
		public String myTeacher(HttpSession session, Model model) {
		 logger.info("회원 수정 페이지 이동");
		    String page = "member/login";
		    String loginId = (String) session.getAttribute("loginId");
		    if(loginId != null) {
		        // 모델에 사용자 정보 추가
		        logger.info("즐겨찾기 강사 페이지 이동 성공 !");
		        page = "studentMyPage/myTeacher";
		    }
		    return page;
		}
	 
	
	 
	 
	 
}

