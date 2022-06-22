package com.springProject.subProject.vo;

import java.sql.Date;

/*
 
	CREATE TABLE faq (
		faq_idx INT(11),
		faq_question VARCHAR(5000),
		faq_answer VARCHAR(5000),
		faq_date DATE
	);
	
*/



public class FaqVO {
	
	private int faq_idx;
	private String faq_question;
	private String faq_answer;
	private Date faq_date;
	
	public int getFaq_idx() {
		return faq_idx;
	}
	public void setFaq_idx(int faq_idx) {
		this.faq_idx = faq_idx;
	}
	public String getFaq_question() {
		return faq_question;
	}
	public void setFaq_question(String faq_question) {
		this.faq_question = faq_question;
	}
	public String getFaq_answer() {
		return faq_answer;
	}
	public void setFaq_answer(String faq_answer) {
		this.faq_answer = faq_answer;
	}
	public Date getFaq_date() {
		return faq_date;
	}
	public void setFaq_date(Date faq_date) {
		this.faq_date = faq_date;
	}
	
	
	@Override
	public String toString() {
		return "FaqDTO [faq_idx=" + faq_idx + ", faq_question=" + faq_question + ", faq_answer=" + faq_answer
				+ ", faq_date=" + faq_date + "]";
	}
	
	
	

}
