package com.sona.music.lesson.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sona.music.lesson.dao.LogDAO;

@Service
public class LogService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired LogDAO logDAO;
	
}
