package com.kosmo.fridge.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface QuestionService {
	
	boolean isLogin(Map map);
	ListPagingData<QuestionDTO> selectList(Map map,HttpServletRequest req,int nowPage);
	int insert(Map map);
	QuestionDTO selectOne(Map map);
	int update(Map map);
	void delete(Map map);
	int insertReply(Map map);
}
