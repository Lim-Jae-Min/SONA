package com.sona.music.admin.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sona.music.admin.dto.AdminDTO;
import com.sona.music.admin.service.AdminService;
import com.sona.music.board.service.FAQService;
import com.sona.music.board.service.NoticeService;
import com.sona.music.board.service.ReviewService;
import com.sona.music.board.service.SuggestionService;

@Controller
public class AdminController {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	AdminService adminService;
	@Autowired
	NoticeService noticeService;
	@Autowired FAQService faqService;
	@Autowired ReviewService reviewService;
	@Autowired SuggestionService suggestionService;

	@RequestMapping(value="adminMain.go")
	public String adminMainGo(HttpSession session, Model model) {
//		String page = "main/main";
		String page = "adminPage/adminMain";
		
		String user_type = (String) session.getAttribute("user_type");
		
		adminService.adminMainGO(model);
		
//		if (user_type.equals("관리자")) {
//			page = "adminPage/adminMain";
//		}
		
    	return page;
	}
	
	@RequestMapping(value="/adminMain.ajax")
	@ResponseBody
	public Map<String, Object> adminMainAjax() {
		
		Map<String, Object> map = adminService.adminMainAjax();
		
		return map;
	}
	
	@RequestMapping(value="adminUserList.go")
	public String adminUserListGo(HttpSession session) {
//		String page = "main/main";
		String page = "adminPage/adminUserList";
		
		String user_type = (String) session.getAttribute("user_type");
		
		
//		if (user_type.equals("관리자")) {
//			page = "adminPage/adminUserList";
//		}
		
    	return page;
		
	}
	
	@RequestMapping(value="/adminUserList.ajax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> adminUserListCall(String page, String condition, String searchContent) {
		
		int currPage = Integer.parseInt(page);
		int pagePerCnt = 10;
		
		Map<String, Object> map = adminService.adminUserListCall(currPage, pagePerCnt, condition, searchContent);
		
		return map;
	}
	
	@RequestMapping(value="/adminUserDetail.go")
	public String adminUserDetailGo(String user_id, HttpSession session, Model model) {
//		String page = "main/main";
		String page = "adminPage/adminUserDetail";
		
		String user_type = (String) session.getAttribute("user_type");
		
		adminService.adminUserDetailGo(user_id, model);
		
//		if (user_type.equals("관리자")) {
//			page = "adminPage/adminUserList";
//		}
		
    	return page;
	}
	
	@RequestMapping(value="/adminLessonList.go")
	public String adminLessonListGo(HttpSession session) {
//		String page = "main/main";
		String page = "adminPage/adminLessonList";
		
		String user_type = (String) session.getAttribute("user_type");
		
		
//		if (user_type.equals("관리자")) {
//			page = "adminPage/adminUserList";
//		}
		
    	return page;
		
	}
	
	@RequestMapping(value="/adminLessonList.ajax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> adminLessonListCall(String page, String condition, String searchContent) {
		
		int currPage = Integer.parseInt(page);
		int pagePerCnt = 10;
		
		Map<String, Object> map = adminService.adminLessonListCall(currPage, pagePerCnt, condition, searchContent);
		
		return map;
	}
	
	@RequestMapping(value="adminLogout.do")
	public String adminLogout(HttpSession session) {
		
		session.removeAttribute("loginId");
		session.removeAttribute("user_type");
    	
    	return "redirect:/";
	}
	
	
	@RequestMapping(value = "/adminNoticeList.go")
	public String adminNoticeListGo() {

		return "adminPage/adminNoticeList";
	}
	
	@RequestMapping(value = "adminNoticeList.ajax")
	@ResponseBody
	public Map<String, Object> adminNoticeList(int page , int searchType, String serachText, int delType) {
		logger.info("noticeManagementlist 요청");
		logger.info("요청페이지 : " + page);
		logger.info("공지사항 검색에서 가져온 text : "+serachText);
		logger.info("공지사항 검색에서 가져온 type : "+searchType);
		logger.info("공지사항 검색에서 가져온 delType : "+delType);
		Map<String, Object> map = null;
		int currPage = page;
			
			map = adminService.adminNoticeShowListSearch(currPage,searchType,serachText,delType);	
		
		
		return map;
	}

