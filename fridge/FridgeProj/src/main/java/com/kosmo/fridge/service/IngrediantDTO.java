package com.kosmo.fridge.service;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class IngrediantDTO {
	private String i_no;
	private String id;
	private String i_name;
	private String i_cnt;
	private Date i_enddate;
	private Date i_postdate;
	private String t_cnt;
	private String t_no;
}