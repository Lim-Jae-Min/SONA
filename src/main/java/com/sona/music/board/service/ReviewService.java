package com.sona.music.board.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sona.music.board.dao.ReviewDAO;

@Service
public class ReviewService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ReviewDAO reviewDAO;
	
}