	@RequestMapping(value = "/noticeDetailAdmin.go")
	public String noticeDetailAdminGo(int idx, Model model) {
		noticeService.noticeDetailAdmin(idx, model);

		return "adminPage/adminNoticeDetail";
	}
	
	@RequestMapping(value = "/noticeEditAdmin.go")
	public String noticeEditAdminGo(int idx, Model model) {
		noticeService.noticeDetailAdmin(idx, model);

		return "adminPage/adminNoticeEdit";
	}
	
	@RequestMapping(value = "/faqDetailAdmin.go")
	public String faqDetailAdminGo(int idx, Model model) {
		faqService.faqDetailAdmin(idx, model);

		return "adminPage/adminFaqDetail";
	}
	
	@RequestMapping(value = "/faqEditAdmin.go")
	public String faqEditAdminGo(int idx, Model model) {
		faqService.faqDetailAdmin(idx, model);

		return "adminPage/adminFaqEdit";
	}
	
	
	@RequestMapping(value = "/noticeWrite.go")
	public String noticeWrite() {

		return "adminPage/adminNoticeWrite";
	}
	

	@RequestMapping(value = "adminFaqList.go")
	public String adminFaqListGo() {
		logger.info("faq관리 페이지 이동");
		return "adminPage/adminFaqList";
	}
	
	@RequestMapping(value = "adminFaqList.ajax")
	@ResponseBody
	public Map<String, Object> adminFaqList(int page , int searchType, String serachText, int categoryNum ,int delType) {
		logger.info("noticeManagementlist 요청");
		logger.info("요청페이지 : " + page);
		logger.info("faq 검색에서 가져온 text : "+serachText);
		logger.info("faq 검색에서 가져온 type : "+searchType);
		logger.info("faq 검색에서 가져온 category num : " + categoryNum);
		logger.info("faq 검색에서 가져온 category num : " + delType);
		Map<String, Object> map = null;
		int currPage = page;
			
		map = adminService.adminFaqList(currPage,searchType,serachText,categoryNum,delType);	
		
		
		return map;
	}
	
	
	@RequestMapping(value="/adminSuggestionsDetail.go")
	public String suggestionsDetailGo(String sug_idx, Model model) {
		
		suggestionService.suggestionsDetailGo(sug_idx, model);
		
		return "adminPage/adminSuggestionsDetail";
	}
	

	@RequestMapping(value = "/noticeDel.ajax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> noticeDel(int noticeIdx) {
		logger.info("공지사항 삭제 받은 idx : " + noticeIdx);
		Map<String, Object> map = new HashMap<String, Object>();
		int row = adminService.noticeDel(noticeIdx);
		map.put("success", row);
		return map;

	}
	
	@RequestMapping(value = "/noticeRestore.ajax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> noticeRestore(int noticeIdx) {
		logger.info("공지사항 복원 받은 idx : " + noticeIdx);
		Map<String, Object> map = new HashMap<String, Object>();
		int row = adminService.noticeRestore(noticeIdx);
		map.put("success", row);
		return map;

	}

	@RequestMapping(value = "/noticeWrite.do")
	public String noticeWriteDo(MultipartFile[] photos, HttpSession session, @RequestParam Map<String, String> param) {
		logger.info("공지사항 글작성 컨트롤러");
		com.sona.music.admin.dto.PhotoDTO photoInfo = new com.sona.music.admin.dto.PhotoDTO();
//		int adminIdRow = adminService.adminCheck(session.getAttribute("writer"));
			int row = adminService.noticeWrite(photos,param);
		 
			  for (MultipartFile p : photos) {
				  p.getOriginalFilename();
				  photoInfo.setOri_filename(p.getOriginalFilename());
				  photoInfo.getOri_filename();
				  logger.info("공지사항 포토 이름 : " + photoInfo.getOri_filename());
			  }		  
		  
		 

		logger.info("공지사항에서 받은 제목 : " + param.get("title"));
		logger.info("공지사항에서 받은 내용 : " + param.get("content"));

		return "redirect:/adminNoticeList.go";
	}
	
