package com.sona.music.member.dao;

import java.util.List;

import com.sona.music.member.dto.MemberDTO;

public interface MemberDAO {

	String findIdEmail(String email);
	
	MemberDTO login(String id, String pw);

	List<String> findId(String email);

	String findPw(String username, String email);

	String findPwcheckId(String username);
	
	String findPwEmail(String email, String username);


}
