package com.sona.music.member.dao;


import java.util.List;

import java.util.Map;

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

	List<MemberDTO> list(int pagePerCnt, int start);

	Object allCount(int pagePerCnt);

}