	@RequestMapping(value = "/noticeEditAdmin.do")
	public String noticeEditAdminDo(MultipartFile[] photos, HttpSession session, @RequestParam Map<String, String> param) {
		logger.info("공지사항 글작성 컨트롤러");
		com.sona.music.admin.dto.PhotoDTO photoInfo = new com.sona.music.admin.dto.PhotoDTO();
//		int adminIdRow = adminService.adminCheck(session.getAttribute("writer"));
			int row = adminService.noticeUpdate(photos,param);
		 
			  for (MultipartFile p : photos) {
				  p.getOriginalFilename();
				  photoInfo.setOri_filename(p.getOriginalFilename());
				  photoInfo.getOri_filename();
				  logger.info("공지사항 포토 이름 : " + photoInfo.getOri_filename());
			  }		  
		  
		 

		logger.info("공지사항에서 받은 제목 : " + param.get("title"));
		logger.info("공지사항에서 받은 내용 : " + param.get("content"));

		return "redirect:/adminNoticeList.go";
	}
	
	@RequestMapping(value = "noticePhotoDel.ajax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object>noticePhotoDel(@RequestParam Map<String, String> param){
		
		Map<String, Object> map = new HashMap<String, Object>();
		int photoidx = Integer.parseInt(param.get("postIdx"));
		String photoname = param.get("photoName");
		String photocategory = param.get("photoCategory");
		int row=adminService.photoDel(photoidx,photoname,photocategory);
		logger.info("사진 삭제된 개수" + row);
			
		map.put("success", row);
		logger.info("사진삭제에서 가져온거 : " + photoidx);
		logger.info("사진삭제에서 가져온거 : " + photocategory);
		logger.info("사진삭제에서 가져온거 : " + photoname);
		return map;
	}
	@RequestMapping(value = "adminFaqWrite.go")
	public String adminFaqWriteGo() {
		
		return "adminPage/adminFaqWrite";
	}
	
	@RequestMapping(value = "adminFaqWrite.do", method = RequestMethod.POST)
	public String adminFaqWriteDo(HttpSession session, Model model , @RequestParam Map<String,String> param) {
		
		String faqType = param.get("faqType");
		String faqTitle = param.get("title");
		String faqAnswer = param.get("answer");
		String faqAdminId = param.get("writer");
		logger.info("FAQ 작성에서 받은값 : "+faqType);
		logger.info("FAQ 작성에서 받은값 : "+faqTitle);
		logger.info("FAQ 작성에서 받은값 : "+faqAnswer);
		logger.info("FAQ 작성에서 받은값 : "+faqAdminId);
		
		
		
		int row = adminService.adminFaqWriteDo(faqTitle,faqAnswer,faqType,faqAdminId);
			
		
		return "redirect:/adminFaqList.go";
	}
	
	@RequestMapping(value = "adminFaqEdit.do", method = RequestMethod.POST)
	public String adminFaqEditDo(HttpSession session, Model model , @RequestParam Map<String,String> param) {
		
		String faqType = param.get("faqType");
		String faqTitle = param.get("title");
		String faqAnswer = param.get("answer");
		String faqIdx = param.get("faqIdx");
		logger.info("FAQ 수정에서 받은값 : "+faqType);
		logger.info("FAQ 수정에서 받은값 : "+faqTitle);
		logger.info("FAQ 수정에서 받은값 : "+faqAnswer);
		logger.info("FAQ 수정에서 받은값 : "+faqIdx);
		
		
		
		int row = adminService.adminFaqEditDo(param);
			
		
		return "redirect:/adminFaqList.go";
	}
	
