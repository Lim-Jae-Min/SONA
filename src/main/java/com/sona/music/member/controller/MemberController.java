package com.sona.music.member.controller;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.sona.music.member.dto.MemberDTO;
import com.sona.music.member.service.MemberService;

@Controller
public class MemberController {

    Logger logger = LoggerFactory.getLogger(getClass());
    
    @Autowired MemberService memberService;
    
    
    @RequestMapping(value ="/findIdEmail.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> findIdEmail (String email, HttpSession session){
        logger.info("이메일 받은값 : " + email);
        Map<String,Object> map = new HashMap<String,Object>();
        String emailSession = memberService.findIdEmail(email, session);
        logger.info(emailSession+ "ID 찾기 요청으로 DB에서 받아온 이메일 ");
        map.put("emailSession",emailSession);
        return map;
    }
	
	@RequestMapping(value="/joinform.go")
	public String joinform(Model model) {
		logger.info("회원가입 페이지 접근");
		
		return "member/joinform";
	}
	
	@RequestMapping(value="/idFind.go")
	public String idFind(Model model) {
		logger.info("아이디 찾기 페이지 접근");
		
		return "member/idFind";
	}
	
	
	@RequestMapping(value="/login.do")
	public String login(String id, String pw, Model model, HttpSession session) {
		String page = "member/login";
		logger.info("id : {} | pw : {}", id, pw);
		
		
		MemberDTO info = memberService.login(id, pw);
//		logger.info("loginId : "+ info.getUSER_ID().toString());
		
		if(info != null) {
			page = "/main/main";
			session.setAttribute("loginId", info.getUSER_ID());	
			session.setAttribute("user_type", info.getUSER_TYPE());	
			session.setAttribute("user_name", info.getUSER_NAME());
			String test = (String) session.getAttribute("loginId");
			
			logger.info("test : " + test);
		}else {
			model.addAttribute("msg","아이디 또는 비밀번호 확인해주세요");
		}
				
		return page;
	
	}
	/*
	@RequestMapping(value="/join.do")
	public String join(Model model, @RequestParam Map<String, String> param) {
		logger.info("회원가입 요청");
		String msg = "회원가입에 실패하였습니다.";
		String page = "joinForm";
		
		int row = memberService.join(param);
		logger.info("회원가입 row 반환값: "+ row);
		
		if(row == 1) {
			page = "login";
			msg = "회원가입에 성공하였습니다.";
		}
		
		model.addAttribute("msg",msg);		
		return page;
	}
*/	
	
	
    @RequestMapping(value ="/idFindResult.go", method = RequestMethod.POST)
    public String idFindResult (){
        
        
    	
        return "member/idFindResult";
    }
}
