package com.sona.music.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sona.music.main.service.MainService;

@Controller
public class MainController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MainService mainService;
	
	@RequestMapping(value="/")
	public String main(Model model) {
		logger.info("메인화면 접속");
		
		String user_id = mainService.id();
		
		model.addAttribute("msg", user_id);
		return "member/idFind";
	}
	
	
}
