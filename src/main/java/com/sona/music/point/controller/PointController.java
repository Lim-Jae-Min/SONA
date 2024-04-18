package com.sona.music.point.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.sona.music.point.service.PointService;

@Controller
public class PointController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired PointService pointService;
	
}
