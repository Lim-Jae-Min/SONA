package com.sona.music.mypage.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sona.music.mypage.dao.MyPageDAO;
import com.sona.music.mypage.dto.MyPageDTO;

@Service
public class MyPageService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MyPageDAO myPageDAO;

	public MyPageDTO getUserInfo(String loginId) {
		return myPageDAO.getUserInfo(loginId);
	}

	public boolean overlay(String newPassword, String confirmPassword) {
		return newPassword.equals(confirmPassword);	
		
	}

	public void updateUserInfo(Map<String, Object> map) {
		
		myPageDAO.updateUserInfo(map);
	}

	public String editUserInfo(MyPageDTO requestData) {
		return myPageDAO.editUserInfo(requestData);
	}
	
}
