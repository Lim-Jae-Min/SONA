package com.sona.music.member.dao;


import java.util.List;

import java.util.Map;

import com.sona.music.admin.dto.AdminDTO;
import com.sona.music.board.dto.ReviewDTO;
import com.sona.music.member.dto.MemberDTO;

public interface MemberDAO {

	String findIdEmail(String email);
	
	MemberDTO userLogin(String id, String pw);

	List<String> findId(String email);

	String findPw(String username, String email);

	String findPwcheckId(String username);
	
	String findPwEmail(String email, String username);

	int changePw(String changePwNeedId, String newPassword);

	Object overlay(String id);

	List<MemberDTO> userLessonList(String user_id, int pagePerCnt, int start);

	int userReviewCount(int pagePerCnt, String user_id);


	List<ReviewDTO> userReviewList(String user_id, int pagePerCnt, int start);

	MemberDTO detail(String user_id);

	int join(MemberDTO dto);

	AdminDTO adminLogin(String id, String pw);

	Object userLessonCount(int pagePerCnt, String user_id);

	MemberDTO myTeacher(String user_id, String loginId);


}
