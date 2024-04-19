package com.sona.music.member.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sona.music.member.dao.MemberDAO;
import com.sona.music.member.dto.MemberDTO;

@Service
public class MemberService {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MemberDAO memberDAO;

	public String findIdEmail(String email, HttpSession session) {
		
		// if로 조건붙어주기
		 String findId = memberDAO.session(email);
		 if(findId != null) {
			 session.setAttribute("findId", findId);
			 logger.info("세션 값 : " + session.getAttribute(findId));
		 }else {
			 logger.info("세션 값 받기 실패");
		 }
		
		return  memberDAO.findIdEmail(email);
	}

	public MemberDTO login(String id, String pw) {
		logger.info("여긴 서비스 ");
		logger.info("id : {} | pw : {}", id, pw);
		return memberDAO.login(id,pw);
	}

	public Object overlay(String id) {
		return memberDAO.overlay(id);
	}

	public int join(Map<String, String> param) {
		logger.info("회원가입 param 값: " + param);
		int row = memberDAO.join(param);
		return row;
	}
	
}
