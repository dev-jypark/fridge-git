package com.kosmo.fridge.service;

import java.util.List;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AdminNoticeService {
	
	boolean isAdmin(Map map);
	ListPagingData<AdminNoticeDTO> selectList(Map map,HttpServletRequest req,int nowPage);
	int insert(Map map);
	AdminNoticeDTO selectOne(Map map);
	int update(Map map);
	void delete(Map map);
	int increaseHit(String n_no);
}
