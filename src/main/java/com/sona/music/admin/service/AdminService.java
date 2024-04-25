package com.sona.music.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sona.music.admin.dao.AdminDAO;
	

@Service
public class AdminService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AdminDAO adminDAO;

	public int noticeDel(int noticeIdx) {
		
		int row = adminDAO.noticeDel(noticeIdx);
		logger.info("공지사항 삭제에 대한 값 : 1이면 삭제 완료" + row);
		return row;
	}

	public int adminCheck(Object attribute) {
		String id = (String) attribute;
		
		return adminDAO.adminCheck(id);
	}

	
	
	public int noticeWrite(MultipartFile[] photos, Map<String, String> param) {
		
		logger.info("공지사항 작성자 : "+param.get("writer"));
		
		
		
		return 0;
	}


	
}
