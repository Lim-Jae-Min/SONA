package com.sona.music.board.dao;

import java.util.List;

import com.sona.music.board.dto.FAQDTO;

public interface FAQDAO {

	int allCount(int pagePerCnt, int deleteStatus, String serachText, int searchType, int categoryNum);

	List<FAQDTO> showListSearch(int start, int pagePerCnt,int deleteStatus, String serachText, int searchType,int categoryNum);

	FAQDTO faqDetailAdmin(int idx);

}
