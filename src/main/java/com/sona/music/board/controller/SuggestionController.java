package com.sona.music.board.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sona.music.board.dto.SuggestionDTO;
import com.sona.music.board.service.SuggestionService;

@Controller
public class SuggestionController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired SuggestionService suggestionService;
	
	@RequestMapping(value="suggestionsList.go")
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
	
	@RequestMapping(value="suggestionsDetail.go")
	public String suggestionsDetailGo(String sug_idx, Model model) {
		
		suggestionService.suggestionsDetailGo(sug_idx, model);
		
		return "suggestion/suggestionsDetail";
	}
	
}
