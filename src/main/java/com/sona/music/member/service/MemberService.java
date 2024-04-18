package com.sona.music.member.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sona.music.member.dao.MemberDAO;

@Service
public class MemberService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MemberDAO memberDAO;

	public String emailCheck(String email) {
		
		return  memberDAO.emailCheck(email);
	}
	
}
