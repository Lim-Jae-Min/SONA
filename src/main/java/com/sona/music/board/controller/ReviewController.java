package com.sona.music.board.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sona.music.board.service.ReviewService;

@Controller
public class ReviewController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ReviewService reviewService;
	
	@RequestMapping(value="/lessonReviewList")
	public String reviewlist(Model model) {
		logger.info("리뷰 리스트 요청");
		
		
		return "lesson/lessonReviewList";
	}
	
	@RequestMapping(value="/list.ajax")
	@ResponseBody
	public Map<String , Object> listCall(String page, String cnt){
		logger.info("listCall 요청");
		logger.info("페이지당 보여줄 갯수:"+cnt);
		logger.info("요청 페이지: "+page);
		
		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		Map<String, Object>map = reviewService.list(currPage,pagePerCnt);
		
		return map;
	}
	
	@RequestMapping(value="/lessonReviewWrite")
	public String reviewWrite(Model model) {
		logger.info("리뷰 작성 요청");
		
		return "lesson/lessonReviewWrite";
	}
	
	@RequestMapping(value="/reviewWrite", method = RequestMethod.POST)
	public String write(MultipartFile photos, HttpSession session, @RequestParam Map<String,String>param) {
		
		logger.info("params = {}", param);
		String page = "redirect:/lessonReviewList";
		if (session.getAttribute("loginId")!=null) {
			int row = reviewService.write(photos, param);
			if(row<1) {
				page = "lesson/lessonReviewWrite";
			}
		}
		
		return page;
	}
	
	
	
	
	
	
	
	
	
}
