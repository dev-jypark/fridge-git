package com.kosmo.fridge.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.kosmo.fridge.service.IngrediantDTO;
import com.kosmo.fridge.service.IngrediantService;

@Service("ingrediantService")
public class IngrediantServiceImpl implements IngrediantService{
	//서비스 주입
	@Resource(name="ingrediantDAO")
	private IngrediantDAO ingrediantDAO;

	//목록(등록일순)
	@Override
	public List<IngrediantDTO> fridgeList(String id) {
		return ingrediantDAO.fridgeList(id);
	}
	//입력
	@Override
	public void fridgeWrite(Map map) {
		System.out.println("(serviceimpl) map안의 f_name:"+map.get("f_name"));
		System.out.println("(serviceimpl) map안의 f_count:"+map.get("f_count"));
		System.out.println("(serviceimpl) map안의 f_enddate:"+map.get("f_enddate"));
		ingrediantDAO.fridgeWrite(map);
		
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
	public List<IngrediantDTO> sortByEnd(String id) {
		return ingrediantDAO.sortByEnd(id);
	}
}
