package com.sona.music.alarm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sona.music.alarm.dao.AlarmDAO;
import com.sona.music.alarm.dto.AlarmDTO;
import com.sona.music.lesson.dto.LessonDTO;

@Service
public class AlarmService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AlarmDAO alarmDAO;

	public Map<String, Object> alarmList(String user_id, int cnt, int currPage) {
		int start = (currPage-1)*cnt;
		logger.info(user_id);
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<AlarmDTO> list = alarmDAO.alarmList(cnt,start,user_id);
		logger.info("list size: "+list.size());
		
		result.put("list", list);
		result.put("currPage",currPage);
		result.put("totalPages", alarmDAO.alarmListAllCount(cnt, user_id));	
		
		for (AlarmDTO r : list) {
			logger.info(r.getAlarm_idx()+"");
			logger.info(r.getAlarm_title() + "");
			logger.info(r.getAlarm_date()+"");
			logger.info(r.getAlarm_views()+"");
		}
		
		
		return result;
	}
	
	public int del(List<String> delList) {
		int cnt = 0;
	    for (String idx : delList) {
	        cnt += alarmDAO.del(idx);
	    }
	    return cnt;
	}

	public int read(List<String> readList) {
		int cnt = 0;
	    for (String idx : readList) {
	        cnt += alarmDAO.alarmViews(idx);
	    }
	    return cnt;
	}

	public void alarmDetail(int idx, Model model) {
		logger.info("상세보기 Service 접속 완료");
		AlarmDTO dto = alarmDAO.alarmDetail(idx);
		model.addAttribute("alarm", dto);
//		
//		logger.info("IDX: " , dto.getAlarm_idx());
//		logger.info("Title: " , dto.getAlarm_title());
//		logger.info("CONTENT: ", dto.getAlarm_content());
//		logger.info("VIEWS : ", dto.getAlarm_views());
//		logger.info("DATE: ", dto.getAlarm_date());
		
		alarmDAO.alarmViews(idx);
	}

	public int detailDel(int alarm_idx) {
		logger.info("상세보기 삭제 Service 접속");
		int cnt = alarmDAO.detailDel(alarm_idx);
		
		return cnt;
	}


	
	
	
}
