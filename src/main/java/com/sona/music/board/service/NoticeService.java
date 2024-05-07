package com.sona.music.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sona.music.board.dao.NoticeDAO;
import com.sona.music.board.dto.NoticeDTO;
import com.sona.music.board.dto.PhotoDTO;

@Service
public class NoticeService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired NoticeDAO noticeDAO;

	public Map<String, Object> showList(int currPage ) {
		
//		int pagePerCnt = 10;
//		int start = (currPage-1)*pagePerCnt;
//		int deleteStatus = 0;
//		Map<String, Object> result = new HashMap<String, Object>();
//		
//		List<NoticeDTO> resultList = noticeDAO.showList(start,pagePerCnt,deleteStatus);
//		
//		for (NoticeDTO notice : resultList) {
//			logger.info("공지사항 관리에서 불러온 거"+notice.getNotice_idx());
//		}
		
//		result.put("list", resultList);
//		result.put("currPage", currPage);
//		result.put("totalPages", noticeDAO.allCount(pagePerCnt));
//		logger.info("공지사항관리에서 받아온 allCount"+noticeDAO.allCount(pagePerCnt));
		return null;
	}


	public Map<String, Object> showListSearch(int currPage, int searchType, String serachText ,int delType) {
			int pagePerCnt = 10;
			int start = (currPage-1)*pagePerCnt;
			int deleteStatus = delType;
			Map<String, Object> result = new HashMap<String, Object>();
			List<NoticeDTO> resultList = null;
			
			
			resultList = noticeDAO.showListSearch(start,pagePerCnt,deleteStatus,serachText,searchType);
			logger.info(serachText);


		
			result.put("list", resultList);
			result.put("currPage", currPage);
			result.put("totalPages", noticeDAO.allCount(pagePerCnt,deleteStatus,serachText,searchType));
			logger.info("공지사항관리에서 받아온 allCount"+noticeDAO.allCount(pagePerCnt,deleteStatus,serachText,searchType));
		return result;
	}


	public void noticeDetailAdmin(int idx, Model model) {
		int deleteStatus = 0;
		String photo_category = "Notice";
		NoticeDTO dto = noticeDAO.noticeDetailAdmin(idx);
		noticeDAO.noticeViews(idx);
		List<PhotoDTO> noticePhoto = noticeDAO.getNoticePhoto(idx,photo_category);
		for (PhotoDTO photoDTO : noticePhoto) {
			logger.info(photoDTO.getNew_filename());
		}
//		String photo = noticePhoto.get(0).getNew_filename();
//		logger.info(photo);
		String title = dto.getNotice_title();
		logger.info("공지사항관리에서 들어간 공지사항 상세보기 : " + title);		
		model.addAttribute("noticeDetail", dto);
		model.addAttribute("photos",noticePhoto);
		
	}
	
}
