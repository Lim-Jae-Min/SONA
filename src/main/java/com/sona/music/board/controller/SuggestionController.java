package com.sona.music.board.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sona.music.board.service.SuggestionService;

@Controller
public class SuggestionController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired SuggestionService suggestionService;
	
	

	
}
