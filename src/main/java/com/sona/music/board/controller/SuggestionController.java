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

import com.sona.music.board.dto.SuggestionDTO;
import com.sona.music.board.service.SuggestionService;

@Controller
public class SuggestionController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired SuggestionService suggestionService;
	
	@RequestMapping(value="/suggestionsList.go")
	public String suggestionsListGo() {
		return "suggestion/suggestionsList";
	}
	



	@RequestMapping(value="/suggestionsList.ajax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> suggestionsListCall(String page, String condition, String searchContent) {
		
		int currPage = Integer.parseInt(page);
		int pagePerCnt = 10;
		
		Map<String, Object> map = suggestionService.suggestionsListCall(currPage, pagePerCnt, condition, searchContent);
		
		return map;
	}
	
	@RequestMapping(value="/suggestionsDetail.go")
	public String suggestionsDetailGo(String sug_idx, Model model) {
		
		suggestionService.suggestionsDetailGo(sug_idx, model);
		
		return "suggestion/suggestionsDetail";
	}
	
	@RequestMapping(value="/suggestionsAnswerWrite.do")
	public String answerWrite (String sug_idx, @RequestParam Map<String, String> param, HttpSession session) {
		String page = "member/login";
		String adminId = (String) session.getAttribute("loginId");
		String user_type = (String) session.getAttribute("user_type");
		String sug_answer = param.get("sug_answer");
		
		if (user_type.equals("관리자")) {
			int row = suggestionService.answerWrite(sug_idx, adminId, sug_answer);
			logger.info("입력한 row 수 = " + row);
			page = "redirect:/suggestionsDetail.go?sug_idx=" + sug_idx;
		}
		
		return page;
	}
	
	@RequestMapping(value="/suggestionsDelete.do")
	public String suggestionsDelete (String sug_idx, HttpSession session) {
		String page = "member/login";
		
		if (session.getAttribute("loginId") != null) {
			int row = suggestionService.suggestionsDelete(sug_idx);
			page = "redirect:/suggestionsList.go";
		}
		return page;
	}
	
	@RequestMapping(value="/answerDelete.do")
	public String answerDelete (String sug_idx, HttpSession session) {
		String page = "member/login";
		String user_type = (String) session.getAttribute("user_type");
		
		
		if (user_type.equals("관리자")) {
			int row = suggestionService.answerDelete(sug_idx);
			logger.info("삭제한 row 수 = " + row);
			page = "redirect:/suggestionsDetail.go?sug_idx=" + sug_idx;
		}
		
		return page;
	}
	
	@RequestMapping(value="/suggestionsWrite.go")
	public String suggestionsWriteGo (HttpSession session) {
		String page = "member/login";
		
		if (session.getAttribute("loginId") != null) {
			page = "suggestion/suggestionsWrite";
		}
		return page;
	}
	
	@RequestMapping(value="/suggestionsWrite.do", method = RequestMethod.POST)
	public String suggestionsWriteDo (MultipartFile[] sug_photos, @RequestParam Map<String, String> param, HttpSession session) {
		String page = "member/login";
		String loginId = (String) session.getAttribute("loginId");
		
		if (loginId != null) {
			page = "redirect:/suggestionsList.go";
			int row = suggestionService.suggestionsWrite(sug_photos, param, loginId);
			logger.info("입력한 게시글 수 = " + row);
		}
		return page;
	}
	
	@RequestMapping(value="/suggestionsEdit.go")
	public String suggestionsEditGo (String sug_idx, HttpSession session, Model model) {
		String page = "member/login";
		
		if (session.getAttribute("loginId") != null) {
			page = "suggestion/suggestionsEdit";
			suggestionService.suggestionsEditGo(sug_idx, model);
		}
		return page;
		
	}
	
	@RequestMapping(value="/suggestionsEdit.do", method = RequestMethod.POST)
	public String suggestionsEditDo (MultipartFile[] sug_photos, @RequestParam Map<String, String> param, String sug_idx, HttpSession session) {
		String page = "member/login";
		String loginId = (String) session.getAttribute("loginId");
		
		if (loginId != null) {
			page = "redirect:/suggestionsDetail.go?sug_idx=" + sug_idx;
			int row = suggestionService.suggestionsEdit(sug_photos, param, loginId, sug_idx);
			logger.info("수정한 게시글 수 = " + row);
		}
		return page;
	}
	
	@RequestMapping(value="/answerEdit.go")
	public String answerEditGo (String sug_idx, HttpSession session, Model model) {
		String page = "member/login";
		
		if (session.getAttribute("loginId") != null) {
			page = "suggestion/suggestionsAnswerEdit";
			suggestionService.answerEditGo(sug_idx, model);
		}
		return page;
		
	}
	
	@RequestMapping(value="/suggestionsAnswerEdit.do", method = RequestMethod.POST)
	public String answerWrite (@RequestParam Map<String, String> param, String sug_idx, HttpSession session) {
		String page = "member/login";
		String adminId = (String) session.getAttribute("loginId");
		String user_type = (String) session.getAttribute("user_type");
		String sug_answer = param.get("sug_answer");
		int sug_answer_idx = Integer.parseInt(param.get("sug_answer_idx"));
		
		if (user_type.equals("관리자")) {
			int row = suggestionService.answerEdit(sug_answer_idx, adminId, sug_answer);
			logger.info("수정한 row 수 = " + row);
			page = "redirect:/suggestionsDetail.go?sug_idx=" + sug_idx;
		}
		
		return page;
	}
	
}
