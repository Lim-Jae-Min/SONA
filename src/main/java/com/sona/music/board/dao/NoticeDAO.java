package com.sona.music.board.dao;

import java.util.List;

import com.sona.music.board.dto.NoticeDTO;

public interface NoticeDAO {

	List<NoticeDTO> showList(int start,int pagePerCnt,int deleteStatus);

	int allCount(int pagePerCnt);

	List<NoticeDTO> showListSearch(int start, int pagePerCnt, int deleteStatus, String searchType, String serachText);

	List<NoticeDTO> showListSearchContent(int start, int pagePerCnt, int deleteStatus,
			String serachText);

	List<NoticeDTO> showListSearchTitle(int start, int pagePerCnt, int deleteStatus,
			String serachText);

}
