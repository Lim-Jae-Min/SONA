package com.sona.music.member.controller;

import java.util.HashMap;
import java.util.List;
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
import com.sona.music.point.service.PointService;

@Controller
public class MemberController {

    Logger logger = LoggerFactory.getLogger(getClass());
    
    @Autowired MemberService memberService;
    @Autowired PointService pointService;
    
    
    @RequestMapping(value ="/findIdEmail.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> findIdEmail (String email){
        logger.info("이메일 받은값 : " + email);
        Map<String,Object> map = new HashMap<String,Object>();
        String checkedEmail = memberService.findIdEmail(email);
        logger.info(checkedEmail+ "ID 찾기 요청으로 DB에서 받아온 이메일 ");
        map.put("checkedEmail",checkedEmail);
        return map;
    }
    
    @RequestMapping(value ="/findPwEmail.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> findPwEmail (String email , String username){
        logger.info("이메일 받은값 : " + email);
        Map<String,Object> map = new HashMap<String,Object>();
        String checkedEmail = memberService.findPwEmail(email,username);
        String checkedId = memberService.findPwcheckId(username);
        logger.info("findPwEmail.do 에서 받은 값 : " + checkedEmail + " : " + checkedId );
        
        logger.info(checkedEmail);
        map.put("checkedEmail",checkedEmail);
        map.put("checkedId", checkedId);
        return map;
    }
    
    @RequestMapping(value ="/pwFindResult.do", method = RequestMethod.POST)
    public String pwFindResult (String username ,String email, Model model){
        
    	logger.info(username);
//    	model.addAttribute("email",email);
    	String findPwResult = memberService.findPw(username,email);
    	logger.info(findPwResult+"비밀번호 찾기에서 받은값");
    	if(findPwResult != null) {
    		model.addAttribute("findPwResult",findPwResult);
    		model.addAttribute("username",username);
   		
    	}
        return "member/pwFindResult";
    }
    
    @RequestMapping(value ="/changePw.go", method = RequestMethod.POST)
    public String changePwSendId (String changePwNeedId, Model model){
        
    	logger.info(changePwNeedId + "비밀번호 변경으로 보내줄 아이디 값");
    	model.addAttribute("changePwNeedId", changePwNeedId);

        return "member/changePw";
    }
    
    @RequestMapping(value ="/changePw.do", method = RequestMethod.POST)
    public String changePw (String changePwNeedId, String newPassword, Model model){
        
    	logger.info(changePwNeedId + "찐 비밀번호 변경에서 받은 아이디");
    	logger.info(newPassword + "찐 비밀번호 변경에서 받은 비밀번호");
    	
    	int row = memberService.changePw(changePwNeedId,newPassword);
//    	model.addAttribute("changePwNeedId", changePwNeedId);

        return "member/login";
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
	        // 포인트 아이디 생성
	        String joinId =param.get("id");
	        pointService.joinCreatePoint(joinId);
	        //
		}
		model.addAttribute("msg",msg);		
		return page;
	}

	/*회원 상세보기*/
	@RequestMapping(value="/classreview.ajax")
	@ResponseBody
	public Map<String , Object> listCall(String page, String cnt){
		logger.info("listCall 요청");
		logger.info("페이지당 보여줄 갯수:"+cnt);
		logger.info("요청 페이지: "+page);
		
		int currPage = Integer.parseInt(page);
		int pagePerCnt = 5;
		Map<String, Object>map = memberService.classreview(currPage,pagePerCnt);
		
		return map;
	}
	
	
	
	
    @RequestMapping(value ="/idFindResult.go", method = RequestMethod.POST)
    public String idFindResult (){
        
        
    	
        return "member/idFindResult";
    }
    
    @RequestMapping(value ="/idFindResult.do", method = RequestMethod.POST)
    public String idFindResult (String email , Model model){
        
    	logger.info(email);
//    	model.addAttribute("email",email);
    	List<String> findIdList = memberService.findId(email);
    	model.addAttribute("findId",findIdList);
        return "member/idFindResult";
    }
    
}
