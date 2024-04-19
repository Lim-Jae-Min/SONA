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
		
		logger.info("condition : " + condition);
		logger.info("content : " + content);
		
		Map<String, Object> result = new HashMap<String, Object>();
		List<LessonDTO> list = new ArrayList<LessonDTO>();
		if (content.equals("")) {
			list = lessonDAO.recommendListCall(pagePerCnt, start);
		}else {
			list = lessonDAO.recommendListCallSearch(condition, content, pagePerCnt, start);
		}
		logger.info("list : {}", list);
		logger.info("list size : "+list.size());
		result.put("list", list);		
		result.put("currPage", currPage);
		result.put("totalPages", lessonDAO.allCount(pagePerCnt));
		
		return result;
	}
	
}
