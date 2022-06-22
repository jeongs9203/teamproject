package com.springProject.subProject.vo;

import java.sql.*;

/*
  
	CREATE DATABASE subscribeproject;
	
	CREATE TABLE QNA(
		qna_num INT,
		qna_mem_id VARCHAR(20),
		qna_pass VARCHAR(16),
		qna_title VARCHAR(50),
		qna_content VARCHAR(500),
		qna_re_ref INT,
		qna_re_lev INT,
		qna_re_seq INT,
		qna_date DATE
	);

*/


public class QnaVO {
	
	private int qna_num;
	private String qna_mem_id;
	private String qna_pass;
	private String qna_title;
	private String qna_content;
	private int qna_re_ref;
	private int qna_re_lev;
	private int qna_re_seq;
	private Date qna_date;
	
	public int getQna_num() {
		return qna_num;
	}
	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}
	public String getQna_mem_id() {
		return qna_mem_id;
	}
	public void setQna_mem_id(String qna_mem_id) {
		this.qna_mem_id = qna_mem_id;
	}
	public String getQna_pass() {
		return qna_pass;
	}
	public void setQna_pass(String qna_pass) {
		this.qna_pass = qna_pass;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public int getQna_re_ref() {
		return qna_re_ref;
	}
	public void setQna_re_ref(int qna_re_ref) {
		this.qna_re_ref = qna_re_ref;
	}
	public int getQna_re_lev() {
		return qna_re_lev;
	}
	public void setQna_re_lev(int qna_re_lev) {
		this.qna_re_lev = qna_re_lev;
	}
	public int getQna_re_seq() {
		return qna_re_seq;
	}
	public void setQna_re_seq(int qna_re_seq) {
		this.qna_re_seq = qna_re_seq;
	}
	public Date getQna_date() {
		return qna_date;
	}
	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}
	
	
	@Override
	public String toString() {
		return "QnaDTO [qna_num=" + qna_num + ", qna_mem_id=" + qna_mem_id + ", qna_pass=" + qna_pass + ", qna_title="
				+ qna_title + ", qna_content=" + qna_content + ", qna_re_ref=" + qna_re_ref + ", qna_re_lev="
				+ qna_re_lev + ", qna_re_seq=" + qna_re_seq + ", qna_date=" + qna_date + "]";
	}
	
	
	
		
}
