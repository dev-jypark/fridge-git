package com.kosmo.fridge.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kosmo.fridge.service.IngrediantDTO;
import com.kosmo.fridge.service.ShareDTO;
import com.kosmo.fridge.service.TradeDTO;
import com.kosmo.fridge.service.ShareService;
import com.kosmo.fridge.util.ListPagingData;
import com.kosmo.fridge.util.PagingUtil;

@Service("shareService")
public class ShareServiceImpl implements ShareService{

	@Resource(name="shareDAO")
	private ShareDAO dao;
	
	@Value("${PAGE_SIZE}")
	private int pageSize;
	
	@Value("${BLOCK_PAGE}")
	private int blockPage;
	
	/*
	 * public List<ShareDTO> selectList(Map map){ List<ShareDTO>
	 * listShare=dao.selectList(map); return listShare; }
	 * 
	 * public ShareDTO selectOne(Map map) { return null; }
	 */

	@Override
	public boolean isLogin(Map map) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ListPagingData<ShareDTO> selectList(Map map, HttpServletRequest req, int nowPage) {
		//페이징을 위한 로직
		int totalRecordCount = dao.getTotalRowCount(map);
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		int start = (nowPage-1)*pageSize+1;
		int end = nowPage*pageSize;
		
		map.put("start", start);
		map.put("end", end);
		
		//글 전체 목록 얻기
		List listShare = dao.selectList(map);
		String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, 
				pageSize, blockPage, nowPage,
				req.getContextPath()+"/shareList.do?");
		
		ListPagingData<ShareDTO> listPagingData = new ListPagingData<>();
		
		listPagingData.setBlockPage(blockPage);
		listPagingData.setLists(listShare);
		listPagingData.setNowPage(nowPage);
		listPagingData.setPageSize(pageSize);
		listPagingData.setPagingString(pagingString);
		listPagingData.setTotalRecordCount(totalRecordCount);
		return listPagingData;
		
		//return ListPagingData.builder().lists(lists).nowPage(nowPage).pageSize(pageSize).pagingString(pagingString).totalRecordCount(totalRecordCount).build();
	}

	@Override
	public int insert(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ShareDTO selectOne(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<IngrediantDTO> selectIngrediantList() {
		List<IngrediantDTO> listIngrediant = dao.selectIngrediantList();
		return listIngrediant;
	}
	
}
