package com.sona.music.alarm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sona.music.alarm.dao.AlarmDAO;
import com.sona.music.alarm.dto.AlarmDTO;
import com.sona.music.mypage.dto.MyPageDTO;

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
	        cnt += alarmDAO.dellist(idx);
	    }
	    return cnt;
	}

	private void delFile(List<String> files) {
		
	}
	
	
	
	
}
