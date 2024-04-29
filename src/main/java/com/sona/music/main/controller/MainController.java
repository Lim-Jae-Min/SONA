package com.sona.music.main.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sona.music.main.dto.MainDTO;
import com.sona.music.main.service.MainService;

@Controller
public class MainController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MainService mainService;
	
	@RequestMapping(value="/")
	public String main(Model model, HttpSession session) {
		logger.info("메인화면 접속");
		
			String userId = (String) session.getAttribute("loginId");
			 logger.info("userId : "+ userId);
			
			 if (session.getAttribute("loginId") != null && session.getAttribute("user_type").equals("수강생") ) {
				 
			 List<MainDTO> list = mainService.list(userId);
			 model.addAttribute("list",list);
			 logger.info("list :" + list);
			 
			 } else {
				 List<MainDTO> nolist = mainService.nolist();
				 model.addAttribute("list",nolist);
				 logger.info("list :"+ nolist);
			 }
		
		
		return "main/main";
	}
	@RequestMapping(value="/login.go")
	public String login(Model model) {
		logger.info("로그인 페이지 접속");
		
		return "member/login";
	}
	
	
	@RequestMapping(value="/recommendList.go")
	public String recommendList(Model model, HttpSession session) {
		model.addAttribute("msg", "추천 강의 게시판");
		String page = "member/login";
		String loginId = (String) session.getAttribute("loginId");
		String inst = mainService.myInst(loginId);
		
		if (session.getAttribute("loginId") != null) {
			if (inst == null) {
				page = "redirect:/myPage.go";
			}else {
				model.addAttribute("inst", inst);
				page = "lesson/recommendLessonList";
			}
			
		}
		
		return page;
	}
	
	@RequestMapping(value="/allList.go")
	public String allList(Model model) {
		model.addAttribute("msg", "전체 강의 게시판");
		return "lesson/allLessonList";
	}
	
	@RequestMapping(value="/serviceCenter.go")
	public String serviceCenter(Model model) {
		model.addAttribute("msg", "고객 센터 이동");
		return "notice/noticeList";
	}
	
	@RequestMapping(value="/myPage.go")
	public String myPage(Model model, HttpSession session) {
		model.addAttribute("msg", "마이페이지 이동");
		String page = "member/login";
		
		if (session.getAttribute("loginId") != null) {
			if (session.getAttribute("user_type").equals("수강생")) {
				page = "redirect:/studentPage.go";
			}else {
				page = "redirect:/teacherPage.go";
			}
		}
		
		return page;
	}
	
	@RequestMapping(value="/alarmList.go")
	public String alarmList(Model model, HttpSession session) {
		model.addAttribute("msg", "알림 리스트 이동");
		String page = "member/login";
		
		if (session.getAttribute("loginId") != null) {
			page = "alarm/alarmList";
		}
		
		return page;
	}
	
	@RequestMapping(value="/loading.do")
	public String loading(Model model, HttpSession session) {
		
		String page = "member/login";
		
		if (session.getAttribute("loginId") != null) {
			page = "main/loading";
		}
		
		
		return page;
	}
	
	@RequestMapping(value="/videoList.go")
	public String videoList(Model model, HttpSession session) {
		model.addAttribute("msg", "추천 영상 리스트 이동");
		
		String page = "main/login";
		
		if (session.getAttribute("loginId") != null) {
			page = "main/videoList";
		
		}
		return page;
	}
	
	
	@RequestMapping(value="/videoList.ajax")
	@ResponseBody
	public Map<String, Object> listCall(HttpSession session,  String page, String cnt,@RequestParam(value="userId") String userId){
		logger.info("listCall 요청");
		logger.info("페이지당 보여줄 갯수:"+cnt);
		logger.info("요청 페이지: "+page);
		logger.info("userId{}",userId);
		Map<String, Object> map = null;
		
		int currPage = Integer.parseInt(page);
		int pagePerCnt = 8;
		if (session.getAttribute("user_type").equals("수강생")) {
			map = mainService.videoList(currPage,pagePerCnt,userId);
		}else {
			map = mainService.videoAllList(currPage,pagePerCnt);
		}
		
		
		return map;
	}
	
	
	
}
