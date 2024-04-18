package com.sona.music.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.sona.music.admin.service.AdminService;

@Controller
public class AdminController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AdminService adminService;
	
}
