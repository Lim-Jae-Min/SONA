package com.sona.music.board.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sona.music.board.dao.QnADAO;

@Service
public class QnAService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired QnADAO qnaDAO;
	
}
