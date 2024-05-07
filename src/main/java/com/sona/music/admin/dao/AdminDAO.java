package com.sona.music.admin.dao;

import java.util.List;

import com.sona.music.admin.dto.AdminDTO;
import com.sona.music.board.dto.PhotoDTO;
import com.sona.music.board.dto.ReviewDTO;


public interface AdminDAO {

	int noticeDel(int noticeIdx);

	int adminCheck(String attribute);

	int noticeWrite(AdminDTO noticeWriteDto);


	void noticePhotoWrite(String fileName, String newFileName, int noticeIdx, String noticeWriteId,
			String photoCategory);

	int noticeUpdate(AdminDTO noticeWriteDto);

	int photoDel(int photoidx, String photocategory, String photoname);

	int adminFaqWriteDo(String adminId, String faqTitle, String faqAnswer, String faqType);

	int faqEdit(AdminDTO faqEditDto);

	int faqDel(int faqIdx);
	
	List<AdminDTO> showListSearchSuggestion(int start, int pagePerCnt, int deleteStatus, String serachText, int searchType,
			int categoryNum);

	int allCountSuggestion(int pagePerCnt, int deleteStatus, String serachText, int searchType, int categoryNum);



	List<AdminDTO> showListSearchReview(int start, int pagePerCnt, int deleteStatus, String serachText, int searchType,
			int categoryNum);

	int allCountReview(int pagePerCnt, int deleteStatus, String serachText, int searchType, int categoryNum);

	List<AdminDTO> showReportSearch(int start, int pagePerCnt, String searschText, int searchType);

	Object reportAllCount(int pagePerCnt, String searchText, int searchType);

	AdminDTO reportDetailAdmin(int report_idx);

	void updateReportState(int report_idx, String new_state);

	int adminActionWriteDo(int reportIdx, String admin, String content, String action_result);

	List<AdminDTO> showSuspensionSearch(int start, int pagePerCnt, String searchText, int searchType);

	Object suspensionAllCount(int pagePerCnt, String searchText, int searchType);


	AdminDTO adminData();

	List<AdminDTO> userData(int currentMonth, int oneMonthAgo, int twoMonthAgo);

	List<AdminDTO> adminUserListCall(int pagePerCnt, int start, String condition, String searchContent);

	int adminUserListCount(int pagePerCnt, String condition, String searchContent);

	int userCount(String condition, String searchContent);

	AdminDTO adminUserDetail(String user_id);

	int reportDel(int reportIdx);


	AdminDTO userSuspensionDetail(int banned_idx);

	void updateEndDate(int banned_idx);

	void addBan(int banned_idx, String end_date);
	List<AdminDTO> adminUserDetailActionList(String user_id);

	List<AdminDTO> adminLessonListCall(int pagePerCnt, int start, String condition, String searchContent);

	int adminLessonListCount(int pagePerCnt, String condition, String searchContent);

	List<AdminDTO> adminNoticeShowListSearch(int start, int pagePerCnt, int deleteStatus, String serachText,
			int searchType);

	int adminNoticeAllCount(int pagePerCnt, int deleteStatus, String serachText, int searchType);

	List<AdminDTO> adminFaqList(int start, int pagePerCnt, int deleteStatus, String serachText, int searchType,
			int categoryNum);

	int adminFaqAllCount(int pagePerCnt, int deleteStatus, String serachText, int searchType, int categoryNum);

	ReviewDTO adminReviewLessonHeader(Integer review_idx);

	String adminReviewlessonLogoLoad(Integer review_idx);
	
	ReviewDTO adminReviewDetail(int review_idx);

	List<PhotoDTO> adminReviewphotos(int post_idx, String photo_category);

}
