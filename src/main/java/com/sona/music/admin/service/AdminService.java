package com.sona.music.admin.service;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;

import com.sona.music.admin.dao.AdminDAO;
import com.sona.music.admin.dto.AdminDTO;
import com.sona.music.admin.dto.PhotoDTO;
	

@Service
public class AdminService {

	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AdminDAO adminDAO;

	public String file_root = "C:/upload/";
	
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
		
		AdminDTO noticeWriteDto = new AdminDTO();
		noticeWriteDto.setAdmin_id("admin");
		noticeWriteDto.setNotice_content(param.get("content"));
		noticeWriteDto.setNotice_title(param.get("title"));
		String noticeWriteId = noticeWriteDto.getAdmin_id();
		
		int row = adminDAO.noticeWrite(noticeWriteDto);
		logger.info("공지사항 작성 성공시 나오는 row : 1" + row);
		int noticeIdx = noticeWriteDto.getNotice_idx();
		logger.info("공지사항 작성후 가져온 idx : " + noticeIdx);
		String photoCategory = "Notice";
		PhotoDTO noticePhotoDto = new PhotoDTO();
		if(row == 1) {
			fileSave(noticeIdx,noticeWriteId,photos,photoCategory);
		}
		
		return row;
	}
	
	public int noticeUpdate(MultipartFile[] photos, Map<String, String> param) {
		
		logger.info("공지사항 작성자 : "+param.get("writer"));
		
		AdminDTO noticeWriteDto = new AdminDTO();
		noticeWriteDto.setAdmin_id("admin");
		noticeWriteDto.setNotice_content(param.get("content"));
		noticeWriteDto.setNotice_title(param.get("title"));
		noticeWriteDto.setNotice_idx(Integer.parseInt(param.get("noticeIdx")));
		String noticeWriteId = noticeWriteDto.getAdmin_id();
		
		int row = adminDAO.noticeUpdate(noticeWriteDto);
		logger.info("공지사항 작성 성공시 나오는 row : 1" + row);
		int noticeIdx = noticeWriteDto.getNotice_idx();
		logger.info("공지사항 작성후 가져온 idx : " + noticeIdx);
		String photoCategory = "Notice";
		PhotoDTO noticePhotoDto = new PhotoDTO();
		if(row == 1) {
			fileSave(noticeIdx,noticeWriteId,photos,photoCategory);
		}
		
		return row;
	}
	

	public void fileSave(int noticeIdx, String noticeWriteId, MultipartFile[] photos, String photoCategory) {
		 for (MultipartFile photo : photos) {
				
			   String fileName = photo.getOriginalFilename();
			   logger.info("upload file name : "+fileName);
			   
			   if(!(fileName.equals(""))) { // 파일명이 있다면 == 업로드 파일이 있다면
				   // 1.기존 파일명에서 확장자 추출(high.gif)
				   logger.info("파일명 확인" + fileName);
				   int a= fileName.lastIndexOf(".");
				   String filename2 =fileName.substring(a,fileName.length());
				   logger.info(filename2 + " : 확장자 뺀 파일명");
				   String ext = "";
				   // 2.새파일명 생성
				   String newFileName = System.currentTimeMillis()+filename2;
				   logger.info(fileName + " ->" + newFileName);
				   // 3.파일 저장
				   try {
					   byte[] bytes = photo.getBytes(); // MultipartFile 로 부터 바이너리 추출
					   Path path = Paths.get(file_root + newFileName);
					   Files.write(path, bytes); // 저장
					   adminDAO.noticePhotoWrite(fileName,newFileName,noticeIdx,noticeWriteId,photoCategory);
					   Thread.sleep(1); // 파일명을 위해 강제 휴식 부여
				   } catch (Exception e) {
					   e.printStackTrace();
				   }
			   }
		 }
		
	}

	public int photoDel(int photoidx, String photoname, String photocategory) {
		int row = adminDAO.photoDel(photoidx,photocategory,photoname);
		
		if(row == 1) {
			logger.info("DB 사진 삭제됨");
			delFile(photoname);
		}
		return row;
	}
	
	private void delFile(String photoname) {

			File file = new File(file_root+photoname);			
			boolean aa = file.delete();
		if(aa) {
			logger.info("경로에 있는 파일 삭제됨");
		}
	}
	

	
}
