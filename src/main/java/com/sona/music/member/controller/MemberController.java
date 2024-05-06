package com.sona.music.member.controller;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

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

import com.sona.music.admin.dto.AdminDTO;
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
        if(checkedEmail !=null) {
        	
        	map.put("checkedEmail",checkedEmail);
        	Random random = new Random();
        	int randomNumber = random.nextInt(9000) + 1000; 
        	String certificationNumber = String.valueOf(randomNumber);
        	map.put("certificationNumber", certificationNumber);
        	String ctfNum = certificationNumber + "";
        	logger.info("인증번호" + ctfNum);
        }
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
        if(checkedId != null) {
        	map.put("checkedId", checkedId);
        	
        	if(checkedEmail != null) {
        		map.put("checkedEmail",checkedEmail);
        		Random random = new Random();
        		int randomNumber = random.nextInt(9000) + 1000;
        		String certificationNumber = String.valueOf(randomNumber);
        		logger.info("인증번호" + certificationNumber);
        		map.put("certificationNumber", certificationNumber);
        		
        	}
        }
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
    	String msg = "비밀번호 변경에 실패했습니다.";
    	int row = memberService.changePw(changePwNeedId,newPassword);
    	logger.info("비밀번호 성공여부 : "+row);
//    	if(row ==1) {
//    		logger.info("비밀번호 변경 성공");
//    		msg = "비밀번호 변경에 성공 했습니다.";
//    	}
//    	model.addAttribute("result",row);
//    	model.addAttribute("msg",msg);
//    	model.addAttribute("changePwNeedId", changePwNeedId);

        return "member/changePw";
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
	public String applyForm(Model model, HttpSession session) {
		logger.info("강의신청 페이지 접근");
		logger.info("session ID: "+session.getAttribute("loginId"));
		
		return "applyForm/applyForm";
	}
	
	/*회원 상세보기*/
	@RequestMapping(value="/userDetail.go")
	public String userdetail(Model model, HttpSession session, String user_id) {
		logger.info("회원상세보기 페이지 접근");
		
		String loginId = (String) session.getAttribute("loginId");
		
		memberService.userdetail(user_id, loginId, model);
		return "member/userDetail";
	}
	
	/* 로그인 */
	@RequestMapping(value="/login.do")
	public String login(String id, String pw, Model model, HttpSession session) {
	    String page = "member/login";
	    logger.info("id : {} | pw : {}", id, pw);
	    
	    AdminDTO adminInfo = memberService.adminLogin(id, pw);
	    MemberDTO info = memberService.userLogin(id, pw);
	    
	    if (adminInfo != null) {
	        session.setAttribute("loginId", adminInfo.getAdmin_id());
	        session.setAttribute("user_type", "관리자");
	        
	        page = "redirect:/adminMain.go";
	    } else if (info != null) {
	        // 정지된 유저 정보 가져오기
	        AdminDTO suspension = memberService.suspension(id);
	        
	        if (suspension != null) {
	            LocalDate releaseDate = suspension.getRelease_date();
	            LocalDate currentDate = LocalDate.now();
	            
	            if (releaseDate != null && currentDate.isBefore(releaseDate)) {
	                // 정지 해제 날짜가 오늘 날짜 이전이면 로그인 제한
	                model.addAttribute("msg", "계정이 정지되었습니다. 정지 해제 날짜까지 로그인이 제한됩니다.");
	                return page;
	            }
	        }
	        
	        // 로그인 허용
	        session.setAttribute("loginId", info.getUser_id());   
	        session.setAttribute("user_type", info.getUser_type());   
	        session.setAttribute("user_name", info.getUser_name());
	        session.setAttribute("manner_variance", info.getManner());
	        session.setAttribute("point", info.getPoint());
	        session.setAttribute("alarm_count", info.getAlarm_count());
	        
	        // 수강생 또는 강사인 경우 각각의 페이지로 리다이렉트
	        if ("수강생".equals(info.getUser_type())) {
	            page = "redirect:/"; // 수강생 메인 페이지로 리다이렉트
	        } else if ("강사".equals(info.getUser_type())) {
	            page = "redirect:/"; // 강사 메인 페이지로 리다이렉트
	        }
	    } else {
	        model.addAttribute("msg", "아이디 또는 비밀번호 확인해주세요");
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
	        if("수강생".equals(param.get("user_type"))) {
	        	
	            page = "applyForm/applyForm";
	        } else if("강사".equals(param.get("user_type"))) {
	            // 회원 가입 후 회원타입이 강사인 경우
	            page = "member/login";
	        }
	        
	        // 회원가입에 성공하면 user_id를 세션에 저장
	        session.setAttribute("user_id", param.get("user_id"));
	        logger.info("session id: "+ session.getAttribute("user_id"));
	        msg = "회원가입에 성공하였습니다.";
	        // 포인트 아이디 생성
	        String joinId =param.get("user_id");
	        pointService.joinCreatePoint(joinId);
	        //
		}
		model.addAttribute("msg",msg);		
		return page;
	}

	/*회원 상세보기*/
	@RequestMapping(value="/userLessonList.ajax")
	@ResponseBody
	public Map<String , Object> listCall(String page, String cnt, String user_id){
//		logger.info("listCall 요청");
//		logger.info("받아온 유저 user_id: "+user_id);
//		logger.info("페이지당 보여줄 갯수:"+cnt);
//		logger.info("요청 페이지: "+page); 
//		
		
		int currPage = Integer.parseInt(page);
		int pagePerCnt = 5;
		Map<String, Object>map = memberService.userLessonList(currPage, pagePerCnt, user_id);
		logger.info("map : {}",map);
		
		return map;
	}
	
	@RequestMapping(value="/userReviewList.ajax")
	@ResponseBody
	public Map<String , Object> listCall2(String page, String cnt, String user_id){
		logger.info("listCall 요청");
		logger.info("받아온 유저 user_id: "+user_id);
		logger.info("페이지당 보여줄 갯수:"+cnt);
		logger.info("요청 페이지: "+page);
		
		int currPage = Integer.parseInt(page);
		int pagePerCnt = 5;
		Map<String, Object>map = memberService.userReviewList(currPage, pagePerCnt, user_id);
		logger.info("map : {}",map);
		
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
    
    @RequestMapping(value="/logout.do")
    public String logoutDo(HttpSession session) {
    	
    	session.removeAttribute("loginId");	
		session.removeAttribute("user_type");	
		session.removeAttribute("user_name");
		session.removeAttribute("manner_variance");
		session.removeAttribute("point");
		session.removeAttribute("alarm_count");
    	
    	return "redirect:/";
    }
    
    @RequestMapping(value="/favorite.ajax")
    @ResponseBody
    public Map<String, Object> favorite (String loginId, String teacher_id) {
    	Map<String, Object> map = memberService.favorite(loginId, teacher_id);
    	return map;
    }
    
    @RequestMapping(value="/unFavorite.ajax")
    @ResponseBody
    public Map<String, Object> unFavorite (String loginId, String teacher_id) {
    	Map<String, Object> map = memberService.unFavorite(loginId, teacher_id);
    	return map;
    }
    
    @RequestMapping(value="/block.ajax")
    @ResponseBody
    public Map<String, Object> block (String loginId, String teacher_id) {
    	Map<String, Object> map = memberService.block(loginId, teacher_id);
    	return map;
    }
    
    
}
