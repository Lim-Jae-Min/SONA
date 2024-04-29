package com.sona.music.main.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sona.music.main.dao.MainDAO;
import com.sona.music.main.dto.MainDTO;

@Service
public class MainService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MainDAO mainDAO;

	public String id() {
		
		return mainDAO.id();
	}

	public String myInst(String loginId) {
		
		String inst = mainDAO.myInst(loginId);
		
		return inst;
	}

	public List<MainDTO> list(String userId) {
		
		List<MainDTO> list = mainDAO.list(userId);
		
		return list;
	}

	public List<MainDTO> nolist() {
		
		List<MainDTO> nolist = mainDAO.nolist();
		
		return nolist;
	}


	public Map<String, Object> videoList(int currPage, int pagePerCnt, String userId) {
		
		int start = (currPage-1)*pagePerCnt;
		
		Map<String, Object> result = new HashMap<String, Object>();
		List<MainDTO> list = mainDAO.videoList(pagePerCnt,start,userId);
		logger.info("list size: "+ list.size());
		result.put("list", list);
		result.put("currPage", currPage);
		result.put("totalPages", mainDAO.allCount(pagePerCnt,userId));
		
		logger.info("추천 영상 리스트 페이지 이동");
		
		return result;
	}

	public Map<String, Object> videoAllList(int currPage, int pagePerCnt) {
		
		int start = (currPage-1)*pagePerCnt;
		Map<String, Object> result = new HashMap<String, Object>();
		List<MainDTO> list = mainDAO.videoAllList(pagePerCnt,start);
		logger.info("list size: "+ list.size());
		result.put("list", list);
		result.put("currPage", currPage);
		result.put("totalPages", mainDAO.allCount1(pagePerCnt));
		
		logger.info("추천 영상 리스트 페이지 이동");
		
		return result;
		
	}
	
	
	
}
