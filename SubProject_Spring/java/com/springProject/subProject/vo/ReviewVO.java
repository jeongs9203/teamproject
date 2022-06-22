package com.springProject.subProject.vo;
/*
CREATE TABLE REVIEW(
re_num VARCHAR(100),
re_mem_id VARCHAR(20),
re_img VARCHAR(200),
re_title VARCHAR(80),
re_comment VARCHAR(800),
re_score VARCHAR(1000),
re_pd_code VARCHAR(50),
re_rdate VARCHAR(20)
);

 */
public class ReviewVO {
	private String re_num;
	private String re_mem_id;
	private String re_img;
	private String re_title;
	private String re_comment;
	private String re_score;
	private String re_pd_code;
	
	public String getRe_num() {
		return re_num;
	}
	public void setRe_num(String re_num) {
		this.re_num = re_num;
	}
	public String getRe_mem_id() {
		return re_mem_id;
	}
	public void setRe_mem_id(String re_mem_id) {
		this.re_mem_id = re_mem_id;
	}
	public String getRe_img() {
		return re_img;
	}
	public void setRe_img(String re_img) {
		this.re_img = re_img;
	}
	public String getRe_title() {
		return re_title;
	}
	public void setRe_title(String re_title) {
		this.re_title = re_title;
	}
	public String getRe_comment() {
		return re_comment;
	}
	public void setRe_comment(String re_comment) {
		this.re_comment = re_comment;
	}
	public String getRe_score() {
		return re_score;
	}
	public void setRe_score(String re_score) {
		this.re_score = re_score;
	}
	public String getRe_pd_code() {
		return re_pd_code;
	}
	public void setRe_pd_code(String re_pd_code) {
		this.re_pd_code = re_pd_code;
	}
	
	
}
