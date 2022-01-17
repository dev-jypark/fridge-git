package com.kosmo.fridge.service;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class QuestionDTO {
	private String q_no;
	private String id;
	private String q_title;
	private String q_content;
	private java.sql.Date q_postDate;
	private String q_secret; //비밀글 설정
	private String originNo; //원글 번호(답글 등록시 q_no랑 같은 번호로 따라가도록)
	private String groupOrd; //원글(답글포함)에 대한 순서(원글 0이라면 답글 1)
	private String groupLayer; //답글 계층 (답글에 답글)
	
	//롬복 미적용으로 인한 게터세터 생성
	public String getQ_no() {
		return q_no;
	}
	public void setQ_no(String q_no) {
		this.q_no = q_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public java.sql.Date getQ_postDate() {
		return q_postDate;
	}
	public void setQ_postDate(java.sql.Date q_postDate) {
		this.q_postDate = q_postDate;
	}
	public String getQ_secret() {
		return q_secret;
	}
	public void setQ_secret(String q_secret) {
		this.q_secret = q_secret;
	}
	public String getOriginNo() {
		return originNo;
	}
	public void setOriginNo(String originNo) {
		this.originNo = originNo;
	}
	public String getGroupOrd() {
		return groupOrd;
	}
	public void setGroupOrd(String groupOrd) {
		this.groupOrd = groupOrd;
	}
	public String getGroupLayer() {
		return groupLayer;
	}
	public void setGroupLayer(String groupLayer) {
		this.groupLayer = groupLayer;
	} 
	

	
}