	@RequestMapping(value = "/faqDel.ajax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> faqDel(int faqIdx) {
		logger.info("FAQ 삭제 받은 idx : " + faqIdx);
		Map<String, Object> map = new HashMap<String, Object>();
		int row = adminService.faqDel(faqIdx);
		map.put("success", row);
		return map;

	}
	
	@RequestMapping(value = "/faqRestore.ajax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> faqRestore(int faqIdx) {
		logger.info("FAQ 복원 받은 idx : " + faqIdx);
		Map<String, Object> map = new HashMap<String, Object>();
		int row = adminService.faqRestore(faqIdx);
		map.put("success", row);
		return map;

	}
	
	@RequestMapping(value = "adminSuggestionsList.go")
	public String adminSuggestionsListGo() {
		logger.info("건의사항 페이지 이동");
		return "adminPage/adminSuggestionsList";
	}
	

	@RequestMapping(value = "adminReviewList.go")
	public String adminReviewListGo() {
		logger.info("리뷰관리 페이지 이동");
		return "adminPage/adminReviewList";
	}
	
	@RequestMapping(value = "adminReviewList.ajax")
	@ResponseBody
	public Map<String, Object> adminReviewList(int page , int searchType, String serachText, int categoryNum ,int delType) {
		logger.info("리뷰 페이지 요청");
		logger.info("요청페이지 : " + page);
		logger.info("리뷰 검색에서 가져온 text : "+serachText);
		logger.info("리뷰 검색에서 가져온 type : "+searchType);
		logger.info("리뷰 검색에서 가져온 category num : " + categoryNum);
		logger.info("리뷰 검색에서 가져온 category num : " + delType);
		Map<String, Object> map = null;
		int currPage = page;
			
		map = adminService.showListSearchReview(currPage,searchType,serachText,categoryNum,delType);	
		return map;
	}
	
	@RequestMapping(value="/adminReviewDetail.go")
	public String adminReviewDetailGo(Integer review_idx, HttpSession session, Model model) {
		logger.info("idx="+review_idx+"리뷰 디테일 요청");
		
		adminService.adminLessonHeader(review_idx, model);

		if(review_idx != null) {

			Integer post_idx = review_idx; // POST_IDX 값을 REVIEW_IDX로 설정
			String photo_category = "Review"; // PHOTO_CATEGORY 값을 고정값으로 설정

			logger.info("detail post idx = " + post_idx);
			logger.info("detail photo category = " + photo_category);

			adminService.adminReviewDetail(review_idx, post_idx, photo_category, model);

			return "adminPage/adminReviewDetail"; 
		} else {

			return "adminPage/adminReviewList"; 
		}
	}
	
	@RequestMapping(value = "/reviewBlind.ajax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> reviewBlind(int reviewIdx) {
		logger.info("리뷰 블라인드 받은 idx : " + reviewIdx);
		Map<String, Object> map = new HashMap<String, Object>();
		int row = adminService.reviewBlind(reviewIdx);
		map.put("success", row);
		return map;

	}
	
	@RequestMapping(value = "/restoreReview.ajax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> restoreReview(int reviewIdx) {
		logger.info("리뷰 블라인드해제 받은 idx : " + reviewIdx);
		Map<String, Object> map = new HashMap<String, Object>();
		int row = adminService.restoreReview(reviewIdx);
		map.put("success", row);
		return map;

	}
	
