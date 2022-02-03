package com.kosmo.fridge.service;

import java.util.Map;

public interface MemberService {	
	//로그인 
	boolean isLogin(Map map);
	//소셜로그인
	int isSocialLogin(Map map);
	//회원가입
	void signUp(MemberDTO memberDTO);
	//소셜회원가입
	void SocialSignUp(MemberDTO memberDTO);
	//약관동의
	void agreeOK(MemberDTO memberDTO);	
	//소셜약관동의
	void socialAgreeOK(MemberDTO memberDTO);
	//아이디중복확인
	int checkMember(MemberDTO memberDTO);
	//닉네임중복확인
	int checkNick(MemberDTO memberDTO);
	//비밀번호변경
	void changePwd(MemberDTO memberDTO);
	//아이디찾기
	MemberDTO searchId(MemberDTO memberDTO);
	//비밀번호찾기
	MemberDTO searchPwd(MemberDTO memberDTO);
	//회원정보보기
	MemberDTO readMember(String id);
	//회원정보수정
	void memberEdit(MemberDTO memberDTO);





	
}
