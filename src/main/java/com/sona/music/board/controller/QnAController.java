package com.sona.music.board.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sona.music.board.dto.QnADTO;
import com.sona.music.board.service.QnAService;

@Controller
public class QnAController {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired QnAService qnaService;


	@RequestMapping(value="/lessonQnAList.go")
	public String qnalist(Integer class_idx, Model model, HttpSession session) {
		logger.info("idx="+class_idx+"QnA 리스트 요청");

		String page = "redirect:/login.go";

		if (session.getAttribute("loginId")!=null) {
			qnaService.lessonHeaderClass(class_idx, model);
			model.addAttribute("classIdx", class_idx);
			page = "lesson/lessonQnAList";
		}
		return page;
	}


	@RequestMapping(value="/qnalist.ajax")
	@ResponseBody
	public Map<String , Object> listCall(String page, @RequestParam(value="classIdx") Integer classIdx, @RequestParam(value="cnt", defaultValue = "5") String cnt){
		logger.info("listCall 요청");
		logger.info("페이지당 보여줄 갯수:"+cnt);
		logger.info("요청 페이지: "+page);
		logger.info("classIDx{}",classIdx);
		int currPage = Integer.parseInt(page);
		int pagePerCnt = Integer.parseInt(cnt);
		Map<String, Object>map = qnaService.list(currPage,pagePerCnt,classIdx);

		return map;
	}


	@RequestMapping(value="/lessonQnAWrite.go")
	public String qnaWrite(Integer class_idx, Model model, HttpSession session) {
		logger.info("강의IDX"+class_idx+"QnA 작성 요청");

		qnaService.lessonHeaderClass(class_idx, model);
		model.addAttribute("class_idx", class_idx);

		return "lesson/lessonQnAWrite";
	}

	@RequestMapping(value="/qWrite.do", method = RequestMethod.POST)
	public String qwrite(Integer class_idx, HttpSession session, @RequestParam Map<String,String>param) {
		logger.info("리뷰 작성함");
		logger.info("params = {}", param);
		String page = "redirect:/lessonQnAList.go?class_idx="+ class_idx;
		if (session.getAttribute("loginId")!=null) {
			int row = qnaService.qwrite(param);
			if(row<1) {
				page = "lesson/lessonQnAWrite.go?class_idx="+ class_idx;
			}
		}
		return page;
	}

	@RequestMapping(value="/lessonQnADetail.go")
	public String qnaDetail(Integer question_idx, Model model) {
		logger.info("idx="+question_idx+" Q&A 디테일 요청");

		qnaService.detail(question_idx, model);
		qnaService.lessonHeader(question_idx, model);



		return "lesson/lessonQnADetail";
	}

	@RequestMapping(value="/lessonQnAReply.do")
	public String qnaReply(Integer question_idx, Model model) {
		logger.info("질문 idx ="+question_idx+" Q&A 답변 작성 요청");

		qnaService.detail(question_idx, model);
		qnaService.lessonHeader(question_idx, model);

		return "lesson/lessonQnAReply";
	}

	@RequestMapping(value="/aWrite.do")
	public String aWrite(@RequestParam Map<String, String> param, HttpSession session) {
		logger.info("질문 idx ="+param.get("question_idx")+" Q&A 답변 작성 요청");
		logger.info(param.get("class_idx"));
		int class_idx =Integer.parseInt(param.get("class_idx"));
		int question_idx = Integer.parseInt(param.get("question_idx"));

		String page = "redirect:/lessonQnAList.go?class_idx="+ class_idx;
		if(session.getAttribute("loginId")!=null) {
			int row = qnaService.reply(param);

			if(row<1) {
				page = "lesson/lessonQnAReply.do?question_idx="+ question_idx;
			}

		}


		return page;
	}



	@RequestMapping(value = "/deleteQuestion.ajax")
	public String deleteQuestion(@RequestParam("questionIdx") int questionIdx) {
		logger.info(questionIdx+"질문 삭제 요청 - 컨트롤러");

		qnaService.deleteQuestion(questionIdx);


		return "redirect:/lessonReviewList";
	}

	@RequestMapping(value = "/deleteAnswer.ajax")
	public String deleteAnswer(@RequestParam("questionIdx") int questionIdx) {
		logger.info(questionIdx+"답변 삭제 요청 - 컨트롤러");

		qnaService.deleteAnswer(questionIdx);


		return "redirect:/lessonReviewList";
	}

	@RequestMapping(value = "/deleteAllQnA.ajax")
	public String deleteAllQnA(@RequestParam("questionIdx") int questionIdx) {
		logger.info(questionIdx+"질문 삭제 요청 - 컨트롤러");

		qnaService.deleteQuestion(questionIdx);
		qnaService.deleteAnswer(questionIdx);

		return "redirect:/lessonReviewList";
	}

	@RequestMapping(value = "/lessonQnAEdit.go")
	public String qnaEdit(Integer question_idx, Model model) {
		logger.info(question_idx+"질문 수정 요청 - 컨트롤러");

		qnaService.qnaEdit(question_idx,model);
		qnaService.lessonHeader(question_idx, model);

		return "lesson/lessonQnAEdit";
	}

	@RequestMapping(value="/questionEdit.do")
	public String questionEdit(@RequestParam Map<String, String> param, HttpSession session) {
		logger.info(param.get("question_idx")+"질문 수정함");
		int class_idx =Integer.parseInt(param.get("class_idx"));
		String page = "redirect:/lessonQnAList.go?class_idx="+ param.get("class_idx");

		if(session.getAttribute("loginId")!= null) {

			qnaService.update(param);

			page = "redirect:/lessonQnAList.go?class_idx="+class_idx;			
		}

		return page;

	}

}
