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
import org.springframework.web.multipart.MultipartFile;

import com.sona.music.board.dao.ReviewDAO;
import com.sona.music.board.dto.PhotoDTO;
import com.sona.music.board.dto.ReviewDTO;


@Service
public class ReviewService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ReviewDAO reviewDAO;
	
	public String file_root = "C:/upload/";

	public Map<String, Object> list(int currPage, int pagePerCnt) {
		
		int start = (currPage-1)*pagePerCnt;
		
		Map<String, Object> result = new HashMap<String, Object>();
		List<ReviewDTO> list = reviewDAO.list(pagePerCnt,start);
		logger.info("list size: "+list.size());
		result.put("list", list);
		result.put("currPage",currPage);
		result.put("totalPages", reviewDAO.allCount(pagePerCnt));
		
		for (ReviewDTO r : list) {
			logger.info(r.getREVIEW_TITLE()+"");
			logger.info(r.getSTUDY_DATE()+"");
		}
		
		return result;
	}
	
	public int write(MultipartFile photos, 
			Map<String, String> param) {
		int row = -1;
		//insert후 생성된 idx 가져오는 방법
		//조건 1. 파라메터는 DTO로 넣을 것
		ReviewDTO dto = new ReviewDTO();
		dto.setCLASS_IDX(Integer.parseInt(param.get("CLASS_IDX")));
		dto.setRATEE_ID(param.get("RATEE_ID"));
		dto.setRATER_ID(param.get("RATER_ID"));
		dto.setSCORE(Double.parseDouble(param.get("SCORE")));
		dto.setREVIEW_TITLE(param.get("REVIEW_TITLE"));
		dto.setREVIEW_CONTENT(param.get("REVIEW_CONTENT"));
		
		PhotoDTO pdto = new PhotoDTO();
		pdto.setPHOTO_CATEGORY(param.get("PHOTO_CATEGORY"));
		

		row = reviewDAO.write(dto); //글쓰기 완료 후 

		//조건3. 이후 dto에서 저장된 키 값을 받아온다.
		int idx = dto.getREVIEW_IDX();
		String username = dto.getRATER_ID();
		String photoCategory = pdto.getPHOTO_CATEGORY();
		logger.info("idx="+idx);
		logger.info("user="+username);
		logger.info("photoCategory="+photoCategory);

		if(row>0) {
			fileSave(idx, username, photoCategory, photos); // 파일 저장
		}

		return row;
	}


	public void fileSave(int idx,String username, String photoCategory, MultipartFile photos) {
		logger.info(idx+"fileSave");
		logger.info(username);
		logger.info(photoCategory);
		logger.info(photos+"fileSave");
		
		if(photos != null) {
			logger.info(idx+"fileSave");
			logger.info(username);
			logger.info(photoCategory);
			logger.info(photos+"fileSave");
			
			//1. 업로드 할 파일명이 있는가?
			String fileName = photos.getOriginalFilename();
			logger.info("upload file Name : "+fileName);
			if(!fileName.equals("")) {//파일명이 있다면 == 업로드가 있다며
				//1. 기존 파일명에서 확장자 추출(high.gif에서gif만)

				String arr[] = fileName.split("\\.");//특수문자로 인식해서 나누지 못 하므로 역슬래쉬 2번 해준다.
				String ext = arr[arr.length-1];

				//2. 새파일명 생성
				String newFileName = System.currentTimeMillis()+"."+ext;
				logger.info(fileName+"->"+newFileName);

				//3. 파일 저장
				try {
					byte[] bytes = photos.getBytes(); //MultipartFile로 부터 바이너리 추출
					Path path = Paths.get(file_root+newFileName); //저장 경로 지정
					Files.write(path, bytes); //저장
					
					reviewDAO.fileWrite(fileName,newFileName,idx,username,photoCategory);
					Thread.sleep(1);//파일명을 위해 강제 휴식 부여
				} catch (Exception e) {

					e.printStackTrace();
				}

			}

		}
	}


}
	

