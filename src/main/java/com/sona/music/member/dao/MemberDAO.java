package com.sona.music.member.dao;

import java.util.Map;

import com.sona.music.member.dto.MemberDTO;

public interface MemberDAO {

	String findIdEmail(String email);
	
	MemberDTO login(String id, String pw);

	String session(String email);

	Object overlay(String id);

	int join(Map<String, String> param);

}
