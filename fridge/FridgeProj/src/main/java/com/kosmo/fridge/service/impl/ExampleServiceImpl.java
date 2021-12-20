package com.kosmo.fridge.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.fridge.service.ExampleDTO;

@Service("exampleService")
/*편의상 ExampleService Interface는 만들지 않았음*/
public class ExampleServiceImpl {
	
	@Resource(name="exampleDAO")
	private ExampleDAO dao;
	
	public java.util.List<ExampleDTO> selectList() {
		return dao.selectList();
	}
}
