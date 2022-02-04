package com.kosmo.fridge.service.impl;

import java.util.List;
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
		System.out.println("service");
		System.out.println("id : "+map.get("id"));
		System.out.println("pwd : "+map.get("pwd"));
		return memberDAO.isLogin(map);
	}
	//소셜로그인
	@Override
	public int isSocialLogin(Map map) {
		return memberDAO.isSocialLogin(map);
		}
	//회원가입
	@Override
	public void signUp(MemberDTO memberDTO) {
		memberDAO.signUp(memberDTO);	
	}
	//소셜회원가입
	@Override
	public void SocialSignUp(MemberDTO memberDTO) {
		memberDAO.SocialSignUp(memberDTO);
	}
	//약관동의
	@Override
	public void agreeOK(MemberDTO memberDTO) {
		memberDAO.agreeOK(memberDTO);	
	}
	//소셜약관동의
	public void socialAgreeOK(MemberDTO memberDTO) {
		memberDAO.socialAgreeOK(memberDTO);			
	}	
	//아이디중복확인
	@Override
	public int checkMember(MemberDTO memberDTO) {
		return memberDAO.checkMember(memberDTO);
	}
	//닉네임중복확인
	@Override
	public int checkNick(MemberDTO memberDTO) {
		return memberDAO.checkNick(memberDTO);
	}
	//비밀번호변경
	@Override
	public void changePwd(MemberDTO memberDTO) {
		memberDAO.changePwd(memberDTO);
	}
	//아이디찾기
	@Override
	public MemberDTO searchId(MemberDTO memberDTO) {
		return memberDAO.searchId(memberDTO);	
	}
	//비밀번호찾기
	@Override
	public MemberDTO searchPwd(MemberDTO memberDTO) {
		return memberDAO.searchPwd(memberDTO);
	}
	//회원정보보기
	@Override
	public MemberDTO readMember(String id) {
		return memberDAO.readMember(id);
	}
	//회원정보수정
	@Override
	public void memberEdit(MemberDTO memberDTO) {
		memberDAO.memberEdit(memberDTO);
	}
}
