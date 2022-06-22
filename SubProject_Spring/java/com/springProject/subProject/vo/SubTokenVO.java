package com.springProject.subProject.vo;

public class SubTokenVO {
	private String access_token;
	private String now;
	private String expired_at;
	
	public String getAccess_token() {
		return access_token;
	}
	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}
	public String getNow() {
		return now;
	}
	public void setNow(String now) {
		this.now = now;
	}
	public String getExpired_at() {
		return expired_at;
	}
	public void setExpired_at(String expired_at) {
		this.expired_at = expired_at;
	}
	
	@Override
	public String toString() {
		return "SubTokenVO [access_token=" + access_token + ", now=" + now + ", expired_at=" + expired_at + "]";
	}
	
	
	
	
	
}
