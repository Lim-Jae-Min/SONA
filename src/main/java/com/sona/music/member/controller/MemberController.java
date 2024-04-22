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
import com.sona.music.mypage.dto.MyPageDTO;
import com.sona.music.point.dto.PointDTO;

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
	
	@RequestMapping(value="/pwFind.go")
	public String pwFind(Model model) {
		logger.info("비밀번호 찾기 페이지 접근");
		
		return "member/pwFind";
	}
	
	@RequestMapping(value="/apply.go")
	public String applyForm(Model model) {
		logger.info("강의신청 페이지 접근");
		
		return "applyForm/applyForm";
	}
	
	@RequestMapping(value="/userdetail.go")
	public String userdetail(Model model) {
		logger.info("회원상세보기 페이지 접근");
		
		return "member/userDetail";
	}
	
	/*로그인*/
	@RequestMapping(value="/login.do")
	public String login(String id, String pw, Model model, HttpSession session) {
		String page = "member/login";
		logger.info("id : {} | pw : {}", id, pw);
		
		
		MemberDTO info = memberService.login(id, pw);
		
		
//		logger.info("loginId : "+ info.getUSER_ID().toString());
		
		if(info != null) {
//			page = "/main/main";
			session.setAttribute("loginId", info.getUSER_ID());	
			session.setAttribute("user_type", info.getUSER_TYPE());	
			session.setAttribute("user_name", info.getUSER_NAME());
			session.setAttribute("manner_variance", info.getMANNER());
			session.setAttribute("point", info.getPOINT());
			
			String test = (String) session.getAttribute("loginId");
			String test1 = String.valueOf(session.getAttribute("point")) ;
			
			logger.info("test : " + test);
			logger.info("test1 : " + test1);
			 // 수강생인 경우
	        if ("수강생".equals(info.getUSER_TYPE())) {
	            page = "/main/main"; // 수강생 메인 페이지로 리다이렉트
	        }
	        // 강사인 경우
	        else if ("강사".equals(info.getUSER_TYPE())) {
	            page = "/main/main"; // 강사 메인 페이지로 리다이렉트
	        }
	        
		}else {
			model.addAttribute("msg","아이디 또는 비밀번호 확인해주세요");
		}
				
		return page;
	
	}
	
	/*중복 체크*/
	@RequestMapping(value="/overlay.do")
	@ResponseBody
	public Map<String, Object> overlay(String id){
		logger.info("id = " + id);
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("use", memberService.overlay(id));
		
		return map;
	}
	
	
	
	
	
    /*회원가입*/
	@RequestMapping(value="/join.do")
	public String join(Model model, @RequestParam Map<String, String> param, HttpSession session) {
		logger.info("회원가입 요청");
		String msg = "회원가입에 실패하였습니다.";
		String page = "member/joinForm";
		
		int row = memberService.join(param);
		logger.info("회원가입 row 반환값: "+ row);
		
		if(row == 1) {
			page = "member/login";
			
				// 회원 가입 후 회원타입이 수강생인 경우
	        if("수강생".equals(param.get("usertype"))) {
	        	
	            page = "applyForm/applyForm";
	        } else if("강사".equals(param.get("usertype"))) {
	            // 회원 가입 후 회원타입이 강사인 경우
	            page = "member/login";
	        }
	        
	        // 회원가입에 성공하면 user_id를 세션에 저장
	        session.setAttribute("user_id", param.get("id"));
	        logger.info("session id: "+ session.getAttribute("user_id"));
	        msg = "회원가입에 성공하였습니다.";
		}
		model.addAttribute("msg",msg);		
		return page;
	}

	/*회원 상세보기*/
	@RequestMapping(value="/classreview.ajax")
	@ResponseBody
	public Map<String , Object> listCall(String page, String cnt, String user_id){
		logger.info("listCall 요청");
		logger.info("받아온 유저 user_id: "+user_id);
		logger.info("페이지당 보여줄 갯수:"+cnt);
		logger.info("요청 페이지: "+page);
		
		
		int currPage = Integer.parseInt(page);
		int pagePerCnt = 5;
		Map<String, Object>map = memberService.classreview(currPage, pagePerCnt, user_id);
		logger.info("map : {}",map);
		
		return map;
	}
	
	@RequestMapping(value="/classreview2.ajax")
	@ResponseBody
	public Map<String , Object> listCall2(String page, String cnt){
		logger.info("listCall 요청");
		logger.info("페이지당 보여줄 갯수:"+cnt);
		logger.info("요청 페이지: "+page);
		
		int currPage = Integer.parseInt(page);
		int pagePerCnt = 5;
		Map<String, Object>map = memberService.classreview2(currPage, pagePerCnt);
		logger.info("map : {}",map);
		
		return map;
	}
	
	
    @RequestMapping(value ="/idFindResult.go", method = RequestMethod.POST)
    public String idFindResult (){
        
        
    	
        return "member/idFindResult";
    }
}
