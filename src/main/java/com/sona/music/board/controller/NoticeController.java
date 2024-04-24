package com.sona.music.board.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sona.music.board.service.NoticeService;

@Controller
public class NoticeController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired NoticeService noticeService;
	
	
	@RequestMapping(value = "noticeManagementlist.ajax")
	@ResponseBody
	public Map<String, Object> noticeManagementlist(String page , String searchType, String serachText) {
		logger.info("noticeManagementlist 요청");
		logger.info("요청페이지 : " + page);
		logger.info("공지사항 검색에서 가져온 text : "+serachText);
		logger.info("공지사항 검색에서 가져온 type : "+searchType);
		Map<String, Object> map = null;
		int currPage = Integer.parseInt(page);
		if(searchType != null) {
			
			map = noticeService.showListSearch(currPage,searchType,serachText);
			map.put("searchType", searchType);
			map.put("serachText", serachText);
		}else {
			
			map = noticeService.showList(currPage);
		}
		
		
		return map;
	}
	
}
