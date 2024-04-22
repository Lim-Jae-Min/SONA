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
import org.springframework.web.bind.annotation.RequestParam;

import com.sona.music.member.service.ApplyFormService;

@Controller
public class ApplyFormController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ApplyFormService applyFormService;
	
	
	@RequestMapping(value="/apply.do")
	public String apply(Model model, @RequestParam Map<String, String> param, HttpSession session) {
		logger.info("강의신청 요청");
		logger.info("session id: "+ session.getAttribute("user_id"));
		logger.info("param: {}",param);
		String msg = "강의신청에 실패하였습니다.";
		String page = "applyForm/applyForm";
		String seid = (String) session.getAttribute("user_id");
		Map<String, String> param1 = new HashMap<String, String>();
	    param1.put("user_id", seid);
		
		
		int row = applyFormService.apply(param1);
		logger.info("강의신청 row 반환값: "+ row);
		
		if(row == 1) {
			page = "member/login";
	        msg = "강의신청이 완료되었습니다.";
		}
		model.addAttribute("msg",msg);		
		return page;
	}

	
	
	
}
