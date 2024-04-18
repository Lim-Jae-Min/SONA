package com.sona.music.member.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sona.music.member.service.MemberService;

@Controller
public class MemberController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MemberService memberService;
	
	
	
	@RequestMapping(value ="/findIdCheck", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> findIdCheck (String email){
		logger.info("이메일 받은값 : " + email);
		Map<String, Object> emailCheckMap = memberService.emailCheck(email);
		
		return null;
	}
}
