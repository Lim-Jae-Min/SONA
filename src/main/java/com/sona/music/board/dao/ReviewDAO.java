package com.sona.music.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.sona.music.board.dto.PhotoDTO;
import com.sona.music.board.dto.ReviewDTO;

public interface ReviewDAO {
	
	int allCount(int pagePerCnt);

	List<ReviewDTO> list(int pagePerCnt, int start, Integer classIdx);

	int write(ReviewDTO dto);

	void fileWrite(String fileName, String newFileName, int idx, String username, String photoCategory);

	void deleteReview(Integer reviewIdx);

	int update(Map<String, String> param);

	void photoEdit(String postIdx, String photoCategory);

	ReviewDTO detail(int review_idx);

	List<PhotoDTO> photos(int post_idx, String photo_category);

	void manner(ReviewDTO dto);

	ReviewDTO lessonHeader(Integer review_idx);

	String lessonLogoLoad(Integer review_idx);

	ReviewDTO lessonHeaderClass(Integer class_idx);

	String lessonLogoLoadClass(Integer class_idx);


	

}
