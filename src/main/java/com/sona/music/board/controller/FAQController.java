package com.sona.music.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.sona.music.board.service.FAQService;

@Controller
public class FAQController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired FAQService faqService;
	
}
