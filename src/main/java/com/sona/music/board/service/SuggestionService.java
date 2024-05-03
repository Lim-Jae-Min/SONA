package com.sona.music.board.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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
		int row = suggestionDAO.suggestionsDelete(sug_idx);
		logger.info("삭제된 건의사항 게시글 수 = " + row);
		
		return row;
	}

	public int answerDelete(String sug_idx) {
		int row = suggestionDAO.answerDelete(sug_idx);
		return row;
	}

	public int suggestionsWrite(MultipartFile[] sug_photos, Map<String, String> param, String loginId) {
		int row = -1;
		
		SuggestionDTO dto = new SuggestionDTO();
		
		dto.setUser_id(loginId);
		dto.setSug_title(param.get("sug_title"));
		dto.setSug_content(param.get("sug_content"));
		dto.setSug_secret(Integer.parseInt(param.get("sug_secret")));
		
		row = suggestionDAO.suggestionsWrite(dto);
		
		int idx = dto.getSug_idx();

		if (row > 0) {
			fileSave(idx, loginId, sug_photos);			
		}
		
		return row;
	}

	public void fileSave(int idx, String loginId, MultipartFile[] sug_photos) {
		for (MultipartFile photo : sug_photos) {
			// 1. 업로드할 파일 명이 있는가?
			String fileName = photo.getOriginalFilename();
			logger.info("fileName : " + fileName);
			if (!fileName.equals("")) { // 파일명이 있다 == 업로드 파일이 있다면
				// 1. 기존 파일명에서 확장자 추출 (high.gif)
				
				// 1-2. subString 활용 방법
				String ext = fileName.substring(fileName.lastIndexOf("."));
				
				// 2. 새파일명 생성
				String newFileName = System.currentTimeMillis() + ext;
				logger.info(fileName + " -> " + newFileName);
				
				// 3. 파일 저장
				try {
					byte[] bytes = photo.getBytes(); // MultipartFile 로부터 바이너리 추출
					Path path = Paths.get(file_root + newFileName); // 저장 경로 지정
					Files.write(path, bytes);
					
					suggestionDAO.photoWrite(loginId, fileName, newFileName, idx);
					
					Thread.sleep(1); // 파일명이 곂치지 않기 위해 강제 휴식 부여
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
		}
		
	}

	public void suggestionsEditGo(String sug_idx, Model model) {
		SuggestionDTO dto = suggestionDAO.suggestionsDetailGo(sug_idx);
		model.addAttribute("dto", dto);
		
		List<PhotoDTO> photos = suggestionDAO.suggestionsDetailPhotos(sug_idx);
		model.addAttribute("photos", photos);
		
	}

	public int suggestionsEdit(MultipartFile[] sug_photos, Map<String, String> param, String loginId, String sug_idx) {
int row = -1;
		
		SuggestionDTO dto = new SuggestionDTO();
		
		dto.setSug_idx(Integer.parseInt(sug_idx));
		dto.setSug_title(param.get("sug_title"));
		dto.setSug_content(param.get("sug_content"));
		dto.setSug_secret(Integer.parseInt(param.get("sug_secret")));
		
		row = suggestionDAO.suggestionsEdit(dto);
		
		int idx = Integer.parseInt(sug_idx);

		if (row > 0) {
			fileSave(idx, loginId, sug_photos);			
		}
		
		return row;
	}

	public void answerEditGo(String sug_idx, Model model) {
		SuggestionDTO dto = suggestionDAO.suggestionsDetailGo(sug_idx);
		model.addAttribute("dto", dto);
		
		List<PhotoDTO> photos = suggestionDAO.suggestionsDetailPhotos(sug_idx);
		model.addAttribute("photos", photos);
		
	}

	public int answerEdit(int sug_answer_idx, String adminId, String sug_answer) {
		int row = suggestionDAO.answerEdit(sug_answer_idx, adminId, sug_answer);
		return row;
	}
}
