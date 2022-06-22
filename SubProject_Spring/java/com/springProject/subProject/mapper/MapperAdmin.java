package com.springProject.subProject.mapper;


import java.util.List;

import com.springProject.subProject.vo.MemberVO;
import com.springProject.subProject.vo.PageInfo;
import com.springProject.subProject.vo.ProductVO;
import com.springProject.subProject.vo.QnaVO;

public interface MapperAdmin {
	
	
	//  총 회원 수 조회
	public int selectMeListCount();
	
	//  회원 목록 조회
	public List<MemberVO> selectMeList(PageInfo pageInfo);
	
	// 회원 삭제
	public int deleteMember(MemberVO member);
	

		
		
		
		
	//  총 고객센터 게시물 수 조회
	public int selectCuListCount();
	
	//  고객센터 게시물 목록 조회
	public List<QnaVO> selectCuList(PageInfo pageInfo);
	
	
	
	
	
	// 상품 등록
	public int insertProduct(ProductVO product);
	
	// 총 상품 수 조회
	public int selectPdListCount();

	// 상품 목록 조회
	public List<ProductVO> selectPdList(PageInfo pageInfo);
	
	// 상품 상세 조회
	public ProductVO selectDetail(String pd_code);
	
	// 상품 삭제
	public int deleteProduct(ProductVO product);

	// 상품 수정
	public int updateProduct(ProductVO product);
	
	
	
}
