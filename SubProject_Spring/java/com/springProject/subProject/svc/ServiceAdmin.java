package com.springProject.subProject.svc;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springProject.subProject.mapper.MapperAdmin;
import com.springProject.subProject.vo.MemberVO;
import com.springProject.subProject.vo.PageInfo;
import com.springProject.subProject.vo.ProductVO;
import com.springProject.subProject.vo.QnaVO;

@Service
public class ServiceAdmin {
	
	@Autowired
	private MapperAdmin mapper;
	
	
	// 회원관리 목록
	
	public int getMeListCount() {
		return mapper.selectMeListCount();
	}
	
	public List<MemberVO> getMeList(PageInfo pageInfo) {
		return mapper.selectMeList(pageInfo);
	}
	
	// 회원 삭제
	
	public int removeMember(MemberVO member) {
		System.out.println(member);
		return mapper.deleteMember(member);
	}
	
	
	
	
	
	
	// 고객센터관리 게시물 목록
	
	public int getCuListCount() {
		return mapper.selectCuListCount();
	}

	public List<QnaVO> getCuList(PageInfo pageInfo) {
		return mapper.selectCuList(pageInfo);
	}
	
	
	
	
	
	
	
	// 상품등록 로직
	public int registerProduct(ProductVO product) {
		
		
		return mapper.insertProduct(product);
	
	}

	
	// 상품 목록
	public int getPdListCount() {
		return mapper.selectPdListCount();
	}
	
	
	public List<ProductVO> getPdList(PageInfo pageInfo) {
		return mapper.selectPdList(pageInfo);
	}

	// 상품 상세내용 조회
	public ProductVO getDetail(String pd_code) {
		return mapper.selectDetail(pd_code);
	}
	
	
	// 상품 삭제 
	public int removeProduct(ProductVO product) {
		System.out.println(product);
		return mapper.deleteProduct(product);
	}
	
	// 상품 수정
	public int modifyProduct(ProductVO product) {
		
		
		return mapper.updateProduct(product);
	}
	
	
	
	
	
	
		
}
