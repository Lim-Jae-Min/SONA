package com.sona.music.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sona.music.board.dao.NoticeDAO;
import com.sona.music.board.dto.NoticeDTO;

@Service
public class NoticeService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired NoticeDAO noticeDAO;

	public Map<String, Object> showList(int currPage ) {
		
		int pagePerCnt = 10;
		int start = (currPage-1)*pagePerCnt;
		int deleteStatus = 0;
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<NoticeDTO> resultList = noticeDAO.showList(start,pagePerCnt,deleteStatus);
		
		for (NoticeDTO notice : resultList) {
			logger.info("공지사항 관리에서 불러온 거"+notice.getNotice_idx());
		}
		
		result.put("list", resultList);
		result.put("currPage", currPage);
		result.put("totalPages", noticeDAO.allCount(pagePerCnt));
		logger.info("공지사항관리에서 받아온 allCount"+noticeDAO.allCount(pagePerCnt));
		return result;
	}


	public Map<String, Object> showListSearch(int currPage, String searchType, String serachText) {
			int pagePerCnt = 10;
			int start = (currPage-1)*pagePerCnt;
			int deleteStatus = 0;
			Map<String, Object> result = new HashMap<String, Object>();
			List<NoticeDTO> resultList = null;
			if(searchType.equals("content")) {
				 resultList = noticeDAO.showListSearchContent(start,pagePerCnt,deleteStatus,serachText);
				 logger.info(serachText);
				 for (NoticeDTO dto : resultList) {
					
					logger.info("내용 검색에서 가져온 값 : " + dto.getNotice_content());
					}
			}else if(searchType.equals("title")){
				 resultList = noticeDAO.showListSearchTitle(start,pagePerCnt,deleteStatus,serachText);
				 for (NoticeDTO dto : resultList) {
						
					logger.info("제목 검색에서 가져온 값 : " + dto.getNotice_content());
					}
			}
		
			result.put("list", resultList);
			result.put("currPage", currPage);
			result.put("totalPages", noticeDAO.allCount(pagePerCnt));
			logger.info("공지사항관리에서 받아온 allCount"+noticeDAO.allCount(pagePerCnt));
		return result;
	}
	
}
