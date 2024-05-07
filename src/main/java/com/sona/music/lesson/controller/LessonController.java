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
	public Map<String, Object> recommendListCall(String page, String condition, String content, String inst) {
		logger.info("listCall 요청");
		logger.info("요청 페이지 : "+ page);
		logger.info("content : " + content);
		logger.info("condition : " + condition);
		int currPage = Integer.parseInt(page);
		int pagePerCnt = 10;
		Map<String, Object> map = lessonService.recommendListCall(currPage, pagePerCnt, condition, content, inst);
		
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
	public String lessonOpenGo(HttpSession session) {
		logger.info("강의 개설 페이지 이동");
		String page = "member/login";
		
		if (session.getAttribute("loginId") != null) {
			page = "lesson/lessonOpen";
		}
		
		return page;
	}
	
	@RequestMapping(value="/lessonOpen.do", method = RequestMethod.POST)
	public String lessonOpenDo(@RequestParam("lessonLogo") MultipartFile lessonLogo,@RequestParam("class_photos") MultipartFile[] photos, @RequestParam Map<String, String> param, HttpSession session) {
		logger.info("강의 개설 controller 도착");
		logger.info("param : {}", param);
		logger.info("photos : " + photos);
		String user_id = (String) session.getAttribute("loginId");
		
		int row = lessonService.lessonOpenDo(lessonLogo, photos, param, user_id);
		logger.info("입력된 row 수 : " + row);
		
		return "lesson/allLessonList";
	}
	
	@RequestMapping(value="/lessonDetail.go")
	public String lessonDetail(String class_idx, HttpSession session, Model model) {
		String loginId = (String) session.getAttribute("loginId");
		int idx = Integer.parseInt(class_idx);
		logger.info("lessonDetail idx = " + class_idx);
		
		String page = "lesson/lessonDetail";
		
		lessonService.lessonDetail(idx, model, loginId);
		
		return page;
	}
	
	@RequestMapping(value="/lessonApply.do")
	public String lessonApplyDo(int class_idx, HttpSession session) {
		String page = "redirect:/lessonPayment.go?class_idx=" + class_idx;
		String loginId = (String) session.getAttribute("loginId");
		logger.info("class_idx = " + class_idx);
		
		lessonService.lessonApplyDo(class_idx, loginId);
		
		return page;
	}
	
	@RequestMapping(value="/lessonBlind.do")
	public String lessonBlind(int class_idx) {
		String page = "redirect:/lessonDetail.go?class_idx=" + class_idx;
		
		lessonService.lessonBlind(class_idx);
		
		return page;
	}
	
	@RequestMapping(value="/lessonUnBlind.do")
	public String lessonUnBlind(int class_idx) {
		String page = "redirect:/lessonDetail.go?class_idx=" + class_idx;
		
		lessonService.lessonUnBlind(class_idx);
		
		return page;
	}
	
	@RequestMapping(value="/lessonDisable.do")
	public String lessonDisable(int class_idx) {
		String page = "redirect:/lessonDetail.go?class_idx=" + class_idx;
		
		lessonService.lessonDisable(class_idx);
		
		return page;
	}
	
	@RequestMapping(value="/lessonUnDisable.do")
	public String lessonUnDisable(int class_idx) {
		String page = "redirect:/lessonDetail.go?class_idx=" + class_idx;
		
		lessonService.lessonUnDisable(class_idx);
		
		return page;
	}
	
	@RequestMapping(value="/lessonEdit.go")
	public String lessonEditGo(String class_idx, Model model, HttpSession session) {
		String page = "member/login";
		logger.info("수정할 idx : " + class_idx);
		String loginId = (String) session.getAttribute("loginId");
		int idx = Integer.parseInt(class_idx);
		
		if (session.getAttribute("loginId") != null) {
			page = "lesson/lessonEdit";
			lessonService.lessonEditGo(idx, model, loginId);
		}
		
		return page;
	}
	
	@RequestMapping(value="/lessonEdit.do", method = RequestMethod.POST)
	public String lessonEditDo(@RequestParam("lessonLogo") MultipartFile lessonLogo,@RequestParam("class_photos") MultipartFile[] photos,
			@RequestParam Map<String, String> param, String class_idx, HttpSession session) {
		logger.info("강의 개설 controller 도착");
		logger.info("param : {}", param);
		logger.info("photos : " + photos);
		String user_id = (String) session.getAttribute("loginId");
		
		int row = lessonService.lessonEditDo(lessonLogo, photos, param, user_id, class_idx);
		logger.info("수정된 row 수 : " + row);
		
		
		return "lesson/allLessonList";
	}
	
	
}
