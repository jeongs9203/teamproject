package com.springProject.subProject.vo;

public class UserIdVO {
	private Long id;
	private int expires_in;
	private int app_id;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public int getExpires_in() {
		return expires_in;
	}
	public void setExpires_in(int expires_in) {
		this.expires_in = expires_in;
	}
	public int getApp_id() {
		return app_id;
	}
	public void setApp_id(int app_id) {
		this.app_id = app_id;
	}
	
	@Override
	public String toString() {
		return "UserIdVO [id=" + id + ", expires_in=" + expires_in + ", app_id=" + app_id + "]";
	}
	
	
}
