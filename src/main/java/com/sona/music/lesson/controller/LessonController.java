package com.sona.music.lesson.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sona.music.lesson.service.LessonService;

@Controller
public class LessonController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired LessonService lessonService;
	
//	@RequestMapping(value="/list.ajax")
//	@ResponseBody // response 객체로 반환
//	public Map<String, Object> recommendListCall(String page) {
//		logger.info("listCall 요청");
//		logger.info("요청 페이지 : "+page);		
//		int currPage = Integer.parseInt(page);
//		int pagePerCnt = 10;
//		Map<String, Object> map = lessonService.recommendListCall(currPage, pagePerCnt);
//		
//		return map;
//	}
	
}
