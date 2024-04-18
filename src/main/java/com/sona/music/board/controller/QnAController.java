package com.sona.music.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.sona.music.board.service.QnAService;

@Controller
public class QnAController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired QnAService qnaService;
	
}
