package com.kosmo.fridge.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosmo.fridge.service.MemberDTO;

@Repository
public class MemberDAO {
	/* [스프링에서 지원하는   마이바티스 관련 API(mybatis-spring-2.버전.jar) 미 사용]
	
	[프로그래밍 순서]
	가. SqlSessionFactory타입의 openSession()메소드로 SqlSession타입 얻기 
	나. SqlSession타입의 메소드 호출
	.쿼리문이	SELECT 
                  	다중레코드 일때:selectList()
                  	단일 레코드일때:selectOne()
	.쿼리문이 	INSERT - insert()
         		DELETE - delete()
         		UPDATE - update()메소드
     		      단,I/D/U일때는 반드시 commit()호출
     
	다.-close()호출   

	 */
	/*[스프링에서 지원하는  마이바티스 관련 API(mybatis-spring-2.버전.jar) SqlSessionTemplate 사용]
	   -위 프로그래밍 순서의 (가)  및 (나)에서는 commit()호출
		그리고 (다)의 close()호출 불필요 
	 */
	@Resource(name = "sqlSessionFactory")
	private SqlSessionFactory sqlMapper;
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	//로그인
	public boolean isLogin(Map map){
		SqlSession session= sqlMapper.openSession();
		int count=session.selectOne("memberLogin",map);
		session.close();
		return count==1 ? true : false;
	}
	//소셜로그인
	public int isSocialLogin(Map map){
		SqlSession session= sqlMapper.openSession();
		 int result=session.selectOne("memberSocialLogin",map);
		return result;		 
		}	
	//회원가입
	public void signUp(MemberDTO memberDTO) {
		SqlSession session= sqlMapper.openSession();
		session.insert("memberInsert", memberDTO);
		session.commit();
	}
	//소셜회원가입
	public void SocialSignUp(MemberDTO memberDTO) {
		SqlSession session= sqlMapper.openSession();
		session.insert("memberSocialSignUp", memberDTO);
		session.commit();
		}
	//약관동의
	public void agreeOK(MemberDTO memberDTO) {
		SqlSession session= sqlMapper.openSession();
		session.insert("agreeInsert", memberDTO);
		session.commit();
	}
	//소셜약관동의
	public void socialAgreeOK(MemberDTO memberDTO) {
		SqlSession session= sqlMapper.openSession();
		session.insert("socialAgreeInsert", memberDTO);
		session.commit();
	}
	//아이디중복확인
	public int checkMember(MemberDTO memberDTO) {
		SqlSession session= sqlMapper.openSession();
		int result=session.selectOne("memberIdCheck",memberDTO);
		return result;//존재:1 미존재:0
	}
	//닉네임중복확인
	public int checkNick(MemberDTO memberDTO) {
		SqlSession session= sqlMapper.openSession();
		int result=session.selectOne("memberNickCheck",memberDTO);
		return result;//존재:1 미존재:0
	}
	//비밀번호변경
	public void changePwd(MemberDTO memberDTO) {
		SqlSession session= sqlMapper.openSession();
		session.update("pwdUpdate",memberDTO);
	}
	//아이디찾기
	public MemberDTO searchId(MemberDTO memberDTO) {
		SqlSession session= sqlMapper.openSession();
		return session.selectOne("findId",memberDTO);
	}
	//비밀번호찾기
	public MemberDTO searchPwd(MemberDTO memberDTO) {
		SqlSession session= sqlMapper.openSession();
		return session.selectOne("findPwd",memberDTO);
	}
	//회원정보조회
	public MemberDTO readMember(String id) {
		SqlSession session= sqlMapper.openSession();
		return session.selectOne("viewMember",id);	
	}
	//회원정보수정
	public void memberEdit(MemberDTO memberDTO) {
		SqlSession session= sqlMapper.openSession();
		session.update("memberUpdate", memberDTO);	
	}

}