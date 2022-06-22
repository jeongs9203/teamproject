package com.springProject.subProject.vo;


/*
  
	CREATE DATABASE SubscribeProject;
	
	CREATE TABLE MEMBER (
		mem_id VARCHAR(20),
		mem_password VARCHAR(500),
		mem_name VARCHAR(10),
		mem_birth VARCHAR(8),
		mem_gender VARCHAR(1),
		mem_email VARCHAR(50),
		mem_phoneNum VARCHAR(15),
		mem_postcode VARCHAR(6),
		mem_address	 VARCHAR(300),
		mem_grade VARCHAR(30),
		mem_point VARCHAR(10),
		mem_paymethod  VARCHAR(50),
		mem_auth CHAR(1)
	);

*/


public class MemberVO {
	
	private String mem_id;
	private String mem_password;
	private String mem_name;
	private String mem_birth;
	private String mem_gender;
	private String mem_email;
	private String mem_phoneNum;
	private String mem_postcode;
	private String mem_address;
	private String mem_grade;
	private String mem_point;
	private String mem_paymethod;
	private String mem_auth;
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_password() {
		return mem_password;
	}
	public void setMem_password(String mem_password) {
		this.mem_password = mem_password;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_birth() {
		return mem_birth;
	}
	public void setMem_birth(String mem_birth) {
		this.mem_birth = mem_birth;
	}
	public String getMem_gender() {
		return mem_gender;
	}
	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_phoneNum() {
		return mem_phoneNum;
	}
	public void setMem_phoneNum(String mem_phoneNum) {
		this.mem_phoneNum = mem_phoneNum;
	}
	public String getMem_address() {
		return mem_address;
	}
	public void setMem_address(String mem_address) {
		this.mem_address = mem_address;
	}
	public String getMem_grade() {
		return mem_grade;
	}
	public void setMem_grade(String mem_grade) {
		this.mem_grade = mem_grade;
	}
	public String getMem_paymethod() {
		return mem_paymethod;
	}
	public void setMem_paymethod(String mem_paymethod) {
		this.mem_paymethod = mem_paymethod;
	}
	public String getMem_point() {
		return mem_point;
	}
	public void setMem_point(String mem_point) {
		this.mem_point = mem_point;
	}
	public String getMem_postcode() {
		return mem_postcode;
	}
	public void setMem_postcode(String mem_postcode) {
		this.mem_postcode = mem_postcode;
	} 
	public String getMem_auth() {
		return mem_auth;
	}
	public void setMem_auth(String mem_auth) {
		this.mem_auth = mem_auth;
	}
	@Override
	public String toString() {
		return "MemberVO [mem_id=" + mem_id + ", mem_password=" + mem_password + ", mem_name=" + mem_name
				+ ", mem_birth=" + mem_birth + ", mem_gender=" + mem_gender + ", mem_email=" + mem_email
				+ ", mem_phoneNum=" + mem_phoneNum + ", mem_postcode=" + mem_postcode + ", mem_address=" + mem_address
				+ ", mem_grade=" + mem_grade + ", mem_point=" + mem_point + ", mem_paymethod=" + mem_paymethod
				+ ", mem_auth=" + mem_auth + "]";
	}
	
	
}
