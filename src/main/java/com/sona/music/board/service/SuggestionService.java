package com.sona.music.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sona.music.board.dao.SuggestionDAO;
import com.sona.music.board.dto.SuggestionDTO;

@Service
public class SuggestionService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired SuggestionDAO suggestionDAO;
	
	

}
