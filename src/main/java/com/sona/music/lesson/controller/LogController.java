package com.sona.music.lesson.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.sona.music.lesson.service.LogService;

@Controller
public class LogController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired LogService logService;
	
}
