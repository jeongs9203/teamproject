package com.springProject.subProject.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.dsig.keyinfo.RetrievalMethod;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.springProject.subProject.svc.ServiceMember;
import com.springProject.subProject.vo.BasketListVO;
import com.springProject.subProject.vo.KakaoTokenVO;
import com.springProject.subProject.vo.KakaoUserInfoVO;
import com.springProject.subProject.vo.MemberVO;
import com.springProject.subProject.vo.NaverTokenVO;
import com.springProject.subProject.vo.NaverUserInfoVO;
import com.springProject.subProject.vo.Order_checkVO;
import com.springProject.subProject.vo.UserIdVO;
import com.springProject.subProject.vo.Member_authVO;

@Controller
@EnableAsync
public class ControllerMember {
//멤버에 관련된 회원가입,로그인작업
	
	@Autowired
	private ServiceMember service;
	
	//회원가입 선택 폼으로 이동
    @RequestMapping(value = "/join_before.me", method = RequestMethod.GET)
    public String joinBefore() {
       return "member/mem_join_before";
    }
    
	// 회원가입 폼으로 이동
	@RequestMapping(value = "/join_form.me", method = RequestMethod.GET)
	public String joinForm() {
		return "member/mem_joinForm";
	}

	// 아이디 중복확인 창 열기
	@RequestMapping(value = "/MemberCheckId.me", method = RequestMethod.GET)
	public String duplicatedId() {
		return "member/check_id";
	}

	// 아이디 중복확인 로직
	@RequestMapping(value = "/CheckIdDuplicate.me", method = RequestMethod.GET)
	public String checkDuplicatedId(String mem_id) {
		System.out.println(mem_id);
		String isDuplicate = service.isDuplicate(mem_id);
		return "redirect:MemberCheckId.me?mem_id=" + mem_id + "&isDuplicate=" + isDuplicate;
	}
	// 회원가입 인증로직
	@RequestMapping(value = "/mem_joinSuccess.me", method = RequestMethod.GET)
	public String joinSuccess(@ModelAttribute Member_authVO authVO) {

		String auth = service.selectAuthInfo(authVO); // 기존 인증코드 조회
		if(auth.equals(null)) {
			service.insertAuthInfo(authVO);
		}
		return "member/mem_joinSuccess";
	}
	// 회원가입 인증메일 전송 로직
	@RequestMapping(value = "/mem_sendmail.me", method = RequestMethod.GET)
	public ModelAndView sendEmail(HttpServletRequest request, HttpServletResponse response, @ModelAttribute MemberVO memberVO,String mem_email) throws Exception {

		
		request.setCharacterEncoding("utf-8");
    	response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
		
        
		ModelAndView mv = new ModelAndView();
		StringBuffer sb = new StringBuffer();
		sb.append("<html><body>");
		sb.append("<meta http-equiv='Content-Type' content='text/html; charset=euc-kr'>");
		sb.append("<h1>"+"인증하려면 링크를 클릭하세요"+"</h1><br>");
		sb.append("<h2>"+"<a href='http://localhost:8080/subProject/member_authentication.me?mem_id=" + memberVO.getMem_id() + "'>인증하기</a>"+"</h2>");
		sb.append("</body></html>");
		
		
		String mem_id = memberVO.getMem_id();
		String addr = memberVO.getMem_email(); // 받는사람
		String subject = "회원 가입 인증 메일입니다.";
		String body = sb.toString();
		
		service.sendEmail(addr, subject, body);
		System.out.println(mem_id);
		mv.setViewName("redirect:/");
		return mv; 
	}

