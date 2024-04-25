package com.sona.music.main.dao;

import java.util.List;

import com.sona.music.main.dto.MainDTO;

public interface MainDAO {

	String id();

	String myInst(String loginId);

	List<MainDTO> list(String userId);

}
