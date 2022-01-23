package com.kosmo.fridge.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.kosmo.fridge.service.IngrediantDTO;
import com.kosmo.fridge.service.IngrediantService;
import com.kosmo.fridge.service.IngrediantPagingUtil;
import com.kosmo.fridge.service.IngrediantPagingData;

@Service("ingrediantService")
public class IngrediantServiceImpl implements IngrediantService{
	//서비스 주입
	@Resource(name="ingrediantDAO")
	private IngrediantDAO ingrediantDAO;

	//목록
	@Override
	public List<IngrediantDTO> fridgeList() {
		return ingrediantDAO.fridgeList();
	}
	//입력
	@Override
	public void fridgeWrite(IngrediantDTO ingrediantDTO) {
		ingrediantDAO.fridgeWrite(ingrediantDTO);	
	}
	
	//수정
	
	//삭제
	
}
