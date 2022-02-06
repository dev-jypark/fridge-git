package com.kosmo.fridge.service;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class NoticeDTO {
	private String n_no;
	private String adminid;
	private String n_title;
	private String n_content;
	private String n_hit; //조회수
	private java.sql.Date n_postDate;
	//롬복 미적용으로 인한 게터,세터 생성
	public String getN_no() {
		return n_no;
	}
	public void setN_no(String n_no) { 
		this.n_no = n_no;
	}
	public String getAdminid() {
		return adminid;
	}
	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public String getN_hit() {
		return n_hit;
	}
	public void setN_hit(String n_hit) {
		this.n_hit = n_hit;
	}
	public java.sql.Date getN_postDate() {
		return n_postDate;
	}
	public void setN_postDate(java.sql.Date n_postDate) {
		this.n_postDate = n_postDate;
	}

	
}
