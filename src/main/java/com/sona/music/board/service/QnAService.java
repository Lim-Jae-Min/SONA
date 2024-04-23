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
		result.put("totalPages", qnaDAO.allCount(pagePerCnt));
		
		logger.info("QnA 리스트 페이지 이동");
		
		return result;
	}

	public int qwrite(Map<String, String> param) {
		int row = -1;
		
		QnADTO dto = new QnADTO();
		dto.setCLASS_IDX(Integer.parseInt(param.get("CLASS_IDX")));
		dto.setUSER_ID(param.get("USER_ID"));
		dto.setQ_TITLE(param.get("Q_TITLE"));
		dto.setQ_CONTENT(param.get("Q_CONTENT"));
		
		//변수에 param 값 스트링으로 저장
		String anonymousStatusStr = param.get("ANONYMOUS_STATUS");
		//"true"와 equals 면 true, 아니면 false
		boolean anonymousStatus = "true".equals(anonymousStatusStr);
		dto.setANONYMOUS_STATUS(anonymousStatus);
		
		row = qnaDAO.qwrite(dto);
		
		return row;
	}

	public void detail(Integer QUESTION_IDX, Model model) {
		logger.info("Q&A 디테일 요청 - 서비스");
		
		qnaDAO.upHit(QUESTION_IDX);
		
		QnADTO dto = qnaDAO.detail(QUESTION_IDX);
		model.addAttribute("question",dto);
		logger.info(dto.getQ_TITLE());
		logger.info(dto.getTEACHER_ID());
		logger.info(dto.getQ_CONTENT());
		logger.info(String.valueOf(dto.getCLASS_IDX()));
		logger.info(String.valueOf(dto.getQUESTION_IDX()));
		
		QnADTO adto = qnaDAO.adetail(QUESTION_IDX);
		if (adto == null) {
		    model.addAttribute("answerMessage", "답변이 아직 작성되지 않았습니다.");
		} else {
		    model.addAttribute("answer", adto);
		    logger.info(String.valueOf(adto.getANSWER_IDX()));
		    logger.info(adto.getA_CONTENT());
		    logger.info(String.valueOf(adto.getQUESTION_IDX()));
		}
		
	}

	public int reply(Map<String, String> param) {
		int row = -1;
		
		logger.info("Q&A 답변 작성 요청 - 서비스");
		
		QnADTO dto = new QnADTO();
		dto.setQUESTION_IDX(Integer.parseInt(param.get("QUESTION_IDX")));
		dto.setUSER_ID(param.get("USER_ID"));
		dto.setA_CONTENT(param.get("A_CONTENT"));
		
		row = qnaDAO.reply(dto);
		
		
		return row;
	}
	
}
