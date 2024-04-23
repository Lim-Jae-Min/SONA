package com.sona.music.lesson.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sona.music.lesson.service.LogService;

@Controller
public class LogController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired LogService logService;
	
	@RequestMapping(value="/lessonLog.go")
	public String lessonLogGo () {
		
		return "lesson/lessonLog";
	}
	
	@RequestMapping(value="/lessonLogWrite.do", method = RequestMethod.POST)
	public String lessonLogWrite() {
		String page = "member/login";
		page = "lesson/lessonLog";
		logger.info("강의일지 작성 controller");
		
		return page;
	}
	
	@RequestMapping(value="/lessonLogEdit.do", method = RequestMethod.POST)
	public String lessonLogEdit() {
		String page = "member/login";
		page = "lesson/lessonLog";
		logger.info("강의일지 수정 controller");
		
		return page;
	}
	
	@RequestMapping(value="/lessonAbsent.do")
	public String lessonAbsent() {
		String page = "member/login";
		page = "lesson/lessonLog";
		logger.info("강의 결석 처리 controller");
		
		return page;
	}
	
}
