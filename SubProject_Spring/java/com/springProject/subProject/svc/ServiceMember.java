package com.springProject.subProject.svc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.mail.internet.MimeMessage;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.springProject.subProject.mapper.MemberMapper;
import com.springProject.subProject.vo.BasketListVO;
import com.springProject.subProject.vo.KakaoTokenVO;
import com.springProject.subProject.vo.KakaoUserInfoVO;
import com.springProject.subProject.vo.MemberVO;
import com.springProject.subProject.vo.NaverTokenVO;
import com.springProject.subProject.vo.NaverUserInfoVO;
import com.springProject.subProject.vo.Order_checkVO;
import com.springProject.subProject.vo.UserIdVO;
import com.springProject.subProject.vo.Member_authVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


@Service
public class ServiceMember {
	@Autowired
	 private JavaMailSender mailSender;
	
	@Autowired
	private MemberMapper mapper;

	@Autowired
	private SocialLoginService service;
	
	private SimpleMailMessage preConfiguredMessage;
	
	// 이메일 보내기
	@Async
	public void sendEmail(String to, String subject, String body) {
		MimeMessage message = mailSender.createMimeMessage();

		try {
	    	   MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	    	   messageHelper.setSubject(subject);
	    	   messageHelper.setTo(to);
	    	   messageHelper.setFrom("caras134679@gmail.com", "홍길동");
	    	   messageHelper.setText(body,true);
	    	   mailSender.send(message);
	    	  }catch(Exception e){
	    		  e.printStackTrace();
	    	  }
	}
	
 	@Async
    public void sendPreConfiguredMail(String message) {
            SimpleMailMessage mailMessage = new SimpleMailMessage(preConfiguredMessage);
            mailMessage.setText(message);
            mailSender.send(mailMessage);
    }

	public String isDuplicate(String id) {
		return mapper.isDuplicate(id);
	}
	
	// 로그인
	public MemberVO getId(String mem_id) {
		return mapper.getFindId(mem_id);
	}
	// 로그인 성공시 인증판별
	public String getAuthenticationStatus(String mem_id) {
		return mapper.searchAuthStatus(mem_id);
	}
	// 회원가입
	public int joinMember(@ModelAttribute MemberVO memberVO) {
	System.out.println(memberVO);
	
		return mapper.insertMember(memberVO);
	}
	// 회원인증조회
	public String selectAuthInfo(@ModelAttribute Member_authVO authVO) {
		return mapper.authInfo(authVO);
	}
	public void insertAuthInfo(@ModelAttribute Member_authVO authVO) {
		mapper.insertAutoInfo(authVO);
	}
	
	public void updateAuthInfo(@ModelAttribute Member_authVO authVO) {
		mapper.updateAuthInfo(authVO);
	}
	// 인증 후 코드 삭제
	public void deleteAuth(@ModelAttribute Member_authVO authVO) {
		mapper.deleteAuth(authVO);
	}
	// 인증 성공으로 변경
	public void updateAuth(@ModelAttribute Member_authVO authVO) {
		mapper.updateAuth(authVO);
	}

	// 마이 페이지
	public MemberVO getMyPage(String id) {
		return mapper.selectMyPage(id);
	}

	// 회원정보 변경 폼 이동 -> 회원정보 가져오기
	public MemberVO getMemberDetail(String id) {
		
		return mapper.selectMemberDetail(id);
	}
	
	// 회원정보 수정 
		public int updateMember(@ModelAttribute MemberVO memberVO) {

			System.out.println("수정된 정보 : " + memberVO);
			
			return mapper.updateMember(memberVO);
		}
	
		// 아이디 찾기
		public String searchId(String mem_name, String mem_phoneNum) {
			return mapper.selectSearchId(mem_name, mem_phoneNum);
		}

		// 아이디, 비밀번호 찾기 - 휴대폰번호 인증
		public void certifiedPhoneNumber(String mem_phoneNum, String numStr) {
			// 인증번호(전화번호, 인증번호)
			String api_key = "NCS7HTCDIUT9TAWD";
			String api_secret = "JEWWSQKG12PLGCTO8FCVHMDUOTXGJICS";
			Message coolsms = new Message(api_key, api_secret);

			HashMap<String, String> params = new HashMap<String, String>();
			params.put("to", mem_phoneNum); // 수신전화번호
			params.put("from", "01086282629"); // 발신전화번호
			params.put("type", "SMS");
			params.put("text", "[회사명] 본인확인 인증번호 " + "[" + numStr + "]" + "를 입력하세요.");
			params.put("app_version", "test app 1.2"); // application name and version

			try {
				JSONObject obj = coolsms.send(params); // 문자 보내기
				System.out.println(obj.toString());
			} catch (CoolsmsException e) { // 문자전송 실패 시 메세지
				System.out.println(e.getMessage());
				System.out.println(e.getCode());
			}

		}

