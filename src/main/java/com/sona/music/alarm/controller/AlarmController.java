package com.sona.music.alarm.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.sona.music.alarm.service.AlarmService;

@Controller
public class AlarmController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AlarmService alarmService;
	
	
}
