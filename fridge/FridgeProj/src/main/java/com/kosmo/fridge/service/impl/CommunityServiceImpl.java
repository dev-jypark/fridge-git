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
		
		String nick = mhsr.getParameter("nick");
		String fb_content = mhsr.getParameter("fb_content");
		Map map = new HashMap<>();
		
		List<MultipartFile> listImgFile= mhsr.getFiles("fl_src");
		
		System.out.println(nick);
		map.put("nick", nick);
		System.out.println(fb_content);
		map.put("fb_content", fb_content);		
		
		try {
			dao.insertFeed(map);
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println("작성된 글 번호: " + map.get("fb_no"));
		map.put("fi_src", listImgFile);
		
		int affected = 0;
		try {
		 affected = dao.insertFeedImgs(map);
		} catch (Exception e) {
			System.out.println("imginserterror");
			System.out.println(e);
		}
		System.out.println(affected);
		if(affected != listImgFile.size()) {
			return false;
		}
		
		String path = mhsr.getServletContext().getRealPath("/upload/feed");
		
		for(MultipartFile imgFile : listImgFile) {			
			
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
		String nick = mhsr.getParameter("nick");
		String path = mhsr.getServletContext().getRealPath("/upload/profile");
		MultipartFile upload= mhsr.getFile("imgsrc");
		String name = upload.getOriginalFilename();
		String type = name.substring(name.lastIndexOf("."));
		String imgsrc = path+File.separator+nick+type;
		System.out.println(imgsrc);
		
		File dest = new File(imgsrc);
		Map map = new HashMap<>();
		map.put("nick", nick);
		map.put("imgsrc", nick+type);
		System.out.println(nick + type);
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

}
