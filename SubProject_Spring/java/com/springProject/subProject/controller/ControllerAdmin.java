package com.springProject.subProject.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.springProject.subProject.svc.ServiceAdmin;
import com.springProject.subProject.vo.MemberVO;
import com.springProject.subProject.vo.PageInfo;
import com.springProject.subProject.vo.ProductVO;
import com.springProject.subProject.vo.QnaVO;

@Controller
public class ControllerAdmin {
//관리자페이지에서의 이동에 관련된 컨트롤러
	
	@Autowired
	private ServiceAdmin service;
	
	// 관리자 메인페이지
	@RequestMapping(value = "/admin_main.ad", method = RequestMethod.GET)
	public String adminDashboard() {
		return "admin/adminDashboard";
	}
	
	// 회원관리 페이지
	
	@RequestMapping(value = "/admin_member.ad", method = RequestMethod.GET)
		public String member(@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
		int listCount = service.getMeListCount();
		int listLimit = 10; // 한 페이지 당 표시할 게시물 목록 갯수
		int pageLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
			
		// 페이징 처리를 위한 계산 작업
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		int startPage = ((int)((double)pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
			
		if(endPage > maxPage) {
			endPage = maxPage;
		}
			
		// 조회 시작 게시물 번호(행 번호) 계산
		int startRow = (pageNum - 1) * listLimit;
					
		// 페이징 처리 정보를 PageInfo 객체에 저장
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPageNum(pageNum);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setStartRow(startRow);
		pageInfo.setListLimit(listLimit);
			
		// Service 객체의 memberList() 메서드를 호출하여 게시물 목록 조회
		List<MemberVO> memberList = service.getMeList(pageInfo);
					
		// Model 객체에 게시물 목록과 페이징 처리 정보 저장
		model.addAttribute("memberList", memberList);
		model.addAttribute("pageInfo", pageInfo);
			
		return "admin/memberManage";
		
	}
	
	
	// 회원관리 삭제 폼
	@RequestMapping(value = "/admin_memdelete.ad", method = RequestMethod.GET)
		public String memdelete() {
			return "admin/member_delete";
		}

	// 회원관리 삭제 로직 - POST
	@RequestMapping(value = "/admin_memdelete.ad", method = RequestMethod.POST)
		public String memdeletePost(@ModelAttribute MemberVO member, @RequestParam int page, Model model) {
			
			int deleteCount = service.removeMember(member);
			
			if(deleteCount == 0) {
				model.addAttribute("msg", "삭제 실패!");
				return "fail_back";
			}
			
			model.addAttribute("page", page);
			
	
			return "redirect:/admin_member.ad";
		}
	
	
	
		
	
	
	// 고객센터관리 페이지
	
	@RequestMapping(value = "/admin_customer.ad", method = RequestMethod.GET)
	public String customerCenter(@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
		int listCount = service.getCuListCount();
		int listLimit = 10; // 한 페이지 당 표시할 게시물 목록 갯수
		int pageLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
			
		// 페이징 처리를 위한 계산 작업
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		int startPage = ((int)((double)pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
			
		if(endPage > maxPage) {
			endPage = maxPage;
		}
			
		// 조회 시작 게시물 번호(행 번호) 계산
		int startRow = (pageNum - 1) * listLimit;
					
		// 페이징 처리 정보를 PageInfo 객체에 저장
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPageNum(pageNum);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setStartRow(startRow);
		pageInfo.setListLimit(listLimit);
			
		// Service 객체의 getList() 메서드를 호출하여 게시물 목록 조회
		List<QnaVO> qnaList = service.getCuList(pageInfo);
					
		// Model 객체에 게시물 목록과 페이징 처리 정보 저장
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("pageInfo", pageInfo);
			
		return "admin/qnaListManage";
		
	}
	
	
	
	
	// 상품등록 폼 - GET
	
	@RequestMapping(value = "/admin_register.ad", method = RequestMethod.GET)
	public String register() {
		return "admin/product_register";
	}
	
	// 상품등록 비즈니스 로직
	
	@RequestMapping(value = "/admin_register.ad", method = RequestMethod.POST)
	public String registerPost(@ModelAttribute ProductVO product, Model model) {
		
		int insertCount = service.registerProduct(product);
		
		if (insertCount == 0) {
			model.addAttribute("msg", "상품 등록 실패");
			return "fail_back";
		}
		
		return "redirect:/admin_list.ad";
	}
	
	
	// 상품 목록
	@RequestMapping(value = "/admin_list.ad", method = RequestMethod.GET)
	public String productList(@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
		int listCount = service.getPdListCount();
		int listLimit = 10; // 한 페이지 당 표시할 게시물 목록 갯수
		int pageLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
			
		// 페이징 처리를 위한 계산 작업
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		int startPage = ((int)((double)pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
			
		if(endPage > maxPage) {
			endPage = maxPage;
		}
			
		// 조회 시작 게시물 번호(행 번호) 계산
		int startRow = (pageNum - 1) * listLimit;
					
		// 페이징 처리 정보를 PageInfo 객체에 저장
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPageNum(pageNum);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setStartRow(startRow);
		pageInfo.setListLimit(listLimit);
			
		// Service 객체의 getList() 메서드를 호출하여 게시물 목록 조회
		List<ProductVO> productList = service.getPdList(pageInfo);
					
		// Model 객체에 게시물 목록과 페이징 처리 정보 저장
		model.addAttribute("productList", productList);
		model.addAttribute("pageInfo", pageInfo);
			
		return "admin/product_list";
		
	}

	// 상품 상세 조회 - GET
	@RequestMapping(value = "/admin_detail.ad", method = RequestMethod.GET)
	public String detail(@RequestParam String pd_code, Model model) {
		
		// Service 객체의 getProductDetail() 메서드를 호출하여 게시물 상세 정보 조회
		// => 파라미터 : 상품코드(pd_code), 리턴타입 : ProductVO(product)
		ProductVO product = service.getDetail(pd_code);
		
		model.addAttribute("product", product);
		
		return "admin/product_view";
	}
	
	
	// 상품 삭제 폼
	@RequestMapping(value = "/admin_delete.ad", method = RequestMethod.GET)
	public String delete() {
		return "admin/product_delete";
	}

	// 상품 삭제 로직 - POST
	@RequestMapping(value = "/admin_delete.ad", method = RequestMethod.POST)
	public String deletePost(@ModelAttribute ProductVO product, @RequestParam int page, Model model) {
		
		int deleteCount = service.removeProduct(product);
		
		
		if(deleteCount == 0) {
			model.addAttribute("msg", "삭제 실패!");
			return "fail_back";
		}
		
		model.addAttribute("page", page);
		

		return "redirect:/admin_list.ad";
	}
	
	// 상품 수정 폼
	
	@RequestMapping(value = "/admin_modify.ad", method = RequestMethod.GET)
	public String modify(@RequestParam String pd_code, Model model) {
		// 글 상세정보 조회 작업을 재사용하여 수정할 내용 가져오기
		// Service 객체의 getDetail() 메서드를 호출하여 게시물 상세 정보 조회
		// => 파라미터 : 글번호(pd_code), 리턴타입 : ProductVO(product)
		ProductVO product = service.getDetail(pd_code);
		
		model.addAttribute("product", product);
		
		return "admin/product_modify";
	}
	
	
	// 상품 수정 비즈니스 로직
	
	@RequestMapping(value = "/admin_modify.ad", method = RequestMethod.POST)
	public String modifyPost(@ModelAttribute ProductVO product, @RequestParam int page, Model model) {
		
		int modifyCount = service.modifyProduct(product);
				
		if (modifyCount == 0) {
			model.addAttribute("msg", "상품수정 실패");
			return "fail_back";
		}
		
		model.addAttribute("pd_code", product.getPd_code());
		model.addAttribute("page", page);
				
		return "redirect:/admin_detail.ad";
		
	}

	
	
	
	
	
}
