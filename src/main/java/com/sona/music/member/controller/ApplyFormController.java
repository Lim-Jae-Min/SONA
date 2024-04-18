package com.sona.music.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.sona.music.member.service.ApplyFormService;

@Controller
public class ApplyFormController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ApplyFormService applyFormService;
	
}