		// 비밀번호 찾기
		public String searchPass(String mem_name, String mem_phoneNum, String mem_email) {
			return mapper.selectSearchPass(mem_name, mem_phoneNum, mem_email);
		}

		// 비밀번호 변경
		public int updatePass(MemberVO memberVO) {
			return mapper.updatePass(memberVO);
		}

		// 비밀번호 찾기 - 이메일 인증
		public void sendEmailSelectPass(String mem_email, String addr, String subject, String body) {
			System.out.println("addr : " + addr);
			System.out.println("body : " + body);
			SimpleMailMessage smm = new SimpleMailMessage();
			smm.setFrom(mem_email);
			smm.setTo(addr);
			smm.setSubject(subject);
			smm.setText(body);

			mailSender.send(smm);
		}
		// 카카오 로그인 토큰 받아오기
			public KakaoTokenVO getAccessToken(String code) {
				return service.getAccessToken(code);
			}
			
			// 카카오 로그인 유저 정보 가져오기
			public KakaoUserInfoVO findKakaoUser(KakaoTokenVO kakaoTokenVO, UserIdVO userIdVO) {
				return service.findKakaoUser(kakaoTokenVO, userIdVO);
			}
			
			// 멤버 테이블 정보 조회
			public MemberVO getUserInfo(String email) {
				return mapper.selectUserInfo(email);
			}
			
			// 유저 토큰 아이디 찾기
			public UserIdVO getUserId(KakaoTokenVO kakaoTokenVO) {
				return service.getUserId(kakaoTokenVO);
			}
			
			// 카카오 로그인 시 유저 정보 넣기
			public void kakaoJoin(KakaoUserInfoVO kakaoUserInfoVO, String id) {
				
				String gender = kakaoUserInfoVO.getKakao_account().getGender();
				System.out.println("젠더 : " + gender);
				if(gender.equals("male")) {
					gender = "남";
				} else {
					gender = "여";
				}
				mapper.insertKakaoId(kakaoUserInfoVO, gender, id);
			}
			
			// 네이버 로그인 토큰 받아오기
			public NaverTokenVO getAccessTokenNaver(String code, String state) {
				return service.getAccessTokenNaver(code, state);
			}
			
			// 네이버 유저 정보 가져오기
			public NaverUserInfoVO findNaverUser(NaverTokenVO naverTokenVO) {
				return service.findNaverUser(naverTokenVO);
			}
			
			// 네이버 로그인 시 유저 정보 넣기
			public void naverJoin(NaverUserInfoVO naverUserInfoVO, String id) {
//				String id = naverUserInfoVO.getResponse().getEmail().split("@")[0] + "_naver";
				String[] bd = naverUserInfoVO.getResponse().getBirthday().split("-");
				String birthday = "";
				for(int i = 0; i < bd.length; i++) {
					birthday += bd[i]; 
				}
				naverUserInfoVO.getResponse().setBirthday(birthday);
				
				String[] phone = naverUserInfoVO.getResponse().getMobile().split("-");
				String phoneNum = "";
				
				for(int i = 0; i < phone.length; i++) {
					phoneNum += phone[i]; 
				}
				
				naverUserInfoVO.getResponse().setMobile(phoneNum);
				
				
				if(naverUserInfoVO.getResponse().getGender().equals("M")) {
					naverUserInfoVO.getResponse().setGender("남");
				} else {
					naverUserInfoVO.getResponse().setGender("여");
				}
				
				mapper.insertNaverId(naverUserInfoVO, id);
			}
		
		
	// 장바구니 불러오기
	public ArrayList<BasketListVO> getBasketList(String id) {
	      return mapper.selectMyBasket(id);
	}

	//장바구니 수량 변경
	public int updateBasket(BasketListVO basketListVO) {
		return mapper.updateBasket(basketListVO);
	}
	
	//장바구니 물품 삭재
	public void deleteBasket(String bk_mem_id, String bk_order_num, String bk_pd_code) {
		mapper.deleteMyBasket(bk_mem_id, bk_order_num, bk_pd_code);
	}
	
	//주문내역 확인
	public String isInquiry(String mem_id) {
		return mapper.isInquiry(mem_id);
	}

	//주문내역 불러오기
	public List<Order_checkVO> loadInquiry(String mem_id) {
		return mapper.loadInquiry(mem_id);
	}
	// 회원탈퇴
	public void memberDelete(String id) {
		mapper.memberDelete(id);
	}

}
