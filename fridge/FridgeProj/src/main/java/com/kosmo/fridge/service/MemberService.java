package com.kosmo.fridge.service;

import java.util.Map;

public interface MemberService {	
	//로그인 
	boolean isLogin(Map map);
	//회원가입
	void signUp(MemberDTO memberDTO);
	//아이디중복확인
	int checkMember(String id);
}
