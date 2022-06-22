package com.springProject.subProject.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.springProject.subProject.vo.BasketListVO;
import com.springProject.subProject.vo.KakaoUserInfoVO;
import com.springProject.subProject.vo.MemberVO;
import com.springProject.subProject.vo.NaverUserInfoVO;
import com.springProject.subProject.vo.Order_checkVO;
import com.springProject.subProject.vo.Member_authVO;

public interface MemberMapper {

	String isDuplicate(String id);

	// 로그인(수정 전)
//		MemberVO searchUser(@ModelAttribute MemberVO memberVO);
		
	// 로그인
	MemberVO getFindId(String mem_id);
	
	// 로그인 성공시 인증 판별
	String searchAuthStatus(@Param("mem_id") String mem_id);
			
	// 카카오 로그인
	void insertKakaoId(@Param("userInfo") KakaoUserInfoVO kakaoUserInfoVO, @Param("gender") String gender, @Param("id") String id);

	MemberVO selectUserInfo(String email);
		
	// 네이버 로그인
	void insertNaverId(@Param("userInfo") NaverUserInfoVO naverUserInfoVO, @Param("id") String id);

	// 회원가입
	int insertMember(@ModelAttribute MemberVO memberVO);

	// 회원인증
	String authInfo(@ModelAttribute Member_authVO authvo);
	
	void insertAutoInfo(@ModelAttribute Member_authVO authvo);
	
	void updateAuthInfo(@ModelAttribute Member_authVO authvo);
	
	// 인증 후 삭제
	void deleteAuth(Member_authVO authVO);
	
	// 인증 성공으로 변경
	void updateAuth(Member_authVO authVO);
	// 마이페이지
		MemberVO selectMyPage(String id);

		// 회원정보 가져오기
		MemberVO selectMemberDetail(String id);

	// 회원 정보 수정
	int updateMember(@ModelAttribute MemberVO memberVO);

	// 아이디 찾기
		String selectSearchId(@Param("mem_name") String mem_name, @Param("mem_phoneNum") String mem_phoneNum);

		// 비밀번호 찾기
		String selectSearchPass(@Param("mem_name") String mem_name, @Param("mem_phoneNum") String mem_phoneNum,
				@Param("mem_email") String mem_email);

		// 비밀번호 변경
		int updatePass(@ModelAttribute MemberVO memberVO);

	
	
	// 장바구니 불러오기
	ArrayList<BasketListVO> selectMyBasket(String id);

	//장바구니 수량 변경
	int updateBasket(BasketListVO basketListVO);

	// 장바구니 삭제
   void deleteMyBasket(@Param("bk_mem_id") String bk_mem_id,@Param("bk_order_num") String bk_order_num,@Param("bk_pd_code") String bk_pd_code);

   //주문내역 확인
   String isInquiry(String mem_id);

   //주문내역 불러오기
   List<Order_checkVO> loadInquiry(String mem_id);

   // 회원 탈퇴
   void memberDelete(String id);









}
