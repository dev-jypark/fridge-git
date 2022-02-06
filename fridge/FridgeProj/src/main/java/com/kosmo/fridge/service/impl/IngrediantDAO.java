package com.kosmo.fridge.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosmo.fridge.service.IngrediantDTO;

@Repository
public class IngrediantDAO {
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
	
	//목록
	public List<IngrediantDTO> fridgeList() {
		SqlSession session= sqlMapper.openSession();
		return session.selectList("fridgeList");
	}
	//입력
	public void fridgeWrite(Map map) {
		SqlSession session= sqlMapper.openSession();
		session.insert("fridgeWrite", map);
		session.commit();
	}
	//상세보기
	public IngrediantDTO detail(int i_no) {
		SqlSession session= sqlMapper.openSession();
		return session.selectOne("detail", i_no);
	}
	//수정
	public void fridgeEdit(IngrediantDTO ingrediantDTO) {
		SqlSession session= sqlMapper.openSession();
		session.update("fridgeEdit", ingrediantDTO);
	}
	//삭제
	public void ingreDelete(String i_no) {
		SqlSession session= sqlMapper.openSession();
		session.delete("ingreDelete", i_no);
	}
	//유통기한 임박순
	public List<IngrediantDTO> sortByEnd() {
		SqlSession session= sqlMapper.openSession();
		return session.selectList("sortByEnd");
	}
}