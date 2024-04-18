package com.sona.music.admin.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sona.music.admin.dao.AdminDAO;

@Service
public class AdminService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AdminDAO reportDAO;
	
}
