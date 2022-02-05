package com.kosmo.fridge.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ShareMapService {
/*
	//로그인 용] 체크 겸용
	boolean isLogin(Map map);
*/
	//상세보기용]
	ShareBbsDTO selectOne(Map map, HttpServletRequest req);
	ListPagingData<ShareBbsDTO> selectList(Map map, HttpServletRequest req,int nowPage);
//	int getTotalRecord(Map map);

	

	
	//입력/수정/삭제용] 18일 이후 share 관련 병합	

	
}
