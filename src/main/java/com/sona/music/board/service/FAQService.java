package com.sona.music.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sona.music.board.dao.FAQDAO;
import com.sona.music.board.dto.FAQDTO;
import com.sona.music.board.dto.NoticeDTO;
import com.sona.music.board.dto.PhotoDTO;

@Service
public class FAQService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired FAQDAO faqDAO;
	
	
	public Map<String, Object> showListSearch(int currPage, int searchType, String serachText, int categoryNum) {
		int pagePerCnt = 10;
		int start = (currPage-1)*pagePerCnt;
		int deleteStatus = 0;
		Map<String, Object> result = new HashMap<String, Object>();
		List<FAQDTO> resultList = null;
//		if(categoryNum == )
		
		resultList = faqDAO.showListSearch(start,pagePerCnt,deleteStatus,serachText,searchType,categoryNum);
		logger.info(serachText + "텍스트");

		for (FAQDTO faqdto : resultList) {
			logger.info(faqdto.getFaq_title());
		}
	
		result.put("list", resultList);
		result.put("currPage", currPage);
		result.put("totalPages", faqDAO.allCount(pagePerCnt,deleteStatus,serachText,searchType,categoryNum));
		logger.info("공지사항관리에서 받아온 allCount"+faqDAO.allCount(pagePerCnt,deleteStatus,serachText,searchType,categoryNum));
	return result;
}


	public void faqDetailAdmin(int idx, Model model) {
		FAQDTO dto = faqDAO.faqDetailAdmin(idx);
		String answer = dto.getFaq_answer();
		int faqIdx = dto.getFaq_idx();
//		faqDAO.faqViews(idx);
		
		String title = dto.getFaq_title();
		logger.info("FAQ 들어간 FAQ 상세보기 : " + title);	
		logger.info("FAQ 들어간 FAQ 상세보기 : " + answer);	
		logger.info("FAQ 들어간 FAQ 상세보기 : " + faqIdx);
		
		model.addAttribute("faqDetail", dto);
		
	}
	
}
