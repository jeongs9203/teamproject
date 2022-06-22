package com.springProject.subProject.vo;

/*
 * CREATE TABLE MEMBER_AUTH (
		mem_id VARCHAR(20),
		mem_auth_code VARCHAR(50)
	);
	*/
public class Member_authVO {
	private String mem_id;
	private String mem_auth_code;
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_auth_code() {
		return mem_auth_code;
	}
	public void setMem_auth_code(String mem_auth_code) {
		this.mem_auth_code = mem_auth_code;
	}
	@Override
	public String toString() {
		return "member_authVO [mem_id=" + mem_id + ", mem_auth_code=" + mem_auth_code + "]";
	}
}
