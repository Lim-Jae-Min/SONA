package com.sona.music.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sona.music.mypage.dao.MyPageDAO;
import com.sona.music.mypage.dto.MyPageDTO;

@Service
public class MyPageService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MyPageDAO myPageDAO;

	public MyPageDTO getUserInfo(String loginId) {
		return myPageDAO.getUserInfo(loginId);
	}

	public boolean confirmPw(String newPassword, String confirmPassword) {
		return newPassword.equals(confirmPassword);	
		
	}
	
	public int updateUserInfo(Map<String, String> map) {
		    // 전달된 데이터를 맵에 추가합니다.
        	logger.info("회원 수정하기~ ", map);
		    logger.info("전달된 데이터: {}", map);

		    // DAO를 통해 업데이트 수행
		    int row = myPageDAO.updateUserInfo(map);
		    
		    // 업데이트된 행 수 반환
		    return row;
		}

	public String editUserInfo(MyPageDTO requestData) {
		return myPageDAO.editUserInfo(requestData);
	}

	public List<MyPageDTO> getAllQnA() {
		// TODO Auto-generated method stub
		return myPageDAO.getAllQnA();
	}





	
}
