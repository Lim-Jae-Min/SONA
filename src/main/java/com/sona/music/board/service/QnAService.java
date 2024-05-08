package com.sona.music.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sona.music.board.dao.QnADAO;
import com.sona.music.board.dto.QnADTO;
import com.sona.music.board.dto.ReviewDTO;

@Service
public class QnAService {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired QnADAO qnaDAO;

	public Map<String, Object> list(int currPage, int pagePerCnt, Integer classIdx) {
		int start = (currPage-1)*pagePerCnt;

		Map<String, Object> result = new HashMap<String, Object>();
		List<QnADTO> list = qnaDAO.list(pagePerCnt,start,classIdx);
		logger.info("list size: "+list.size());
		result.put("list", list);
		result.put("currPage",currPage);
		result.put("totalPages", qnaDAO.allCount(pagePerCnt,classIdx));

		logger.info("QnA 리스트 페이지 이동");

		return result;
	}

	public int qwrite(Map<String, String> param) {
		int row = -1;

		QnADTO dto = new QnADTO();
		dto.setClass_idx(Integer.parseInt(param.get("class_idx")));
		dto.setUser_id(param.get("user_id"));
		dto.setQ_title(param.get("q_title"));
		dto.setQ_content(param.get("q_content"));

		//변수에 param 값 스트링으로 저장
		String anonymousStatusStr = param.get("anonymous_status");
		//"true"와 equals 면 true, 아니면 false
		boolean anonymousStatus = "true".equals(anonymousStatusStr);
		dto.setAnonymous_status(anonymousStatus);

		row = qnaDAO.qwrite(dto);

		return row;
	}

	public void detail(Integer question_idx, Model model) {
		logger.info("Q&A 디테일 요청 - 서비스");

		qnaDAO.upHit(question_idx);

		QnADTO dto = qnaDAO.detail(question_idx);
		model.addAttribute("question",dto);
		logger.info(dto.getQ_title());
		logger.info(dto.getTeacher_id());
		logger.info(dto.getQ_content());
		logger.info(String.valueOf(dto.getClass_idx()));
		logger.info(String.valueOf(dto.getQuestion_idx()));

		QnADTO adto = qnaDAO.adetail(question_idx);
		if (adto == null) {
			model.addAttribute("answerMessage", "답변이 아직 작성되지 않았습니다.");
		} else {
			model.addAttribute("answer", adto);
			logger.info(String.valueOf(adto.getAnswer_idx()));
			logger.info(adto.getA_content());
			logger.info(String.valueOf(adto.getQuestion_idx()));
		}

	}

	public int reply(Map<String, String> param) {
		int row = -1;

		logger.info("Q&A 답변 작성 요청 - 서비스");

		QnADTO dto = new QnADTO();
		dto.setQuestion_idx(Integer.parseInt(param.get("question_idx")));
		dto.setUser_id(param.get("user_id"));
		dto.setA_content(param.get("a_content"));

		row = qnaDAO.reply(dto);


		return row;
	}

	public void deleteQuestion(int questionIdx) {
		logger.info("질문 삭제 요청 - service");
		qnaDAO.deleteQuestion(questionIdx);

	}

	public void deleteAnswer(int questionIdx) {
		logger.info("답변 삭제 요청 - service");
		qnaDAO.deleteAnswer(questionIdx);

	}

	public void qnaEdit(Integer question_idx, Model model) {

		QnADTO dto = qnaDAO.detail(question_idx);
		model.addAttribute("question",dto);

	}

	public int update(Map<String, String> param) {
		logger.info("질문 수정 요청 - 서비스");

		// 변수에 param 값 스트링으로 저장
		String anonymousStatusStr = param.get("anonymous_status");
		//"true"와 equals 면 true, 아니면 false
		boolean anonymousStatus = "true".equals(anonymousStatusStr);

		QnADTO dto = new QnADTO();
		dto.setQuestion_idx(Integer.parseInt(param.get("question_idx")));
		dto.setClass_idx(Integer.parseInt(param.get("class_idx")));
		dto.setQ_title(param.get("q_title"));
		dto.setQ_content(param.get("q_content"));
		dto.setAnonymous_status(anonymousStatus);



		int row = qnaDAO.update(dto);

		logger.info("update count"+row);

		return row;
	}

	public void lessonHeaderClass(Integer class_idx, Model model) {
		logger.info("lessonheader - 서비스");
		QnADTO dto = qnaDAO.lessonHeaderClass(class_idx);
		model.addAttribute("lesson",dto);

		String lessonLogo = qnaDAO.lessonLogoLoadClass(class_idx);
		logger.info("lessonLogo : " + lessonLogo);
		model.addAttribute("lessonLogo",lessonLogo);

	}

	public void lessonHeader(Integer question_idx, Model model) {
		logger.info("lessonheader - 서비스");
		QnADTO dto = qnaDAO.lessonHeader(question_idx);
		model.addAttribute("lesson",dto);

		String lessonLogo = qnaDAO.lessonLogoLoad(question_idx);
		logger.info("lessonLogo : " + lessonLogo);
		model.addAttribute("lessonLogo",lessonLogo);

	}





}
