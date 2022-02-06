package com.kosmo.fridge.service.impl;

import java.util.List;


import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.kosmo.fridge.service.ListPagingData;
import com.kosmo.fridge.service.NoticeDTO;
import com.kosmo.fridge.service.NoticeService;
import com.kosmo.fridge.service.PagingUtil;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
	
	
	@Resource(name="noticeDAO")
	private NoticeDAO dao;
	
	@Value("${PAGE_SIZE}")
	private int pageSize;
	@Value("${BLOCK_PAGE}")
	private int blockPage;

	
	@Override
	public boolean isAdmin(Map map) {
		return dao.isAdmin(map);
	}
 
	@Override
	public ListPagingData<NoticeDTO> selectList(
			Map map, HttpServletRequest req, int nowPage) {
		//페이징을 위한 로직 시작]
		//전체 레코드수	
		
		int totalRecordCount = dao.getTotalRowCount(map);		
		//전체 페이지수
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);		
		//시작 및 끝 ROWNUM구하기
		int start= (nowPage-1)*pageSize+1;
		int end = nowPage*pageSize;
		//페이징을 위한 로직 끝]
		map.put("start", start);
		map.put("end", end);
		//글 전체 목록 얻기
		List lists= dao.selectList(map);
		String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount, 
				pageSize, blockPage, nowPage,
				req.getContextPath()+"/admin_notice/List.do?");
		ListPagingData<NoticeDTO> listPagingData = new ListPagingData<>();
		listPagingData.setBlockPage(blockPage);
		listPagingData.setLists(lists);
		listPagingData.setNowPage(nowPage);
		listPagingData.setPageSize(pageSize);
		listPagingData.setPagingString(pagingString);
		listPagingData.setTotalRecordCount(totalRecordCount);
		
		System.out.println("찍어보기");
		for(NoticeDTO dto: listPagingData.getLists()) {
			System.out.println(dto);
		}
		return listPagingData;
	}
	
	@Override
	public int insert(Map map) {
		
		int affected=0; 
		try {	
			affected=dao.insert(map);	
		}
		catch(Exception e) {e.printStackTrace();}
		return affected;	
	}

	@Override
	public NoticeDTO selectOne(Map map) {
		return dao.selectOne(map);
	}

	@Override
	public int update(Map map) {
		return dao.update(map);
	}

	@Override
	public void delete(Map map) {
		dao.delete(map);
		
	}

	@Override
	public int increaseHit(String n_no) {
		return dao.increaseHit(n_no);
	}


	

}
