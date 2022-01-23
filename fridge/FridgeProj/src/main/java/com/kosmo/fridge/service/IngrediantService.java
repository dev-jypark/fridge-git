package com.kosmo.fridge.service;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

public interface IngrediantService {	
	//목록
	List<IngrediantDTO> fridgeList();
	//입력
	void fridgeWrite(IngrediantDTO ingrediantDTO);

	//수정

	//삭제

}
