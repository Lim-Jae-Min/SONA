package com.sona.music.board.dao;

import java.util.List;
import java.util.Map;

import com.sona.music.board.dto.PhotoDTO;
import com.sona.music.board.dto.ReviewDTO;

public interface ReviewDAO {
	
	int allCount(int pagePerCnt);

	List<ReviewDTO> list(int pagePerCnt, int start);

	int write(ReviewDTO dto);

	void fileWrite(String fileName, String newFileName, int idx, String username, String photoCategory);

	ReviewDTO detail(int rEVIEW_IDX);

	List<PhotoDTO> photos(int pOST_IDX, String pHOTO_CATEGORY);

	void deleteReview(Integer reviewIdx);

	int update(Map<String, String> param);

	void photoEdit(String postIdx, String photoCategory);


	

}
