package com.kosmo.fridge.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.kosmo.fridge.service.ShareDTO;
import com.kosmo.fridge.service.ShareService;
import com.kosmo.fridge.util.ListPagingData;
import com.kosmo.fridge.util.PagingUtil;

@Service("shareService")
public class ShareServiceImpl{

	@Resource(name="shareDAO")
	private ShareDAO dao;
	
	/*
	@Value("${PAGE_SIZE}")
	private int pageSize;
	
	@Value("${BLOCK_PAGE}")
	private int blockPage;
	*/
	
	/*
	public boolean isLogin(Map map) {
		return false;
	}
	*/
	
	/*
	@Override
	public ListPagingData<ShareDTO> selectList(Map map, HttpServletRequest req, int nowPage) {
		//페이징을 위한 로직
		int totalRecordCount = dao.getTotalRowCount(map);
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		int start= (nowPage-1)*pageSize+1;
		int end = nowPage*pageSize;
		
		map.put("start", start);
		map.put("end", end);
		
		//글 전체 목록 얻기
		List lists= dao.selectList(map);
		
		String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount, 
				pageSize, blockPage, nowPage,
				req.getContextPath()+"/fridge/share/List.do?");
		
		return ListPagingData.builder().lists(lists).nowPage(nowPage).pageSize(pageSize).pagingString(pagingString).totalRecordCount(totalRecordCount).build();
	}
	*/
	
	public List<ShareDTO> selectList(Map map){
		List<ShareDTO> listShare=dao.selectList(map);
		return listShare;	
	}
	
	public ShareDTO selectOne(Map map) {
		return null;
	}

}
