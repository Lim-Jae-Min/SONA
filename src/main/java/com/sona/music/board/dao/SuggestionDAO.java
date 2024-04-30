package com.sona.music.board.dao;

import java.util.List;

import com.sona.music.board.dto.PhotoDTO;
import com.sona.music.board.dto.SuggestionDTO;

public interface SuggestionDAO {


	List<SuggestionDTO> suggestionsListCall(int pagePerCnt, int start, String condition, String searchContent);

	Object suggestionsListCount(int pagePerCnt, String condition, String searchContent);

	void suggestionsViewUp(String sug_idx);

	SuggestionDTO suggestionsDetailGo(String sug_idx);

	List<PhotoDTO> suggestionsDetailPhotos(String sug_idx);
}
