package com.kosmo.fridge.service.impl;

import java.io.File;
import java.io.IOException;
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
import com.kosmo.fridge.util.FileUpDownUtil;
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
	public boolean insert(MultipartHttpServletRequest multipartRequest) {
		List<MultipartFile> listImgFile = multipartRequest.getFiles("file");
		//System.out.println(file);
		String[] checkboxes = multipartRequest.getParameterValues("checkboxes");
		String[] counts = multipartRequest.getParameterValues("counts");
		String title=multipartRequest.getParameter("title");
		String content=multipartRequest.getParameter("content");
		String id=multipartRequest.getParameter("id");
		/*for(int i=0; i<checkboxes.length; i++) {
			System.out.println(checkboxes[i]);
			System.out.println(counts[i]);
		}*/
		System.out.println(id);
		Map map = new HashMap<>();
		map.put("title", title);
		map.put("content", content);
		map.put("id",id);
		
		int affected=0; 
		try {	
			affected=dao.insertSharePost(map);	
		}
		catch(Exception e) {e.printStackTrace();}
		
		System.out.println(map.get("tb_no"));
		map.put("fileSrc", listImgFile);
		
		
		
		try {
			 affected = dao.insertSharePostImgs(map); // DAO를 통해 이미지 소스 일괄 처리
		} catch (Exception e) {
			System.out.println("imginserterror");
			System.out.println(e);
		}
		
		System.out.println(affected);
		if(affected != listImgFile.size()) { // 영향받은 갯수와, 이미지 리스트 사이즈를 비교해 파일 입력성공여부 판단
			return false;
		}
		
		String path = multipartRequest.getServletContext().getRealPath("/upload/share");
		for(MultipartFile imgFile : listImgFile) {	// 각 파일 경로에 대해 폴더를 설정하고, 받아온 이미지 모두 입력	
			String rename=FileUpDownUtil.getNewFileName(path, imgFile.getOriginalFilename());
			String imgsrc = path+File.separator+map.get("tb_no")+File.separator+ rename;
			//String imgsrc = path+File.separator+map.get("tb_no")+File.separator+ imgFile.getOriginalFilename();
			System.out.println(imgsrc);
			
			File dest = new File(imgsrc);
			try {
				imgFile.transferTo(dest);				
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
				System.out.println("서버에 share사진 업로드 실패");
				return false;
			}
		}
		return true;
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
