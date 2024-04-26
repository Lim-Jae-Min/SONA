package com.sona.music.board.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sona.music.board.service.FAQService;

@Controller
public class FAQController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired FAQService faqService;
	
	
	@RequestMapping(value = "faqManagementlist.ajax")
	@ResponseBody
	public Map<String, Object> faqManagementlist(int page , int searchType, String serachText, int categoryNum) {
		logger.info("noticeManagementlist 요청");
		logger.info("요청페이지 : " + page);
		logger.info("faq 검색에서 가져온 text : "+serachText);
		logger.info("faq 검색에서 가져온 type : "+searchType);
		logger.info("faq 검색에서 가져온 category num : " + categoryNum);
		Map<String, Object> map = null;
		int currPage = page;
			
		map = faqService.showListSearch(currPage,searchType,serachText,categoryNum);	
		
		
		return map;
	}
	
	
}
