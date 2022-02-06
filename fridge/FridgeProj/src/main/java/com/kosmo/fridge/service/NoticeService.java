package com.kosmo.fridge.service;

import java.util.List;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface NoticeService {
	
	boolean isAdmin(Map map);
	ListPagingData<NoticeDTO> selectList(Map map,HttpServletRequest req,int nowPage);
	int insert(Map map);
	NoticeDTO selectOne(Map map);
	int update(Map map);
	void delete(Map map);
	int increaseHit(String n_no);
}
