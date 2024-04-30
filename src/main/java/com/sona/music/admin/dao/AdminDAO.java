package com.sona.music.admin.dao;

import java.util.List;

import com.sona.music.admin.dto.AdminDTO;

import com.sona.music.board.dto.FAQDTO;

import com.sona.music.board.dto.NoticeDTO;
import com.sona.music.board.dto.SuggestionDTO;


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

	List<AdminDTO> showReportSearch(int start, int pagePerCnt,String serachText, int searchType);

	Object reportAllCount(int pagePerCnt, String serachText, int searchType);

	AdminDTO reportDetailAdmin(int report_idx);

	void updateReportState(int report_idx, String new_state);

	int adminActionWriteDo(int reportIdx, String admin, String content);

	List<AdminDTO> showSuspensionSearch(int start, int pagePerCnt, String serachText, int searchType);

	Object suspensionAllCount(int pagePerCnt, String serachText, int searchType);


	AdminDTO adminData();

	List<AdminDTO> userData(int currentMonth, int oneMonthAgo, int twoMonthAgo);

	List<AdminDTO> adminUserListCall(int pagePerCnt, int start, String condition, String searchContent);

	int adminUserListCount(int pagePerCnt, String condition, String searchContent);

	int userCount(String condition, String searchContent);

	AdminDTO adminUserDetail(String user_id);


}
