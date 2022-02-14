package com.kosmo.fridge.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Transactional
@Service("ingredientService")
public class IngredientServiceImpl implements IngredientService {

	
	@Resource(name="ingredientDAO")
	private IngredientDAO dao;
	
	@Override
	public String selectStock(Map map) {
		System.out.println("serviceid"+map.get("id"));
		return dao.selectStock(map);
	}

	@Override
	public String selectDate(Map map) {
		// TODO Auto-generated method stub
		System.out.println("서비스 아이디 :::::::::"+map.get("id"));
		System.out.println("serviceid---------------dd-------"+map.get("id"));
		return dao.selectDate(map);
	}
	
	

}
