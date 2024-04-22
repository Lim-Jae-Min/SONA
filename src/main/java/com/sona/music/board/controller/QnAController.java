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

import com.sona.music.board.dto.QnADTO;
import com.sona.music.board.service.QnAService;

@Controller
public class QnAController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired QnAService qnaService;
	
	
	@RequestMapping(value="/lessonQnAList")
	public String qnalist(Integer CLASS_IDX, Model model) {
		logger.info("idx="+CLASS_IDX+"QnA 리스트 요청");
		
		model.addAttribute("classIdx", CLASS_IDX);
		
		return "lesson/lessonQnAList";
	}
	
	
	@RequestMapping(value="/qnalist.ajax")
	@ResponseBody
	public Map<String , Object> listCall(String page, String cnt, Integer classIdx){
		logger.info("listCall 요청");
		logger.info("페이지당 보여줄 갯수:"+cnt);
		logger.info("요청 페이지: "+page);
		
		int currPage = Integer.parseInt(page);
		int pagePerCnt = 5;
		Map<String, Object>map = qnaService.list(currPage,pagePerCnt,classIdx);
		
		return map;
	}
	
	
	@RequestMapping(value="/lessonQnAWrite")
	public String qnaWrite(Integer CLASS_IDX, Model model, HttpSession session) {
		logger.info("강의IDX"+CLASS_IDX+"QnA 작성 요청");
		
		model.addAttribute("CLASS_IDX", CLASS_IDX);
		
		return "lesson/lessonQnAWrite";
	}
	
	@RequestMapping(value="/qWrite", method = RequestMethod.POST)
	public String qwrite(HttpSession session, @RequestParam Map<String,String>param) {
		logger.info("리뷰 작성함");
		logger.info("params = {}", param);
		String page = "redirect:/lessonQnAList";
		if (session.getAttribute("loginId")!=null) {
			int row = qnaService.qwrite(param);
			if(row<1) {
				page = "lesson/lessonQnAWrite";
			}
		}
		return page;
	}
	
	@RequestMapping(value="/lessonQnADetail")
	public String qnaDetail(Integer QUESTION_IDX, Model model) {
		logger.info("idx="+QUESTION_IDX+" Q&A 디테일 요청");
		
		
		qnaService.detail(QUESTION_IDX, model);
		
		return "lesson/lessonQnADetail";
	}
	
	
	
}
