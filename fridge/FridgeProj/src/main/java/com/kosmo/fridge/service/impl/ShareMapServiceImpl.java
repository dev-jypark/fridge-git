package com.kosmo.fridge.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.kosmo.fridge.service.ListPagingData;
import com.kosmo.fridge.service.PagingUtil;
import com.kosmo.fridge.service.ShareBbsDTO;
import com.kosmo.fridge.service.ShareMapService;

import lombok.Value;

/*
 * 이름 미 지정시 ID값은 소문자로 시작하는 클래스명이됨
 * 예]OneMemoServiceImpl클래인 경우 
 * ID값은 oneMemoServiceImpl
 * 지정도 가능 @Service(value="임의의ID값")
 */


@Service("ShareMapService")
public class ShareMapServiceImpl implements ShareMapService {
	
	//DAO주입]	
	@Resource(name="shareBbsDAO")
	private ShareBbsDAO dao;

	
//	//리소스파일(onememo.properties)에서 읽어오기
//	@Value("${PAGE_SIZE}")
//	private int pageSize;
//	@Value("${BLOCK_PAGE}")
//	private int blockPage;
	
	/*
	@Override
	public boolean isLogin(Map map) {		
		return dao.isLogin(map);
	}
	*/

	@Override
	public ShareBbsDTO selectOne(Map map,HttpServletRequest req) {
		return dao.selectOne(map);
	}


	@Override
	public ListPagingData<ShareBbsDTO> selectList(Map map, HttpServletRequest req, int nowPage) {
		//페이징을 위한 로직 시작]
		int pageSize = 10;
		int blockPage = 2;
		
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
				req.getContextPath()+"/share//shareMap.do?");
		
		
		return ListPagingData.<ShareBbsDTO>builder().lists(lists).nowPage(nowPage).pageSize(pageSize).pagingString(pagingString).totalRecordCount(totalRecordCount).build();
	}



	
}
