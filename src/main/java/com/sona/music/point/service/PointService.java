package com.sona.music.point.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sona.music.point.dao.PointDAO;

@Service
public class PointService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired PointDAO pointDAO;
	
}
