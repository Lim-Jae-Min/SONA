package com.sona.music.main.dao;

import java.util.List;

import com.sona.music.main.dto.MainDTO;

public interface MainDAO {

	String id();

	String myInst(String loginId);

	List<MainDTO> list(String userId);

	List<MainDTO> nolist();

	List<MainDTO> videoList(int pagePerCnt, int start, String userId);

	int allCount(int pagePerCnt, String userId);

	List<MainDTO> videoAllList(int pagePerCnt, int start);

	int allCount1(int pagePerCnt);

}
