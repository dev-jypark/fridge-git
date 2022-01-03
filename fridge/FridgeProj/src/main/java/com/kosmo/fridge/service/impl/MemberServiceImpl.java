package com.kosmo.fridge.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.fridge.service.MemberDTO;
import com.kosmo.fridge.service.MemberService;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	
	@Resource(name="memberDAO")
	private MemberDAO memberDAO;
	//로그인
	@Override
	public boolean isLogin(Map map) {
		return memberDAO.isLogin(map);
	}
	//회원가입
	@Override
	public void signUp(MemberDTO memberDTO) {
		memberDAO.signUp(memberDTO);	
	}
	//아이디중복확인
	@Override
	public int checkMember(String id) {
		return memberDAO.checkMember(id);
	}
	
}