	@RequestMapping(value = "adminSuggestionsList.ajax")
	@ResponseBody
	public Map<String, Object> adminSuggestionsList(int page , int searchType, String serachText, int categoryNum, int delType) {
		logger.info("adminSuggestionsList 요청");
		logger.info("요청페이지 : " + page);
		logger.info("faq 검색에서 가져온 text : "+serachText);
		logger.info("faq 검색에서 가져온 type : "+searchType);
		logger.info("faq 검색에서 가져온 category num : " + categoryNum);
		logger.info("faq 검색에서 가져온 category num : " + delType);
		Map<String, Object> map = null;
		int currPage = page;
			
		map = adminService.showListSearchSuggestion(currPage,searchType,serachText,categoryNum,delType);	
		
		
		return map;
	}
	
	
	@RequestMapping(value="/adminSuggestionsAnswerWrite.do")
	public String adminanswerWrite (String sug_idx, @RequestParam Map<String, String> param, HttpSession session) {
		String adminId = (String) session.getAttribute("loginId");
		String user_type = (String) session.getAttribute("user_type");
		String sug_answer = param.get("sug_answer");
		
		int row = suggestionService.answerWrite(sug_idx, adminId, sug_answer);
		logger.info("입력한 row 수 = " + row);
		String page = "redirect:/adminSuggestionsDetail.go?sug_idx=" + sug_idx;

		
		return page;
	}
	
	@RequestMapping(value="/adminSuggestionsDelete.do")
	public String adminSuggestionsDelete (String sug_idx, HttpSession session) {
		String page = "redirect:/adminSuggestionsList.go";
		
		
		int row = suggestionService.suggestionsDelete(sug_idx);
			
		
		return page;
	}
	
	@RequestMapping(value="/adminAnswerDelete.do")
	public String adminAnswerDelete (String sug_idx, HttpSession session) {
		String page = "redirect:/adminSuggestionsDetail.go?sug_idx=" + sug_idx;
		String user_type = (String) session.getAttribute("user_type");
		
		

		int row = suggestionService.answerDelete(sug_idx);
		logger.info("삭제한 row 수 = " + row);
		page = "redirect:/adminSuggestionsDetail.go?sug_idx=" + sug_idx;

		
		return page;
	}
	
	@RequestMapping(value="/adminAnswerEdit.go")
	public String admimAnswerEditGo (String sug_idx, HttpSession session, Model model) {
		String page = "adminPage/adminSuggestionsAnswerEdit";
				
		suggestionService.answerEditGo(sug_idx, model);
		
		return page;
		
	}
	
	@RequestMapping(value="/adminSuggestionsEdit.go")
	public String adminSuggestionsEditGo (String sug_idx, HttpSession session, Model model) {
		String page = "adminPage/adminSuggestionsEdit";
		
		
			
		suggestionService.suggestionsEditGo(sug_idx, model);
		
		return page;
		
	}
	
	@RequestMapping(value="/adminSuggestionsEdit.do", method = RequestMethod.POST)
	public String suggestionsEditDo (MultipartFile[] sug_photos, @RequestParam Map<String, String> param, String sug_idx, HttpSession session) {
		String page = "member/login";
		String loginId = (String) session.getAttribute("loginId");
			
		page = "redirect:/adminSuggestionsDetail.go?sug_idx=" + sug_idx;
		int row = suggestionService.suggestionsEdit(sug_photos, param, loginId, sug_idx);
		logger.info("수정한 게시글 수 = " + row);
		
		return page;
	}
	
	@RequestMapping(value="/adminSuggestionsAnswerEdit.do", method = RequestMethod.POST)
	public String adminAnswerWrite (@RequestParam Map<String, String> param, String sug_idx, HttpSession session) {
		String page = "redirect:/adminSuggestionsDetail.go?sug_idx=" + sug_idx;
		String adminId = (String) session.getAttribute("loginId");
		String user_type = (String) session.getAttribute("user_type");
		String sug_answer = param.get("sug_answer");
		int sug_answer_idx = Integer.parseInt(param.get("sug_answer_idx"));
		
		
		int row = suggestionService.answerEdit(sug_answer_idx, adminId, sug_answer);
		logger.info("수정한 row 수 = " + row);
			
		
		
		return page;
	}
	
	/*---------------------------------------------------------------------------------------- 정민호*/
	
	
	@RequestMapping(value = "/adminReportManagement.go")
	public String reportManagementGo() {

		return "adminPage/adminReportList";
	}
	
