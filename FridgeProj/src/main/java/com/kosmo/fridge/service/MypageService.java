package com.kosmo.fridge.service;
import org.springframework.web.multipart.MultipartFile;

public interface MypageService {	
	//회원정보보기
	MemberDTO readMember(String id);
	//회원정보수정
	//void memberEdit(Model model, MultipartFile file);
	void memberEdit(MemberDTO memberDTO, MultipartFile file);
	//비밀번호수정
	//void pwdEdit(MemberDTO memberDTO);

	
	






	
}
