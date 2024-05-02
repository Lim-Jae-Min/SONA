package com.sona.music.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.sona.music.board.dao.SuggestionDAO;
import com.sona.music.board.dto.PhotoDTO;
import com.sona.music.board.dto.SuggestionDTO;

@Service
public class SuggestionService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired SuggestionDAO suggestionDAO;
	
	public String file_root = "C:/upload/";

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

	public int answerWrite(String sug_idx, String adminId, String sug_answer) {
		int row = suggestionDAO.answerWrite(sug_idx, adminId, sug_answer);
		return row;
	}

	public int suggestionsDelete(String sug_idx) {
		int row = suggestionDAO.answerDelete(sug_idx);
		logger.info("삭제된 건의사항 답변 수 = " + row);
		
		row = suggestionDAO.suggestionsDelete(sug_idx);
		logger.info("삭제된 건의사항 게시글 수 = " + row);
		
		return row;
	}

	public int answerDelete(String sug_idx) {
		int row = suggestionDAO.answerDelete(sug_idx);
		return row;
	}

	public int suggestionsWrite(MultipartFile sug_photos, Map<String, String> param, String loginId) {
		int row = -1;
		
		SuggestionDTO dto = new SuggestionDTO();
		
		dto.setUser_id(loginId);
		dto.setSug_title(param.get("sug_title"));
		dto.setSug_content(param.get("sug_content"));
		dto.setSug_secret(Integer.parseInt(param.get("sug_secret")));
		
		row = suggestionDAO.suggestionsWrite(dto);
		
		int idx = dto.getSug_idx();
		// 쿼리문부터 짜기
		return row;
	}
}
