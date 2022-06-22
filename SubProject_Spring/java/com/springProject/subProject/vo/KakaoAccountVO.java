package com.springProject.subProject.vo;

import java.util.Map;

public class KakaoAccountVO {
	private Map<String, Object> profile;
	private String email;
	private String birthday;
	private String gender;
	
	public Map<String, Object> getProfile() {
		return profile;
	}
	public void setProfile(Map<String, Object> profile) {
		this.profile = profile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
}
