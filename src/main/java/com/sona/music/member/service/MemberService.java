package com.sona.music.member.service;

import java.util.List;

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

	public String findIdEmail(String email) {
		
		
		return  memberDAO.findIdEmail(email);
	}

	public MemberDTO login(String id, String pw) {
		logger.info("여긴 서비스 ");
		logger.info("id : {} | pw : {}", id, pw);
		return memberDAO.login(id,pw);
	}

	public List<String> findId(String email) {

		return memberDAO.findId(email);
	}

	public String findPw(String username, String email) {
		// TODO Auto-generated method stub
		return memberDAO.findPw(username,email);
	}

	public String findPwcheckId(String username) {
		// TODO Auto-generated method stub
		return memberDAO.findPwcheckId(username);
	}

	public String findPwEmail(String email, String username) {
		// TODO Auto-generated method stub
		return memberDAO.findPwEmail(email,username);
	}

	public int changePw(String changePwNeedId, String newPassword) {
		// TODO Auto-generated method stub
		return memberDAO.changePw(changePwNeedId,newPassword);
	}
	
}
