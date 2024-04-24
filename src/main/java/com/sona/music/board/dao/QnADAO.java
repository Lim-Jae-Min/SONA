package com.sona.music.board.dao;

import java.util.List;
import java.util.Map;

import com.sona.music.board.dto.QnADTO;

public interface QnADAO {

	int allCount(int pagePerCnt);

	int qwrite(QnADTO dto);

	List<QnADTO> list(int pagePerCnt, int start, Integer classIdx);







	int reply(QnADTO dto);

	void deleteQuestion(int questionIdx);

	void upHit(Integer question_idx);

	QnADTO detail(Integer question_idx);

	QnADTO adetail(Integer question_idx);

	void deleteAnswer(int questionIdx);

	int update(QnADTO dto);



}
