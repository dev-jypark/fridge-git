package com.kosmo.fridge.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kosmo.fridge.service.FeedDTO;
import com.kosmo.fridge.service.CommunityService;
import com.kosmo.fridge.service.MemberProfileDTO;

@Service
public class CommunityServiceImpl implements CommunityService{
	
	@Autowired
	CommunityDAO dao;

	
	//트랜잭션처리
	@Override
	public boolean insertFeed(MultipartHttpServletRequest mhsr) {
		
		String id = mhsr.getParameter("id"); // 파라미터로 sql에서 검색할 키 값 받아오기 : 저는 닉네임으로 id를 검색해서 db에 넣습니다.
		String fb_content = mhsr.getParameter("fb_content"); // 파라미터로 sql에 저장할 본문 텍스트 가져오기
		
		
		List<MultipartFile> listImgFile= mhsr.getFiles("fl_src"); // 파라미터로 저장할 이미지 경로 리스트를 받아오기
		
		System.out.println(id);	
		System.out.println(fb_content);
		
		// DAO에서 활용할 map 데이터 생성
		Map map = new HashMap<>();
		map.put("id", id);
		map.put("fb_content", fb_content);		
		
		// Map을 통해 먼저 글을 입력
		try {
			dao.insertFeed(map); // DAO를 통해 먼저 글 입력
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println("작성된 글 번호: " + map.get("fb_no")); // DB에 방금 저장한 글의 키값을 map을 통해 받아옴, 결과값 확인
		map.put("fi_src", listImgFile); // 맵에 이미지 소스 에 대한 리스트 넣기
		
		int affected = 0;
		try {
		 affected = dao.insertFeedImgs(map); // DAO를 통해 이미지 소스 일괄 처리
		} catch (Exception e) {
			System.out.println("imginserterror");
			System.out.println(e);
		}
		System.out.println(affected);
		if(affected != listImgFile.size()) { // 영향받은 갯수와, 이미지 리스트 사이즈를 비교해 파일 입력성공여부 판단
			return false;
		}
		
		String path = mhsr.getServletContext().getRealPath("/upload/feed"); // 서버에 저장할 경로 설정
		
		for(MultipartFile imgFile : listImgFile) {	// 각 파일 경로에 대해 폴더를 설정하고, 받아온 이미지 모두 입력	
			
			String imgsrc = path+File.separator+map.get("fb_no")+File.separator+ imgFile.getOriginalFilename();
			System.out.println(imgsrc);
			
			File dest = new File(imgsrc);
			try {
				imgFile.transferTo(dest);				
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
				System.out.println("서버에 Feed사진 업로드 실패");
				return false;
			}
		}		
	
		return true;
	}	
	
	public boolean updateMemberImg(MultipartHttpServletRequest mhsr) {
		
		//TODO 아직 미완 -> member테이블에서 이미지 소스를 아예 없애는 방법을 구상중
		String id = mhsr.getParameter("id");
		String path = mhsr.getServletContext().getRealPath("/upload/profile");
		MultipartFile upload= mhsr.getFile("imgsrc");
		String name = upload.getOriginalFilename();
		String type = name.substring(name.lastIndexOf("."));
		String imgsrc = path+File.separator+id+type;
		System.out.println(imgsrc);
		
		File dest = new File(imgsrc);
		Map map = new HashMap<>();
		map.put("id", id);
		map.put("imgsrc", id+type);
		System.out.println(id + type);
		try {
			upload.transferTo(dest);
			
		} catch (IllegalStateException | IOException e) {
			return false;
		}
		return dao.setUserImg(map) == 1;
		//return true;
	}

	@Override
	public MemberProfileDTO selectOneMemberProfile(String nick) {
		MemberProfileDTO dto = dao.selectOneMemberProfile(nick);
		if(dto.getSelf() == null)
			dto.setSelf("");
		return dto;
	}

	public String selectOneNick(String id) {
		return dao.selectOneNick(id);
	}

}
