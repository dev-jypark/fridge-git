	package com.kosmo.fridge.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kosmo.fridge.util.ListPagingData;

public interface ShareService {
	//로그인 용]
	boolean isLogin(Map map);
	//목록용]
	ListPagingData<ShareDTO> selectList(Map map,HttpServletRequest req,int nowPage);
	//상세보기용]
	ShareDTO selectOne(Map map);
	//입력/수정/삭제용]	
	boolean insert(MultipartHttpServletRequest multipartRequest);
	int delete(Map map);
	int update(Map map);
}