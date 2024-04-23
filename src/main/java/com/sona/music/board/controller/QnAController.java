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
	public Map<String , Object> listCall(String page, @RequestParam(value="classIdx") Integer classIdx, @RequestParam(value="cnt", defaultValue = "5") String cnt){
		logger.info("listCall 요청");
		logger.info("페이지당 보여줄 갯수:"+cnt);
		logger.info("요청 페이지: "+page);
		logger.info("classIDx{}",classIdx);
		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
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
	public String qwrite(Integer CLASS_IDX, HttpSession session, @RequestParam Map<String,String>param) {
		logger.info("리뷰 작성함");
		logger.info("params = {}", param);
		String page = "redirect:/lessonQnAList?CLASS_IDX="+ CLASS_IDX;
		if (session.getAttribute("loginId")!=null) {
			int row = qnaService.qwrite(param);
			if(row<1) {
				page = "lesson/lessonQnAWrite?CLASS_IDX="+ CLASS_IDX;
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
	
	@RequestMapping(value="/lessonQnAReply")
	public String qnaReply(Integer QUESTION_IDX, Model model) {
		logger.info("질문 idx ="+QUESTION_IDX+" Q&A 답변 작성 요청");
		
		qnaService.detail(QUESTION_IDX, model);
		
		return "lesson/lessonQnAReply";
	}
	
	@RequestMapping(value="/aWrite")
	public String aWrite(@RequestParam Map<String, String> param, HttpSession session) {
		logger.info("질문 idx ="+param.get("QUESTION_IDX")+" Q&A 답변 작성 요청");
		logger.info(param.get("CLASS_IDX"));
		
		String page = "redirect:/lessonQnAList?CLASS_IDX="+ param.get("CLASS_IDX");
		if(session.getAttribute("loginId")!=null) {
			int row = qnaService.reply(param);
			
			if(row<1) {
				page = "lesson/lessonQnAReply?QUESTION_IDX="+param.get("QUESTION_IDX");
			}
			
		}
		
		
		return page;
	}
	
	
}
