package com.sona.music.main.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sona.music.main.dao.MainDAO;

@Service
public class MainService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MainDAO mainDAO;

	public String id() {
		
		return mainDAO.id();
	}

	public String myInst(String loginId) {
		
		String inst = mainDAO.myInst(loginId);
		
		return inst;
	}
	
	
	
}
