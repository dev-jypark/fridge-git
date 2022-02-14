package com.kosmo.fridge.service;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

public interface IngrediantService {	
	//목록(등록일순)
	List<IngrediantDTO> fridgeList(String id);
	//입력
	void fridgeWrite(Map map);
	//상세보기
	IngrediantDTO detail(int i_no);
	//수정
	void fridgeEdit(IngrediantDTO ingrediantDTO);
	//삭제
	void ingreDelete(String i_no);
	//유통기한 임박순 정렬
	List<IngrediantDTO> sortByEnd(String id);
}
