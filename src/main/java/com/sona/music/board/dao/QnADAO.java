package com.sona.music.board.dao;

import java.util.List;

import com.sona.music.board.dto.QnADTO;

public interface QnADAO {

	int allCount(int pagePerCnt);

	int qwrite(QnADTO dto);

	List<QnADTO> list(int pagePerCnt, int start, Integer classIdx);

}
