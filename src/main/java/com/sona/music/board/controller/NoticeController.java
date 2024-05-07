package com.sona.music.board.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sona.music.board.service.NoticeService;

@Controller
public class NoticeController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired NoticeService noticeService;
	
	
	@RequestMapping(value = "/noticeList.go")
	public String noticeListGo() {
		
		logger.info("공지사항 리스트 진입");
		
		return "noticePage/noticeList";
	}
	
	@RequestMapping(value = "/noticeDetail.go")
	public String noticeDetailAdminGo(int idx, Model model) {
		noticeService.noticeDetailAdmin(idx, model);

		return "noticePage/noticeDetail";
	}
	
	@RequestMapping(value = "noticeManagementlist.ajax")
	@ResponseBody
	public Map<String, Object> noticeManagementlist(int page , int searchType, String serachText, int delType) {
		logger.info("noticeManagementlist 요청");
		logger.info("요청페이지 : " + page);
		logger.info("공지사항 검색에서 가져온 text : "+serachText);
		logger.info("공지사항 검색에서 가져온 type : "+searchType);
		logger.info("공지사항 검색에서 가져온 delType : "+delType);
		Map<String, Object> map = null;
		int currPage = page;
			
			map = noticeService.showListSearch(currPage,searchType,serachText,delType);	
		
		
		return map;
	}
	
	
}
