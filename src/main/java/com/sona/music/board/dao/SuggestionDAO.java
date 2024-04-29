package com.sona.music.board.dao;

import java.util.List;

import com.sona.music.board.dto.SuggestionDTO;

public interface SuggestionDAO {

	List<SuggestionDTO> showListSearch(int start, int pagePerCnt, int deleteStatus, String serachText, int searchType,
			int categoryNum);

	int allCount(int pagePerCnt, int deleteStatus, String serachText, int searchType, int categoryNum);

}
