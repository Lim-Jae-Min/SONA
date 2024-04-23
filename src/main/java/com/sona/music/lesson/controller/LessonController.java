package com.sona.music.lesson.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sona.music.lesson.service.LessonService;

@Controller
public class LessonController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired LessonService lessonService;
	
	@RequestMapping(value="/recommendList.ajax")
	@ResponseBody // response 객체로 반환
	public Map<String, Object> recommendListCall(String page, String condition, String content) {
		logger.info("listCall 요청");
		logger.info("요청 페이지 : "+ page);
		logger.info("content : " + content);
		logger.info("condition : " + condition);
		int currPage = Integer.parseInt(page);
		int pagePerCnt = 10;
		Map<String, Object> map = lessonService.recommendListCall(currPage, pagePerCnt, condition, content);
		
		return map;
	}
	
	@RequestMapping(value="/allList.ajax")
	@ResponseBody // response 객체로 반환
	public Map<String, Object> allListCall(String page, String condition, String content, String loca, String instCategory, String inst) {
		logger.info("listCall 요청");
		logger.info("요청 페이지 : "+ page);
		logger.info("content : " + content);
		logger.info("condition : " + condition);
		logger.info("loca : " + loca);
		logger.info("instCategory : " + instCategory);
		logger.info("inst : " + inst);
		int currPage = Integer.parseInt(page);
		int pagePerCnt = 10;
		Map<String, Object> map = lessonService.allListCall(currPage, pagePerCnt, condition, content, loca, instCategory, inst);
		
		return map;
	}
	
	@RequestMapping(value="/lessonOpen.go")
	public String lessonOpenGo() {
		logger.info("강의 개설 페이지 이동");
		return "lesson/lessonOpen";
	}
	
	@RequestMapping(value="/lessonOpen.do", method = RequestMethod.POST)
	public String lessonOpenDo(@RequestParam("lessonLogo") MultipartFile lessonLogo,@RequestParam("class_photos") MultipartFile[] photos, @RequestParam Map<String, String> param, HttpSession session) {
		logger.info("강의 개설 controller 도착");
		logger.info("param : {}", param);
		logger.info("photos : " + photos);
		String user_id = (String) session.getAttribute("loginId");
		String testurl = param.get("video_url");
		
		int row = lessonService.lessonOpenDo(lessonLogo, photos, param, user_id);
		
		
		return "lesson/allLessonList";
	}
	
	@RequestMapping(value="/lessonDetail.go")
	public String lessonDetail(String class_idx, HttpSession session, Model model) {
		String page = "redirect:/";
		String loginId = (String) session.getAttribute("loginId");
		logger.info("lessonDetail idx = " + class_idx);
		
		if (session.getAttribute("loginId") != null) {
			page = "lesson/lessonDetail";
			
			lessonService.lessonDetail(class_idx, model, loginId);
		}
		
		return page;
	}
	
}
