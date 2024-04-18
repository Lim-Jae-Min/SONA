package com.sona.music.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sona.music.main.service.MainService;

@Controller
public class MainController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MainService mainService;
	
	@RequestMapping(value="/")
	public String main(Model model) {
		logger.info("메인화면 접속");
		
		String user_id = mainService.id();
		model.addAttribute("loginName", "홍인표");
		model.addAttribute("alarmCount", 2);
		model.addAttribute("msg", user_id);

		return "main/main";
	}
	
	@RequestMapping(value="/recommendList.go")
	public String recommendList(Model model) {
		model.addAttribute("loginName", "홍인표");
		model.addAttribute("alarmCount", 2);
		model.addAttribute("msg", "추천 강의 게시판");
		return "lesson/recommendLessonList";
	}
	
	@RequestMapping(value="/allList.go")
	public String allList(Model model) {
		model.addAttribute("loginName", "홍인표");
		model.addAttribute("alarmCount", 2);
		model.addAttribute("msg", "전체 강의 게시판");
		return "lesson/allLessonList";
	}
	
	@RequestMapping(value="/serviceCenter.go")
	public String serviceCenter(Model model) {
		model.addAttribute("loginName", "홍인표");
		model.addAttribute("alarmCount", 2);
		model.addAttribute("msg", "고객 센터 이동");
		return "notice/noticeList";
	}
	
	@RequestMapping(value="/myPage.go")
	public String myPage(Model model) {
		model.addAttribute("loginName", "홍인표");
		model.addAttribute("alarmCount", 2);
		model.addAttribute("msg", "마이페이지 이동");
		return "studentMyPage/studentPage";
	}
	
}
