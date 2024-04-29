package com.sona.music.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sona.music.board.dao.SuggestionDAO;
import com.sona.music.board.dto.SuggestionDTO;

@Service
public class SuggestionService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired SuggestionDAO suggestionDAO;
	
	
	public Map<String, Object> showListSearch(int currPage, int searchType, String serachText, int categoryNum) {
		int pagePerCnt = 10;
		int start = (currPage-1)*pagePerCnt;
		int deleteStatus = 0;
		Map<String, Object> result = new HashMap<String, Object>();
		List<SuggestionDTO> resultList = null;
//		if(categoryNum == )
		
		resultList = suggestionDAO.showListSearch(start,pagePerCnt,deleteStatus,serachText,searchType,categoryNum);
		for (SuggestionDTO list : resultList) {
			logger.info(list.getUser_id());
			logger.info("sug 답변 개수 : "+list.getSug_answerCount());
			logger.info("sug idx : "+list.getSug_idx());
			logger.info(list.getUser_id());
			
		}
		logger.info(serachText + "텍스트");

		for (SuggestionDTO faqdto : resultList) {
			logger.info("sug 에서 가져온 title : "+faqdto.getSug_title());
		}
	
		result.put("list", resultList);
		result.put("currPage", currPage);
		result.put("totalPages", suggestionDAO.allCount(pagePerCnt,deleteStatus,serachText,searchType,categoryNum));
		logger.info("공지사항관리에서 받아온 allCount"+suggestionDAO.allCount(pagePerCnt,deleteStatus,serachText,searchType,categoryNum));
	return result;
}
}
