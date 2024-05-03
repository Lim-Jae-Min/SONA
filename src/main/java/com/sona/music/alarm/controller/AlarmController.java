package com.sona.music.alarm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sona.music.alarm.service.AlarmService;

@Controller
public class AlarmController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AlarmService alarmService;
	/*알림 리스트로 이동*/
	@RequestMapping(value="/alarmList.go")
	public String alarmList(HttpSession session) {
		logger.info("알림 리스트로 이동!~~~~~~~~~~~");
		String page = "member/login";
		
		if (session.getAttribute("loginId") != null) {
			page = "alarm/alarmList";
		}
		
		return page;
	}
	
	/*알림 리스트 아작스 요청*/
	@RequestMapping(value="/alarmList.ajax")
	@ResponseBody	
	public Map<String, Object> alarmList(String page, int cnt, HttpSession session){
		logger.info("알림 리스트 아작스 요청!!!!!!!!!!!!!!!!!!!!!!!");
		String user_id = (String) session.getAttribute("loginId");
		logger.info("받아온 유저 user_id: "+ user_id);
				
		int currPage = Integer.parseInt(page);
		Map<String, Object>map = alarmService.alarmList(user_id, cnt, currPage);
		logger.info("map : {}",map);
				
		return map;
	}
	
	// 배열 형태로 들어올 경우 따로 명시를 해줘야 한다.
	@RequestMapping(value="/del.ajax", method=RequestMethod.POST)
	@ResponseBody // response 객체로 반환
	public Map<String, Object> del(@RequestParam(value="delList[]") List<String> delList) {
		logger.info("삭제 요청!!!!!!!!!!!!!!!!!!!!!!!");
		logger.info("del List : {}",delList);

		int cnt = alarmService.del(delList);
		logger.info("del count :"+cnt);
			
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cnt", cnt);
			
		return map; //json 과 가장 닮은 map으로 반환
	}


	@RequestMapping(value="/read.ajax", method=RequestMethod.POST)
	@ResponseBody // response 객체로 반환
	public Map<String, Object> read(@RequestParam(value="readList[]") List<String> readList) {
		logger.info("읽음 요청!!!!!!!!!!!!!!!!!!!!!!!");
		logger.info("del List : {}",readList);
		
		
		int cnt = alarmService.read(readList);
		logger.info("del count :"+cnt);
					
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cnt", cnt);
					
		return map; 
	}
			
			
	
	/*알림 상세보기로 이동*/
	@RequestMapping(value="/alarmDetail.go")
	public String alarmDetail(Model model ,String alarm_idx, HttpSession session) {
		logger.info("알림 상세보기로 이동!!!!!!!!!!!!!!!!!!!!!!!");
		String page = "member/login";
		int idx = Integer.parseInt(alarm_idx);
		if (session.getAttribute("loginId") != null) {
		alarmService.alarmDetail(idx, model);	
			
			page = "alarm/alarmDetail";
		}
		
		return page;
	}
	
	
	@RequestMapping(value="/detailDel.ajax", method=RequestMethod.POST)
	@ResponseBody // response 객체로 반환
	public int detailDel(int alarm_idx) {
		logger.info("상세보기에서 삭제 요청!!!!!!!!!!!!!!!!!!!!!!!");
		logger.info("삭제할 IDX: "+alarm_idx);
		
		int cnt = alarmService.detailDel(alarm_idx);
		logger.info("cnt: "+ cnt);
			
		return cnt; //json 과 가장 닮은 map으로 반환
	}
	
	
}
