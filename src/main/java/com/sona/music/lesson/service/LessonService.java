package com.sona.music.lesson.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sona.music.lesson.dao.LessonDAO;
import com.sona.music.lesson.dto.LessonDTO;

@Service
public class LessonService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired LessonDAO lessonDAO;

	public Map<String, Object> recommendListCall(int currPage, int pagePerCnt, String condition, String content) {
		
		int start = (currPage-1) * pagePerCnt;
		
		Map<String, Object> result = new HashMap<String, Object>();
		List<LessonDTO> list = lessonDAO.recommendListCall(pagePerCnt, start, condition, content);
		logger.info("list : {}", list);
		logger.info("list size : "+list.size());
		result.put("list", list);		
		result.put("currPage", currPage);
		result.put("totalPages", lessonDAO.recommendListCount(pagePerCnt, condition, content));
		
		return result;
	}

	public Map<String, Object> allListCall(int currPage, int pagePerCnt, String condition, String content,
			String loca, String category, String inst) {
		
		int start = (currPage-1) * pagePerCnt;
		
		Map<String, Object> result = new HashMap<String, Object>();
		List<LessonDTO> list = lessonDAO.allListCall(pagePerCnt, start, condition, content, loca, category, inst);
		logger.info("list : {}", list);
		logger.info("list size : "+list.size());
		result.put("list", list);		
		result.put("currPage", currPage);
		result.put("totalPages", lessonDAO.allListCount(pagePerCnt, condition, content, loca, category, inst));
		
		return null;
	}
	
}