	// 회원가입 비즈니스 로직
	@RequestMapping(value = "/mem_join.me", method = RequestMethod.POST)
	public String join(@ModelAttribute MemberVO memberVO, @ModelAttribute Member_authVO authVO,
			@RequestParam String mem_id, @RequestParam String mem_password, @RequestParam String mem_auth_code,
			String mem_year, String mem_month, String mem_day, String mem_mailAdd, String domain, String mem_phoneF,
			String mem_phoneM, String mem_phoneL, String address, String add_detail, Model model) {

		// 비밀번호 암호화
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePassword = encoder.encode(mem_password);

		String mem_birth = mem_year + mem_month + mem_day;
		String mem_email = mem_mailAdd + "@" + domain;
		String mem_phoneNum = mem_phoneF + mem_phoneM + mem_phoneL;
		String mem_address = address + add_detail;
		memberVO.setMem_password(securePassword); // 암호화한 비밀번호 memberVO 객체에 저장
		memberVO.setMem_birth(mem_birth);
		memberVO.setMem_email(mem_email);
		memberVO.setMem_address(mem_address);
		memberVO.setMem_phoneNum(mem_phoneNum);

		System.out.println("(회원가입)암호화한 비밀번호 : " + securePassword);
		int insertCount = service.joinMember(memberVO);
		service.insertAuthInfo(authVO);
		if (insertCount == 0) { // 회원가입 실패시
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";
		}
		return "redirect:/mem_joinSuccess.me?mem_id=" + mem_id + "&mem_email=" + mem_email;
		// return "redirect:/send_authentication_code.jsp?id=" + id + "&email=" +
		// email";
		// 회원 가입 성공 시 인증 메일 발송을 위한 send_authentication_code.jsp 페이지로 이동 (임의의 주소임)
		// => 파라미터로 아이디(id)와 이메일주소(email) 전송
	}
	
	// 회원가입 인증클릭로직
	@RequestMapping(value = "/member_authentication.me", method = RequestMethod.GET)
	public String authentication(@ModelAttribute Member_authVO authVO) {
		String result = service.selectAuthInfo(authVO);
		if(!result.equals(null)) {
			service.deleteAuth(authVO);
			service.updateAuth(authVO);
		}
		return "redirect:/";
	}

	// 로그인 폼으로 이동
	@RequestMapping(value = "/login_form.me", method = RequestMethod.GET)
	public String loginForm() {
		return "member/mem_loginForm";
	}

	// 로그인 비즈니스 로직
	@RequestMapping(value = "/login.me", method = RequestMethod.POST)
	public String login(HttpSession session, @ModelAttribute MemberVO memberVO, @RequestParam String mem_id,
			@RequestParam String mem_password, Model model) {
		// 입력받은 아이디로 memberVO 정보 불러옴
		MemberVO member = service.getId(mem_id);

		// 입력한 비밀번호와 memberVO에 있는 비밀번호 복호화 하여 비교
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		// matches()라는 메서드를 사용하여 입력받은 비밀번호와 DB에 저장돼있는 security방식의 암호화 키를 복호화하여 비교
		if (!encoder.matches(mem_password, member.getMem_password())) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		} else {
			String isAuthenticatedMember = service.getAuthenticationStatus(member.getMem_id());
			if (isAuthenticatedMember.equals("Y")) {
				session.setAttribute("userId", member.getMem_name()); // 헤더에 표시할 사용자 이름
				session.setAttribute("sId", member.getMem_id()); // 아이디 저장
				return "redirect:/";
			} else {
				model.addAttribute("msg", "회원 인증 필수");
				return "fail_back";
			}
		}

