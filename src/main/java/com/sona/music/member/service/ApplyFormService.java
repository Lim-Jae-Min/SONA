package com.sona.music.member.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sona.music.member.dao.ApplyFormDAO;

@Service
public class ApplyFormService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ApplyFormDAO applyFormDAO;

	public int apply(Map<String, String> param) {
		logger.info("강의신청 param 값: " + param);
		int row = applyFormDAO.apply(param);
		logger.info("row: " + row);
		return row;
	}
	
}
