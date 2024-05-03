package com.sona.music.board.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sona.music.admin.service.AdminService;
import com.sona.music.board.service.FAQService;

@Controller
public class FAQController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired FAQService faqService;
	@Autowired AdminService adminService;
	
	
	@RequestMapping(value = "/faqList.go")
	public String faqListGo() {
		return "faq/faqList";
	}
	
	
	
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
	
	
	
	@RequestMapping(value = "faqList.ajax")
	@ResponseBody
	public Map<String, Object> faqList(int page, int categoryNum) {
		logger.info("noticeManagementlist 요청");
		logger.info("요청페이지 : " + page);

		logger.info("faq 검색에서 가져온 category num : " + categoryNum);
		Map<String, Object> map = null;
		int currPage = page;
			
		map = faqService.faqList(currPage,categoryNum);	
		
		
		return map;
	}
	
	@RequestMapping(value = "/faqDetail.go")
	public String faqDetailGo(int idx, Model model) {
		
		faqService.faqDetailAdmin(idx, model);
		return "faq/faqDetail";
	}
	
}
