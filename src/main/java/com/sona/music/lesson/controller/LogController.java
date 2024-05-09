package com.sona.music.lesson.controller;

import java.util.List;
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

import com.sona.music.lesson.dto.LogDTO;
import com.sona.music.lesson.service.LogService;

@Controller
public class LogController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired LogService logService;
	
	@RequestMapping(value="/lessonLog.go")
	public String lessonLogGo (int apply_idx, HttpSession session, Model model) {
		String page = "member/login";
		
		String loginId = (String) session.getAttribute("loginId");
		
		if (session.getAttribute("loginId") != null) {
			page = "lesson/lessonLog";
			logService.lessonLogGo(apply_idx, loginId, model);
		}
		
		return page;
	}
	
	@RequestMapping(value="/lessonLogWrite.do", method = RequestMethod.POST)
	public String lessonLogWrite(@RequestParam Map<String, String> map, HttpSession session) {
		String page = "member/login";
		logger.info("강의일지 작성 controller");
		int apply_idx = Integer.parseInt(map.get("apply_idx"));
		
		if (session.getAttribute("loginId") != null) {
			page = "redirect:/lessonLog.go?apply_idx=" + apply_idx;
			int row = logService.lessonLogWrite(map, session);
			logger.info("입력된 row 수 = " + row);
		}
		
		return page;
	}
	
	@RequestMapping(value="/lessonLogEdit.do", method = RequestMethod.POST)
	public String lessonLogEdit(@RequestParam Map<String, String> map, HttpSession session) {
		String page = "member/login";
		logger.info("강의일지 수정 controller");
		
		int apply_idx = Integer.parseInt(map.get("apply_idx"));
		
		if (session.getAttribute("loginId") != null) {
			page = "redirect:/lessonLog.go?apply_idx=" + apply_idx;
			int row = logService.lessonLogEdit(map);
			logger.info("수정된 row 수 = " + row);
		}
		
		return page;
	}
	
	@RequestMapping(value="/lessonAbsent.do", method = RequestMethod.POST)
	public String lessonAbsent(@RequestParam Map<String, String> map, HttpSession session) {
		String page = "member/login";
		
		logger.info("강의일지 결석 처리 controller");
		int apply_idx = Integer.parseInt(map.get("apply_idx"));
		
		if (session.getAttribute("loginId") != null) {
			page = "redirect:/lessonLog.go?apply_idx=" + apply_idx;
			int row = logService.lessonAbsent(map, session);
			logger.info("입력된 row 수 = " + row);
		}
		
		return page;
	}
	
	@RequestMapping(value="/lessonStop.do")
	public String lessonStop(@RequestParam Map<String, String> map, HttpSession session) {
		String page = "member/login";
		logger.info("강의 중단 처리 controller");
		
		int apply_idx = Integer.parseInt(map.get("apply_idx"));
		
		if (session.getAttribute("loginId") != null) {
			page = "redirect:/lessonLog.go?apply_idx=" + apply_idx;
			int row = logService.lessonStop(apply_idx, session);
			logger.info("입력된 row 수 = " + row);
		}
		
		return page;
	}
	
}
