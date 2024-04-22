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
	@Transactional
	public int updateUserInfo(Map<String, Object> map, String loginId) {
	    int row = myPageDAO.updateUserInfo(map, loginId);
	    return row;
	}

	public String editUserInfo(MyPageDTO requestData) {
		return myPageDAO.editUserInfo(requestData);
	}


	
}
