package com.sona.music.lesson.service;

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

	public Map<String, Object> recommendListCall(int currPage, int pagePerCnt) {
		
		int start = (currPage-1) * pagePerCnt;
		
		Map<String, Object> result = new HashMap<String, Object>();
		List<LessonDTO> list = lessonDAO.recommendListCall(pagePerCnt, start);
//		logger.info("list size : "+list.size());
//		result.put("list", list);		
//		result.put("currPage", currPage);
//		result.put("totalPages", boardDAO.allCount(pagePerCnt));
		
		return result;
	}
	
}
