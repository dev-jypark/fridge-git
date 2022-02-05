package com.kosmo.fridge.service.impl;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;
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
		System.out.println(totalRecordCount);
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		int start = (nowPage-1)*pageSize+1;
		int end = nowPage*pageSize;
		
		map.put("start", start);
		System.out.println(start);
		map.put("end", end);
		System.out.println(end);
		//글 전체 목록 얻기
		List listsShare = dao.selectList(map);
		String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, 
				pageSize, blockPage, nowPage,
				req.getContextPath()+"/shareList.do?");
		
		return ListPagingData.<ShareDTO>builder().lists(listsShare).nowPage(nowPage).pageSize(pageSize).pagingString(pagingString).totalRecordCount(totalRecordCount).build();
	}

	@Override
	public boolean insert(MultipartHttpServletRequest multipartRequest) {
		//폼에서 받아온 정보
		List<MultipartFile> listImgFile = multipartRequest.getFiles("file");
		String[] checkboxes = multipartRequest.getParameterValues("checkboxes");
		String[] counts = multipartRequest.getParameterValues("counts");	
		String[] ingrediantcounts = multipartRequest.getParameterValues("ingrediantcounts");
		String title=multipartRequest.getParameter("title");
		String content=multipartRequest.getParameter("content");
		
		String id=(String) multipartRequest.getSession().getAttribute("id");
		
		checkboxes = checkboxes[0].split(",");
		counts = counts[0].split(",");
		ingrediantcounts = ingrediantcounts[0].split(",");
		/*배열에 담긴 값 확인
		System.out.println("checkboxes.length : "+ checkboxes.length);
		System.out.println("counts.length : "+ counts.length);
		for(int i=0; i<checkboxes.length; i++) {
			System.out.println("checkboxes : " + checkboxes[i]);
			System.out.println("counts : " + counts[i]);
		}
		*/
		//글 내용 업로드 시작
		Map map = new HashMap<>();
		map.put("title", title);
		map.put("content", content);
		map.put("id",id);
		
		int affected=0; 
		try {	
			affected=dao.insertSharePost(map);	
		}
		catch(Exception e) {
			System.out.println("postinserterror");
			e.printStackTrace();
			return false;
		}
		//글 내용 업로드 마침
		
		System.out.println("글번호 : "+map.get("tb_no")); //@@
		
		//사진 업로드 시작
		map.put("fileSrc", listImgFile);
		
		try {
			 affected = dao.insertSharePostImgs(map); // DAO를 통해 이미지 소스 일괄 처리
		} catch (Exception e) {
			System.out.println("imginserterror");
			e.printStackTrace();
			return false;
		}

		System.out.println(affected);//@@
		if(affected != listImgFile.size()) { // 영향받은 갯수와, 이미지 리스트 사이즈를 비교해 파일 입력성공여부 판단
			return false;
		}
		
		//사진 저장
		String path = multipartRequest.getServletContext().getRealPath("/upload/share");
		System.out.println(path);
		for(MultipartFile imgFile : listImgFile) {	// 각 파일 경로에 대해 폴더를 설정하고, 받아온 이미지 모두 입력
			String imgsrc = path+File.separator+map.get("tb_no")+File.separator+ imgFile.getOriginalFilename();
			System.out.println(imgsrc);//@@
			File dest = new File(imgsrc);
			if(!dest.exists()) dest.mkdirs();
			try {
				imgFile.transferTo(dest);				
			} catch (IllegalStateException | IOException e) {
				System.out.println("서버에 share사진 업로드 실패");
				e.printStackTrace();
				return false;
			}
		}
		//사진 업로드 마침
		
		//거래물(trade) 업로드 시작	
		for(int index = 0; index < counts.length; index++) {
			map.put("count", counts[index]);
			map.put("i_no", checkboxes[index]);
			//거래 등록한 제품 수 빼고 재료 테이블 i_cnt 업데이트
			map.put("i_cnt", Integer.parseInt(ingrediantcounts[index]) - Integer.parseInt(counts[index]));
			System.out.println("cnt : "+counts[index]+", cbox : "+checkboxes[index]); //@@
			try {
			dao.insertShareProduct(map);
			dao.updateIngrediant(map);
			} catch(Exception e) {
				System.out.println("tradeinserterror");
				e.printStackTrace();
				return false;
			}
		}
		//거래물(trade) 업로드 마침
		return true;
	}

	/*
	 * @Autowired private TransactionTemplate transactionTemplate;
	 */
	@Override
	public int delete(Map map) {
		System.out.println("삭제 서비스");
		int affected=0;
		/*
		 * int affected=0; try { transactionTemplate.execute(new
		 * TransactionCallback<Integer>() {
		 * 
		 * @Override public Integer doInTransaction(TransactionStatus status) {
		 * dao.deleteSharePost(map); return null; } });
		 * 
		 * } catch(Exception e) {e.printStackTrace();} return 0;
		 */
		List<IngrediantDTO> listIngrediant = dao.selectRollbackIngre(map);
		/*
		 * for(IngrediantDTO dto : listIngrediant) { System.out.println(dto); }
		 */
			
		dao.rollbackIngrediant(listIngrediant);
		//casecade 제약조건 붙어있어서 post만 삭제하면 관련된 것들 모두 삭제됨
		affected = dao.deleteSharePost(map);
		return affected;
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public ShareDTO selectOne(Map map) {
		return dao.selectOne(map);
	}

	//글 작성 페이지로 이동할 때 사용자 재료 목록 조회
	public List<IngrediantDTO> selectIngrediantList(Map map) {
		//System.out.println("서비스 아이디 : "+map.get("id"));
		List<IngrediantDTO> listIngrediant = dao.selectIngrediantList(map);
		return listIngrediant;
	}
	
}