package com.sona.music.alarm.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sona.music.alarm.dao.AlarmDAO;

@Service
public class AlarmService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AlarmDAO alarmDAO;
	
}
