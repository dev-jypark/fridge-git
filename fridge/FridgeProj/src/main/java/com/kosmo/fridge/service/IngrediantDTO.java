package com.kosmo.fridge.service;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class IngrediantDTO {
	private int i_no;
	private String id;
	private String i_name;
	private String i_cnt;
	private java.sql.Date i_enddate;
	private java.sql.Date i_postdate;
}
