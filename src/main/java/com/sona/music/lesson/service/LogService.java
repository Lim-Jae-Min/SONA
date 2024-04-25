package com.sona.music.lesson.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
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
		if (lessonInfo.getAccumulate_times() != 0) {
			if (logList.get(logList.size() - 1).getCh_result().equals("강의 종료")) {
				String check = "강의 종료";
				
				model.addAttribute("check", check);
			}
			
		}
		
	}

	public int lessonLogWrite(Map<String, String> map) {
		
		int apply_idx = Integer.parseInt(map.get("apply_idx"));
		
		LogDTO dto = logDAO.lessonInfo(apply_idx);
		
		int totalTimes = dto.getTotal_times();
		int accumulateTimes = dto.getAccumulate_times() + 1;
//		logger.info("apply_idx : " + totalTimes);
//		logger.info("apply_idx : " + accumulateTimes);
		
		dto.setCh_result("수업 완료(" + accumulateTimes + "/" + totalTimes + ")");
		dto.setCh_date(map.get("date"));
		dto.setCh_content(map.get("content"));
		
		int row = logDAO.lessonLogWrite(dto);
		
		if (accumulateTimes == totalTimes) {
			logDAO.lessonStop(dto);
		}
		
		return row;
	}

	public int lessonAbsent(Map<String, String> map) {
		logger.info("서비스 도착");
		int apply_idx = Integer.parseInt(map.get("apply_idx"));
		logger.info("apply_idx = " + apply_idx);
		LogDTO dto = logDAO.lessonInfo(apply_idx);
		
		int totalTimes = dto.getTotal_times();
		int accumulateTimes = dto.getAccumulate_times() + 1;
//		logger.info("apply_idx : " + totalTimes);
//		logger.info("apply_idx : " + accumulateTimes);
		
		dto.setCh_result("결석(" + accumulateTimes + "/" + totalTimes + ")");
		dto.setCh_content("결석");
		dto.setCh_date(map.get("date"));
		
		int row = logDAO.lessonAbsent(dto);
		
		return row;
	}

	public int lessonLogEdit(Map<String, String> map) {

		int apply_idx = Integer.parseInt(map.get("apply_idx"));
		
		List<LogDTO> logList = logDAO.lessonLogList(apply_idx);
		LogDTO dto = logDAO.lessonInfo(apply_idx);
		
		int ch_idx = logList.get(Integer.parseInt(map.get("index"))).getCh_idx();
		logger.info("ch_idx = " + ch_idx);
		
		int totalTimes = dto.getTotal_times();
//		logger.info("apply_idx : " + totalTimes);
//		logger.info("apply_idx : " + accumulateTimes);
		
		if (map.get("content").equals("결석")) {
			dto.setCh_result("결석(" + (Integer.parseInt(map.get("index")) + 1) + "/" + totalTimes + ")");
		}else {
			dto.setCh_result("수업 완료(" + (Integer.parseInt(map.get("index")) + 1) + "/" + totalTimes + ")");
		}
		dto.setCh_date(map.get("date"));
		dto.setCh_content(map.get("content"));
		dto.setCh_idx(ch_idx);
		
		int row = logDAO.lessonLogEdit(dto);
		
		return row;
		
	}

	public int lessonStop(Map<String, String> map) {
		int apply_idx = Integer.parseInt(map.get("apply_idx"));
		LogDTO dto = logDAO.lessonInfo(apply_idx);
		
		int row = logDAO.lessonStop(dto);
		
		return row;
	}
	
}
