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
	@Override
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
	//비밀번호수정
	@Override
	public void pwdEdit(MemberDTO memberDTO) {
		memberDAO.pwdEdit(memberDTO);
	}

}