	@RequestMapping(value = "reportManagementlist.ajax")
	@ResponseBody
	public Map<String, Object> reportManagementlist(int page , int searchType, String searchText) {
		logger.info("reportManagementlist 요청");
		logger.info("요청페이지 : " + page);
		logger.info("신고 검색에서 가져온 text : "+searchText);
		logger.info("신고 검색에서 가져온 type : "+searchType);
		Map<String, Object> map = null;
		int currPage = page;
			
			map = adminService.showReportSearch(currPage,searchType,searchText);	

		
		
		return map;
	}
	


	
	@RequestMapping(value = "/reportDetailAdmin.go")
	public String reportDetailAdminGo(int report_idx, Model model) {
		adminService.reportDetailAdmin(report_idx, model);

		return "adminPage/adminReportDetail";
	}

    @RequestMapping(value = "/updateReportState", method = RequestMethod.POST)
    @ResponseBody
    public String updateReportState(@RequestParam int report_idx, @RequestParam String new_state) {
    	logger.info(report_idx + new_state);
        adminService.updateReportState(report_idx, new_state);
        return "Success";
    }
	@RequestMapping(value = "/adminActionWrite.go")
	public String actionWriteGo(int report_idx,Model model) {
		adminService.reportDetailAdmin(report_idx, model);
		return "adminPage/adminActionDetailWrite";
	}
	
	@RequestMapping(value = "/adminActionWrite.do", method = RequestMethod.POST)
	public String adminActionWriteDo(HttpSession session, Model model , @RequestParam Map<String,String> param) {
		int reportIdx = Integer.parseInt(param.get("report_idx"));
		String admin = param.get("admin_id");
		String content = param.get("action_content");
		String action_result = param.get("action_result");
		logger.info("조치내역 작성에서 받은 값 : "+reportIdx);
		logger.info("조치내역 작성에서 받은 값 : "+admin);
		logger.info("조치내역 작성에서 받은 값 : "+content);
		logger.info("조치내역 작성에서 받은 값 : "+action_result);
		
		
		
		int row = adminService.adminActionWriteDo(reportIdx, admin, content,action_result);
			
		
		return "adminPage/adminReportList";
	}
	
	@RequestMapping(value = "/userSuspensionHistory.go")
	public String userSuspensionHistoryGo() {

		return "adminPage/userSuspensionHistory";
	}
	
	@RequestMapping(value = "suspensionlist.ajax")
	@ResponseBody
	public Map<String, Object> suspensionlist(int page , int searchType, String searchText) {
		logger.info("reportManagementlist 요청");
		logger.info("요청페이지 : " + page);
		logger.info("신고 검색에서 가져온 text : "+searchText);
		logger.info("신고 검색에서 가져온 type : "+searchType);
		Map<String, Object> map = null;
		int currPage = page;
			
			map = adminService.showSuspensionSearch(currPage,searchType,searchText);	
		
		
		return map;
	}
	
	@RequestMapping(value = "/userSuspensionDetail.go")
	public String userSuspensionDetailGo(int banned_idx, Model model) {
		adminService.userSuspensionDetail(banned_idx,model);
		return "adminPage/userSuspensionDetail";
	}
	
    @RequestMapping(value = "/unbanned", method = RequestMethod.POST)
    @ResponseBody
    public String unbanUser(@RequestParam int banned_idx) {
    	logger.info("ㅇㅇ"+banned_idx);
        adminService.unbanUser(banned_idx);
        
        return "Success";
    }
    
    @RequestMapping(value = "/addBan", method = RequestMethod.POST)
    @ResponseBody
    public String addBan(@RequestParam int banned_idx, @RequestParam String end_date) {
        // 받은 데이터를 이용하여 DB에 업데이트
        adminService.addBan(banned_idx, end_date);
        return "Success";
    }

    
    
    

}