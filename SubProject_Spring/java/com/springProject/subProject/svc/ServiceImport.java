package com.springProject.subProject.svc;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;

@Service
public class ServiceImport {

	private RestTemplate restTemplate; 
	private HttpHeaders headers;
	
	public String getToken() {
		restTemplate = new RestTemplate();
		headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("imp_key", "2967490280200887");
		map.put("imp_secret", "f15919473ce160265511794903f36baba51543ebca526ebbd30221c5c1f636476a837cf7a008ea25");
		
		Gson var = new Gson();
		String json = var.toJson(map);
		HttpEntity<String> entity = new HttpEntity<String>(json,headers);
		
		
		return restTemplate.postForObject("https://api.iamport.kr/users/getToken", entity, String.class);
	}
}
