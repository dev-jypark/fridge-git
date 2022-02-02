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
	//상세보기
	@Override
	public IngrediantDTO detail(int i_no) {
		return ingrediantDAO.detail(i_no);
	}
	//수정
	@Override
	public void fridgeEdit(IngrediantDTO ingrediantDTO) {
		ingrediantDAO.fridgeEdit(ingrediantDTO);
	}
	//삭제
	public void ingreDelete(String i_no) {
		ingrediantDAO.ingreDelete(i_no);
	}
	//유통기한 임박순 정렬
	public List<IngrediantDTO> sortByEnd() {
		return ingrediantDAO.sortByEnd();
	}
}
