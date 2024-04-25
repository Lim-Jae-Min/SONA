package com.sona.music.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sona.music.member.dto.MemberDTO;
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

	
	/*강사 마이페이지로 이동*/
	@RequestMapping(value = "/teacherPage.go")
	public String getUserInfo2(Model model, HttpSession session) {
		logger.info("강사 마이페이지 이동 요청");
		String page = "member/login";
		String loginId = (String) session.getAttribute("loginId");
		int point = (int) session.getAttribute("point");
	    logger.info("point : "+ point);
		if (loginId != null) {
			MyPageDTO userInfo = myPageService.getUserInfo(loginId);
			model.addAttribute("userInfo",userInfo);
			logger.info("강사 회원 정보 페이지 이동 성공 !");
			page = "teacherMyPage/teacherPage";
		}
		
		return page;
	}
	
	 @RequestMapping(value = "/myQnA.go")
	 public String className(HttpSession session, Model model) {
		 	String page = "member/login";
		    String loginId = (String) session.getAttribute("loginId");
			logger.info("idx="+loginId+"QnA 리스트 요청");
			if (loginId != null) {
				 List<String> classNames = myPageService.getClassNames(loginId);
				 model.addAttribute("classNames", classNames);
				    logger.info("클래스 이름 목록: " + classNames); 
				model.addAttribute("loginId", loginId);
				page = "studentMyPage/myQnA";
			}

		    return page;
		    
		}
	
	
	
	
	
	
	@RequestMapping(value = "/studentPage.edit", method = RequestMethod.POST)
	public String updateUserInfo(@RequestParam Map<String, String> map, HttpSession session, Model model) {
	    String page = "member/login";
	    logger.info("회원 수정하기 요청이요~ ");
	    String loginId = (String) session.getAttribute("loginId");
	    logger.info("전달된 데이터: {}", map);

	    if (loginId != null) {
	        logger.info("회원 수정하기~ ", map);
	        map.put("user_id", loginId);
	        myPageService.updateUserInfo(new HashMap<> (map)); // 로그인 ID를 전달
	        page = "studentMyPage/editStudentPage";
	    }
	    return page;
	}
	
	 @RequestMapping(value = "/confirmPw.ajax", method = RequestMethod.POST)
	 @ResponseBody
	    public boolean confirmPw(@RequestParam("newPassword") String newPassword, @RequestParam("user_pass") String confirmPassword) {
		 
 			logger.info("비밀번호 수정 요청~ ");

	        return myPageService.confirmPw(newPassword, confirmPassword);
	 }

	 
	 @RequestMapping(value="/qnaList.ajax", method = RequestMethod.GET)
	 @ResponseBody
	 public Map<String , Object> qnaListCall(String page, String cnt, HttpSession session) {
	     logger.info("listCall 요청");
	     logger.info("페이지당 보여줄 갯수:" + cnt);
	     logger.info("요청 페이지: " + page);
		    String loginId = (String) session.getAttribute("loginId");

	     int currPage = Integer.parseInt(page);
	     int pagePerCnt = 10;
	     logger.info(loginId);
	     Map<String, Object> map = myPageService.qnaList(currPage, pagePerCnt, loginId);
	     
	     return map;
	 }
	 
	 
		@RequestMapping(value = "/myPoint.go")
		public String myPoint(HttpSession session, Model model) {
		 logger.info("회원 수정 페이지 이동");
		    String page = "member/login";
		    String loginId = (String) session.getAttribute("loginId");
		    if(loginId != null) {
		        // 세션에서 로그인 아이디를 가져와 사용자 정보를 조회
		    	 String point = myPageService.getPointAmount(loginId);
		        // 모델에 사용자 정보 추가
		        model.addAttribute("point", point);
		        logger.info("회원 수정 페이지 이동 성공 !");
		        page = "studentMyPage/myPoint";
		    }
		    return page;
		}
	 
	 @RequestMapping(value="/pointList.ajax", method = RequestMethod.GET)
	 @ResponseBody
	 public Map<String , Object> pointListCall(String page, String cnt, HttpSession session) {
	     logger.info("listCall 요청");
	     logger.info("페이지당 보여줄 갯수:" + cnt);
	     logger.info("요청 페이지: " + page);
		    String loginId = (String) session.getAttribute("loginId");

	     int currPage = Integer.parseInt(page);
	     int pagePerCnt = 10;
	     logger.info(loginId);
	     Map<String, Object> map = myPageService.pointList(currPage, pagePerCnt, loginId);
	     
	     return map;
	 }
	 
	@RequestMapping(value="/favoriteList.go")
	public String favoriteListGo(HttpSession session) {
		String page = "member/login";
		logger.info("즐겨찾기 강사 페이지 controller 접속");
		 
		if (session.getAttribute("loginId") != null) {
			page = "studentMyPage/studentFavoriteList";
		}
		 
		return page;
	}
	
	@RequestMapping(value="/favoriteList.ajax")
	@ResponseBody // response 객체로 반환
	public Map<String, Object> favoriteListCall(String page, HttpSession session) {
		logger.info("favoritelistCall 요청");
		logger.info("요청 페이지 : "+ page);
		String loginId = (String) session.getAttribute("loginId");
		
		int currPage = Integer.parseInt(page);
		int pagePerCnt = 8;
		Map<String, Object> map = myPageService.favoriteListCall(currPage, pagePerCnt, loginId);
		
		return map;
	}
	
	@RequestMapping(value="/blockList.go")
	public String blockListGo(HttpSession session) {
		String page = "member/login";
		logger.info("숨김 강사 페이지 controller 접속");
		 
		if (session.getAttribute("loginId") != null) {
			page = "studentMyPage/studentBlockList";
		}
		 
		return page;
	}
	
	@RequestMapping(value="/teacherListDel.ajax", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> teacherListDel(@RequestParam(value="delList[]") List<String> delList, HttpSession session){
		logger.info("del list : {}",delList);
		
		String loginId = (String) session.getAttribute("loginId");
		
		int cnt = myPageService.teacherListDel(delList, loginId);		
		logger.info("del count : "+cnt);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cnt", cnt);
		
		return map;
	}

}


