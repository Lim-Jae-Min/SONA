package com.sona.music.member.dao;

import com.sona.music.member.dto.MemberDTO;

public interface MemberDAO {

	MemberDTO login(String id, String pw);

}
