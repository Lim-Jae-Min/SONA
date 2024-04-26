package com.sona.music.board.dao;

import java.util.List;

import com.sona.music.board.dto.NoticeDTO;
import com.sona.music.board.dto.PhotoDTO;

public interface NoticeDAO {

	List<NoticeDTO> showList(int start,int pagePerCnt,int deleteStatus);

	int allCount(int pagePerCnt, int deleteStatus, String serachText, int searchType);

	List<NoticeDTO> showListSearch(int start, int pagePerCnt, int deleteStatus, String searchText, int searchType);


	NoticeDTO noticeDetailAdmin(int idx);

	List<PhotoDTO> getNoticePhoto(int idx, String photo_category);

	void noticeViews(int idx);




}