		// member_authentication.jsp 로 보내서 인증여부 판별
	}

	// 로그아웃
	@RequestMapping(value = "/logout.me", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	// 마이페이지
	@RequestMapping(value = "/mypage.me", method = RequestMethod.GET)
	public String getMemberInfo(HttpSession session, Model model) {
		String id = (String) session.getAttribute("sId");
//			System.out.println("마이페이지 - 아이디 : " + id);
		if (id == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
		MemberVO memberVO = service.getMyPage(id);
//			System.out.println("아이디 : " + memberVO.getMem_id());
		model.addAttribute("memberVO", memberVO);
		return "member/mem_mypage";
	}

	// 회원정보 변경 폼 이동
	@RequestMapping(value = "/memInfoEdit.me", method = RequestMethod.GET)
	public String infoEdit(HttpSession session, Model model) {
		String id = (String) session.getAttribute("sId");
		MemberVO memberVO = service.getMyPage(id);
//			System.out.println("회원정보 변경 - 아이디 : " + memberVO.getMem_id());
		model.addAttribute("memberVO", memberVO);
		return "member/mem_infoEdit";
	}

	// 회원 정보 변경 비즈니스 로직
	@RequestMapping(value = "/memInfoEdit.me", method = RequestMethod.POST)
	public String infoEditPost(HttpSession session, @ModelAttribute MemberVO memberVO, String mem_mailAdd,
			String domain, String mem_phoneNum, String mem_postcode, String address, String add_detail, Model model) {
		String id = (String) session.getAttribute("sId");
		String mem_email = mem_mailAdd + "@" + domain;
		String mem_address = address + add_detail;
		memberVO.setMem_id(id);
		System.out.println("아이디 : " + id);
		memberVO.setMem_email(mem_email);
		memberVO.setMem_phoneNum(mem_phoneNum);
		memberVO.setMem_postcode(mem_postcode);
		memberVO.setMem_address(mem_address);

		int updateCount = service.updateMember(memberVO);
		if (updateCount == 0) {
			model.addAttribute("msg", "회원정보변경 실패");
			return "fail_back";
		}
		model.addAttribute("memberVO", memberVO);

		return "redirect:/mypage.me";
	}
	
	// 아이디 찾기 폼으로 이동
		@RequestMapping(value = "/userSearchId.me", method = RequestMethod.GET)
		public String userSearchId() {
			return "member/userSearch_id";
		}

		// 아이디 찾기 비즈니스 로직
		@RequestMapping(value = "/SearchId.me", method = RequestMethod.POST)
		public String userSearchId(Model model, String mem_name, String mem_phoneNum) {
			System.out.println(mem_name);

			String searchId = service.searchId(mem_name, mem_phoneNum);

			if (searchId == null) {
				model.addAttribute("msg", "아이디가 없습니다!");
				return "fail_back";
			}
//			System.out.println("아이디 찾기 - searchId : " + searchId);
			model.addAttribute("searchId", searchId);
			return "member/userSearch_successId";
		}

		/* 문자 인증번호 - 아이디찾기 */
		@ResponseBody
		@PostMapping("/userSearchId.me")
//				@RequestMapping(value = "/SearchId.me", method = RequestMethod.GET)
		public String sendSMS(@RequestParam String mem_phoneNum) {
			// 5자리 인증번호 만들기
			Random random = new Random();
			String numStr = "";
			for (int i = 0; i < 5; i++) {
				String ranNum = Integer.toString(random.nextInt(10)); // 0부터 9까지 랜덤으로 숫자를 뽑는다.
				numStr += ranNum; // 랜덤으로 나온 숫자를 하나씩 누적해서 담는다.
			}
			// 확인용
//			System.out.println("아이디 찾기 - 수신자 번호 : " + mem_phoneNum);
//			System.out.println("아이디 찾기 - 인증번호 : " + numStr);

			// 문자 보내기
			service.certifiedPhoneNumber(mem_phoneNum, numStr);
			return numStr; // 인증번호 반환
		}

		// 비밀번호 찾기 폼으로 이동
		@RequestMapping(value = "/userSearchPass.me", method = RequestMethod.GET)
		public String userSearchPass() {
			return "member/userSearch_pass";
		}

		/* 문자 인증번호 - 비밀번호 찾기 */
		@ResponseBody
		@PostMapping("/userSearchPass1.me")
		public String sendSMS2(@RequestParam String mem_phoneNum) {
			// 5자리 인증번호 만들기
			Random random = new Random();
			String numStr = "";
			for (int i = 0; i < 5; i++) {
				String ranNum = Integer.toString(random.nextInt(10)); // 0부터 9까지 랜덤으로 숫자를 뽑는다.
				numStr += ranNum; // 랜덤으로 나온 숫자를 하나씩 누적해서 담는다.
			}
			// 확인용
//			System.out.println("비밀번호 찾기 - 수신번호 : " + mem_phoneNum);
//			System.out.println("비밀번호 찾기 - 인증번호 : " + numStr);

			// 문자 보내기
			service.certifiedPhoneNumber(mem_phoneNum, numStr);
			return numStr; // 인증번호 반환
		}

		// 비밀번호 찾기 비즈니스 로직 (이름&휴대폰번호 / 이름&이메일로 회원조회 후 변경)
		@RequestMapping(value = "/SearchPass.me", method = RequestMethod.POST)
		public String userSearchPass(Model model, String mem_name, @RequestParam(defaultValue = "") String mem_phoneNum,
				@RequestParam(defaultValue = "") String mem_email) {
//			System.out.println("비밀번호 찾기 - mem_email : " + mem_email);
//			System.out.println("비밀번호 찾기 - mem_phoneNum : " + mem_phoneNum);
			String searchPass = service.searchPass(mem_name, mem_phoneNum, mem_email);

			if (searchPass == null) {
				model.addAttribute("msg", "잘못된 아이디나 이메일입니다.!");
				return "/fail_back";
			}
//			System.out.println("비밀번호 찾기 - searchPass : " + searchPass);
			model.addAttribute("mem_name", mem_name);
			model.addAttribute("mem_phoneNum", mem_phoneNum);
			model.addAttribute("mem_email", mem_email);
			return "member/userSearch_changePass";
		}

		// 비밀번호 찾기 인증메일
		@ResponseBody
		@PostMapping("/userSearchPass2.me")
		public String sendEmailSelctPass(@RequestParam String mem_email) {
			Random random = new Random();
			String numStr2 = "";

			for (int i = 0; i < 5; i++) {
				String ranNum = Integer.toString(random.nextInt(10)); // 0부터 9까지 랜덤으로 숫자를 뽑는다.
				numStr2 += ranNum; // 랜덤으로 나온 숫자를 하나씩 누적해서 담는다.
			}
			System.out.println("비밀번호 찾기 이메일 인증 : " + mem_email);
			System.out.println("비밀번호 찾기 이메일 인증번호 : " + numStr2);

//					ModelAndView mv = new ModelAndView();
			String email = "email";
			String addr = mem_email; // 새로만든 구글 계정
			String subject = "[회사명] 비밀번호 조회 인증 이메일 입니다.";
			String body = "인증번호는 " + numStr2 + " 입니다. \n 해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

			service.sendEmailSelectPass(email, addr, subject, body);
//					mv.setViewName("/userSearchPass2.me");
			return numStr2;
		}

		// 비밀번호 변경
		@RequestMapping(value = "/changePass.me", method = RequestMethod.POST)
		public String changePass(@ModelAttribute MemberVO memberVO, Model model, String mem_name, String mem_phoneNum,
				String mem_password) {
			
			// 비밀번호 암호화
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			String securePassword = encoder.encode(mem_password);
			System.out.println("비밀번호 변경 암호화 : " + securePassword);
			memberVO.setMem_password(securePassword);
			
//			System.out.println("비밀번호 변경 - mem_name : " + mem_name);
			int updatePass = service.updatePass(memberVO);
			if (updatePass == 0) {
				model.addAttribute("msg", "비밀번호 변경 실패");
				return "fail_back";
			}
			model.addAttribute("memberVO", memberVO);
			return "redirect:/login_form.me";
		}

		// 카카오 로그인
			@RequestMapping(value = "/auth/kakao/callback", method = RequestMethod.GET)
			public String kakaoLogin(@RequestParam String code, HttpSession session) {
				
				// 액세스 토큰 받아오기
				KakaoTokenVO kakaoTokenVO = service.getAccessToken(code);
				// 토큰 아이디받아오기
				UserIdVO userId = service.getUserId(kakaoTokenVO);
				// 유저 정보 받아오기
				KakaoUserInfoVO kakaoUserInfo = service.findKakaoUser(kakaoTokenVO, userId);
				
				String eamil = kakaoUserInfo.getKakao_account().getEmail();
				String id = kakaoUserInfo.getKakao_account().getEmail().split("@")[0] + "_kakao";
				// Member DB에 정보유무 판별
				MemberVO memberVO = service.getUserInfo(eamil);
				
				// Member DB에 정보 없을 시  
				if(memberVO == null) {
					service.kakaoJoin(kakaoUserInfo, id);
				}
				
				
				session.setAttribute("userId", kakaoUserInfo.getKakao_account().getProfile().get("nickname").toString());
				// 카카오 로그아웃을 판별하려는 토큰
				session.setAttribute("access_token", kakaoTokenVO.getAccess_token());
				session.setAttribute("sId", id);
				return "redirect:/";
			}
			
			// 카카오 로그아웃
			@RequestMapping(value = "/auth/kakao/logout", method = RequestMethod.GET)
			public String kakaoLogout(HttpSession session) {
				
				session.invalidate();
				
				return "redirect:/";
			}
			
			// 네이버 로그인
			@RequestMapping(value = "/auth/naver/callback", method = RequestMethod.GET)
			public String naverLogin(@RequestParam String code, @RequestParam String state,HttpSession session) {
				// 액세스 토큰 받아오기
				NaverTokenVO naverTokenVO = service.getAccessTokenNaver(code, state);
				
				// 유저 정보 받아오기
				NaverUserInfoVO naverUserInfoVO = service.findNaverUser(naverTokenVO);
				String email = naverUserInfoVO.getResponse().getEmail();
				String id = naverUserInfoVO.getResponse().getEmail().split("@")[0] + "_naver";
				
				// Member DB에 정보유무 판별
				MemberVO memberVO = service.getUserInfo(email);
				
				// Member DB에 정보 없을 시
				if(memberVO == null) {
					service.naverJoin(naverUserInfoVO, id);
				}
				
				session.setAttribute("userId", naverUserInfoVO.getResponse().getName());
				session.setAttribute("sId", id);
				System.out.println("네이버 로그인 아이디 : " + id);
				return "redirect:/";
			}
			
	
	//주문조회 
	@RequestMapping(value = "/inquiry.me", method = RequestMethod.GET)
	public String inquiry(HttpSession session,Model model) {
		String mem_id = (String)session.getAttribute("sId");
		String isInquiry = service.isInquiry(mem_id);
		
		if(isInquiry == null) {			//주문내역이 있는경우
			List<Order_checkVO> list = service.loadInquiry(mem_id);		//주문내역 불러오기
			model.addAttribute("list", list);
		}else {							//주문내역이 없는경우
			model.addAttribute("comment", isInquiry);
		}
		
		return "member/mem_orderInquiry";
	}
	
	//장바구니 목록 불러오기
	@RequestMapping(value = "/basket.me", method = RequestMethod.GET)
	public String basket(HttpSession session, Model model) {
		String id = (String) session.getAttribute("sId");
	    ArrayList<BasketListVO> basketlist = service.getBasketList(id);
	
	    session.setAttribute("basketlist", basketlist);
	
	    return "member/mem_basket";
	}
	
	//장바구니 수량 변경
	@RequestMapping(value = "/basketUpdate.me", method = RequestMethod.GET)
	public String basketUpdate(HttpSession session,BasketListVO basketListVO, Model model) {
		System.out.println(basketListVO);
		int updateCount = service.updateBasket(basketListVO);
		
		return "redirect:basket.me";
	}
	
	// 마이페이지 - 장바구니 삭제
    @RequestMapping(value = "/basketDelete.me", method = RequestMethod.GET)
    public String deleteBasket(String bk_mem_id, String bk_order_num, String bk_pd_code) {
       System.out.println("DELETE : " + bk_mem_id + bk_order_num + bk_pd_code);
       service.deleteBasket(bk_mem_id, bk_order_num, bk_pd_code);
       return "redirect:/basket.me";
    }
    // 회원탈퇴 창
    @RequestMapping(value = "/MemberDelete.me", method = RequestMethod.GET)
    public String memberDelete() {
    	return "member/memberDelete";
    }
	// 회원탈퇴 비즈니스 로직
    @RequestMapping(value = "/MemberDeletePro.me", method = RequestMethod.GET)
    public String memberDeleteTrue(HttpSession session) {
    	String id = (String)session.getAttribute("sId");
    	service.memberDelete(id);
    	return "redirect:/";
    }
}
