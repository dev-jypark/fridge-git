package com.kosmo.fridge.service.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.kosmo.fridge.service.MemberDTO;
import com.kosmo.fridge.service.MypageService;

@Service("mypageService")
public class MypageServiceImpl implements MypageService{
	
	@Resource(name="memberDAO")
	private MemberDAO memberDAO;
	//회원정보보기
	@Override
	public MemberDTO readMember(String id) {
		return memberDAO.readMember(id);
	}
	//회원정보수정
	@Override
	public void memberEdit(MemberDTO memberDTO, MultipartFile imgsrc) {		
		memberDAO.memberEdit(memberDTO, imgsrc);
	}
	
	//비밀번호수정
//	public void pwdEdit(MemberDTO memberDTO) {
//		memberDAO.pwdEdit(memberDTO);
//	}


}
