package com.sona.music.member.dao;


import java.util.List;

import java.util.Map;

import com.sona.music.board.dto.ReviewDTO;
import com.sona.music.member.dto.MemberDTO;

public interface MemberDAO {

	String findIdEmail(String email);
	
	MemberDTO login(String id, String pw);

	List<String> findId(String email);

	String findPw(String username, String email);

	String findPwcheckId(String username);
	
	String findPwEmail(String email, String username);

	int changePw(String changePwNeedId, String newPassword);

	Object overlay(String id);

	int join(Map<String, String> param);

	List<MemberDTO> list(String user_id, int pagePerCnt, int start);

	int allCount(int pagePerCnt);

	Object detail(String user_id);

	List<ReviewDTO> list2(String user_id, int pagePerCnt, int start);

}
