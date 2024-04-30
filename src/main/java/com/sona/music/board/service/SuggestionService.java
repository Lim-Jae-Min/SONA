package com.sona.music.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sona.music.board.dao.SuggestionDAO;
import com.sona.music.board.dto.PhotoDTO;
import com.sona.music.board.dto.SuggestionDTO;

@Service
public class SuggestionService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired SuggestionDAO suggestionDAO;

	public Map<String, Object> suggestionsListCall(int currPage, int pagePerCnt, String condition,
			String searchContent) {
		int start = (currPage-1) * pagePerCnt;
		
		Map<String, Object> result = new HashMap<String, Object>();
		List<SuggestionDTO> list = suggestionDAO.suggestionsListCall(pagePerCnt, start, condition, searchContent);
		logger.info("list : {}", list);
		logger.info("list size : "+list.size());
		logger.info("condition = " + condition);
		logger.info("content = " + searchContent);
		result.put("list", list);		
		result.put("currPage", currPage);
		result.put("totalPages", suggestionDAO.suggestionsListCount(pagePerCnt, condition, searchContent));
		
		return result;
	}

	public void suggestionsDetailGo(String sug_idx, Model model) {
		
		suggestionDAO.suggestionsViewUp(sug_idx);
		
		SuggestionDTO dto = suggestionDAO.suggestionsDetailGo(sug_idx);
		model.addAttribute("dto", dto);
		
		List<PhotoDTO> photos = suggestionDAO.suggestionsDetailPhotos(sug_idx);
		model.addAttribute("photos", photos);
	}
}
