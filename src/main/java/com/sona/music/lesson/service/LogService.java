package com.sona.music.lesson.service;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sona.music.lesson.dao.LogDAO;
import com.sona.music.lesson.dto.LogDTO;

@Service
public class LogService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired LogDAO logDAO;

	public void lessonLogGo(int apply_idx, Model model) {
		logger.info("강의일지 페이지 이동 controller");
		
		LogDTO lessonInfo = logDAO.lessonInfo(apply_idx);
		model.addAttribute("lessonInfo", lessonInfo);
//		logger.info("lesson name = " + lessonInfo.getClass_name());
//		logger.info("lesson name = " + lessonInfo.getClass_idx());
//		logger.info("lesson name = " + lessonInfo.getStart_date());
		
		List<LogDTO> profileList = logDAO.logProfile(apply_idx);
		LogDTO teacherProfile = profileList.get(0);
		LogDTO studentProfile = profileList.get(1);
		
		model.addAttribute("teacherProfile", teacherProfile);
		model.addAttribute("studentProfile", studentProfile);
		
		List<LogDTO> logList = logDAO.lessonLogList(apply_idx);
		model.addAttribute("logList", logList);
		
	}

	public int lessonLogWrite(Map<String, String> map) {
		
		int apply_idx = Integer.parseInt(map.get("apply_idx"));
		
		LogDTO dto = logDAO.lessonInfo(apply_idx);
		
		int totalTimes = dto.getTotal_times();
		int accumulateTimes = dto.getAccumulate_times();
//		logger.info("apply_idx : " + totalTimes);
//		logger.info("apply_idx : " + accumulateTimes);
		
		dto.setCh_result("수업 완료(" + totalTimes + "/" + accumulateTimes + ")");
		dto.setCh_date(map.get("date"));
		dto.setCh_content(map.get("content"));
		
		int row = logDAO.lessonLogWrite(dto);
		
		return row;
	}

	public int lessonAbsent(Map<String, String> map) {
		logger.info("서비스 도착");
		int apply_idx = Integer.parseInt(map.get("apply_idx"));
		logger.info("apply_idx = " + apply_idx);
		LogDTO dto = logDAO.lessonInfo(apply_idx);
		
		int totalTimes = dto.getTotal_times();
		int accumulateTimes = dto.getAccumulate_times();
//		logger.info("apply_idx : " + totalTimes);
//		logger.info("apply_idx : " + accumulateTimes);
		
		dto.setCh_result("결석(" + totalTimes + "/" + accumulateTimes + ")");
		dto.setCh_content("결석");
		dto.setCh_date(map.get("date"));
		
		int row = logDAO.lessonAbsent(dto);
		
		return row;
	}
	
}
