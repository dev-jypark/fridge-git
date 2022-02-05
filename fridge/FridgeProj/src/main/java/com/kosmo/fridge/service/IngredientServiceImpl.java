package com.kosmo.fridge.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Transactional
@Service("ingredient")
public class IngredientServiceImpl implements IngredientService {

	
	@Resource(name="ingredientDAO")
	private IngredientDAO dao;
	
	@Override
	public String selectStock(Map map) {
		// TODO Auto-generated method stub
		return dao.selectStock(map);
	}

	@Override
	public String selectDate(Map map) {
		// TODO Auto-generated method stub
		return dao.selectDate(map);
	}
	
	

}
