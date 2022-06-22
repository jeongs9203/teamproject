package com.springProject.subProject.svc;



import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;


import com.springProject.subProject.vo.NaverTokenVO;
import com.springProject.subProject.vo.NaverUserInfoVO;
import com.springProject.subProject.vo.UserIdVO;
import com.springProject.subProject.vo.KakaoTokenVO;
import com.springProject.subProject.vo.KakaoUserInfoVO;

@Service
public class SocialLoginService {
	
	private RestTemplate restTemplate;
	private HttpHeaders httpHeaders;
	
	public HttpHeaders setHeaderAccessToken(String access_token) {
		httpHeaders.add("Authorization", "Bearer " + access_token);
		
		return httpHeaders;
	}
	
	// 카카오 로그인 토큰
	public KakaoTokenVO getAccessToken(String code) {
		restTemplate = new RestTemplate();
		httpHeaders = new HttpHeaders();
		
		httpHeaders.add("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
		
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("code", code);
		parameters.add("client_id", "25b9b94777a0d2b56646129bea603613");
		parameters.add("redirect_uri", "http://localhost:8080/subProject/auth/kakao/callback");
		parameters.add("grant_type", "authorization_code");
		
		HttpEntity<MultiValueMap<String, String>> param = new HttpEntity<MultiValueMap<String,String>>(parameters, httpHeaders);
		
		String requestUrl = "https://kauth.kakao.com/oauth/token";
		
		return restTemplate.exchange(requestUrl, HttpMethod.POST, param, KakaoTokenVO.class).getBody();
	}
	
	// 유저 토큰 아이디 찾기
	public UserIdVO getUserId(KakaoTokenVO kakaoTokenVO) {
		restTemplate = new RestTemplate();
		httpHeaders = new HttpHeaders();
		
		String requestUrl = "https://kapi.kakao.com/v1/user/access_token_info";
		HttpEntity<String> userId = new HttpEntity<String>(setHeaderAccessToken(kakaoTokenVO.getAccess_token()));
		
		return restTemplate.exchange(requestUrl, HttpMethod.GET, userId, UserIdVO.class).getBody();
	}
	
	// 카카오 유저 정보
	public KakaoUserInfoVO findKakaoUser(KakaoTokenVO kakaoTokenVO, UserIdVO userIdVO) {
		restTemplate = new RestTemplate();
		httpHeaders = new HttpHeaders();
		
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		
		HttpEntity<String> kakaoUserInfo = new HttpEntity<String>(setHeaderAccessToken(kakaoTokenVO.getAccess_token()));
		
		UriComponents uriBuilder = UriComponentsBuilder.fromHttpUrl(reqURL)
				.queryParam("target_id_type", "user_id")
				.queryParam("target_id", userIdVO.getId())
				.build();
		
		return restTemplate.exchange(uriBuilder.toString(), HttpMethod.GET, kakaoUserInfo, KakaoUserInfoVO.class).getBody();
	}
	
	// 네이버 로그인 토큰
	public NaverTokenVO getAccessTokenNaver(String code, String state) {
		restTemplate = new RestTemplate();
		httpHeaders = new HttpHeaders();
		httpHeaders.add("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
		
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("grant_type","authorization_code");
		parameters.add("client_id", "u8qV72rCYp7ctZ8OEMD_");
		parameters.add("client_secret", "SZEauMIU0N");
		parameters.add("code", code);
		parameters.add("state", state);
		
		HttpEntity<MultiValueMap<String, String>> param = new HttpEntity<MultiValueMap<String,String>>(parameters, httpHeaders);
		
		String requestUrl = "https://nid.naver.com/oauth2.0/token";
		
		return restTemplate.exchange(requestUrl, HttpMethod.POST, param, NaverTokenVO.class).getBody();
	}
	
	// 네이버 유저 정보 요청
	public NaverUserInfoVO findNaverUser(NaverTokenVO naverTokenVO) {
		restTemplate = new RestTemplate();
		httpHeaders = new HttpHeaders();
		
		String reqURL = "https://openapi.naver.com/v1/nid/me";
		
		HttpEntity<String> naverUserInfo = new HttpEntity<String>(setHeaderAccessToken(naverTokenVO.getAccess_token()));
		
		UriComponents uriBuilder = UriComponentsBuilder.fromHttpUrl(reqURL).build();
		
		return restTemplate.exchange(uriBuilder.toString(), HttpMethod.GET, naverUserInfo, NaverUserInfoVO.class).getBody();
	}
	
	
}





























