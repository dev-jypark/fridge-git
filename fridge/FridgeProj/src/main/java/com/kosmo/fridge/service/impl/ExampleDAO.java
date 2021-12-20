package com.kosmo.fridge.service.impl;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosmo.fridge.service.ExampleDTO;

@Repository
public class ExampleDAO {
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
	
	@Autowired
	private SqlSessionTemplate template;

	public java.util.List<ExampleDTO> selectList() {
		return template.selectList("exampleSelectList");
	}

}