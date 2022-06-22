package com.springProject.subProject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.springProject.subProject.svc.ServiceStore;
import com.springProject.subProject.vo.BasketVO;
import com.springProject.subProject.vo.PageInfo;
import com.springProject.subProject.vo.ProductVO;
import com.springProject.subProject.vo.ReviewVO;

@Controller
public class ControllerStore {
//스토어에 관련된 모든 이동
	@Autowired ServiceStore service;
	
	@RequestMapping(value = "/storeMain.st", method = RequestMethod.GET)
	public String store(@RequestParam(defaultValue = "1") int pageNum, Model model, @RequestParam(defaultValue = "") String select) {
		
		int listCount = service.getProductListCount();
//		System.out.println("전체 게시물 수 : " + listCount);
		int listLimit = 8; // 한 페이지 당 표시할 게시물 목록 갯수
		int pageLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
		
		// 페이징 처리를 위한 계산 작업
		int maxPage = (int)Math.ceil((double)listCount / listLimit);
		int startPage = ((int)((double)pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		int startRow = (pageNum - 1) * listLimit;
		
		PageInfo pageInfo = new PageInfo(pageNum, maxPage, startPage, endPage, listCount, startRow, listLimit);
		List<ProductVO> productList = null; 
		
		productList = service.getProductList(pageInfo ,select);
		
		model.addAttribute("productList", productList);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("select", select);
		return "store/store";
	}
	
	@RequestMapping(value = "/productDetail.st", method = RequestMethod.GET)
	public String productDetail(Model model, @RequestParam String pd_code, @RequestParam(defaultValue = "") String choice) {
		ProductVO productDetail = null; 
		List<ReviewVO> productReviewList = null;
		int reviewCount = service.getReviewCount(pd_code);
		Integer reviewAvg = service.getReviewAvg(pd_code);
		productDetail = service.getProductDetail(pd_code);
//		System.out.println(productDetail);
		productReviewList = service.getProductReviewList(pd_code, choice);
		
		model.addAttribute("productDetail", productDetail);
		model.addAttribute("productReviewList", productReviewList);
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("reviewAvg", reviewAvg);
		return "store/detailProduct";
	}
	
	//상품 장바구니에 담기
	@RequestMapping(value = "/productBasket.st", method = RequestMethod.POST)
	public String basketIn(String mem_id,String pd_code,String bk_qty,String pd_price,String choiceCheck,Model model) {
		System.out.println(mem_id+" : "+pd_code+" : "+bk_qty+" : "+pd_price+" : "+choiceCheck);
		Integer searchOrderNum = service.searchBasket(mem_id,pd_code);	//장바구니 확인
		System.out.println("searchOrderNum : " + searchOrderNum);
		if(searchOrderNum == 0) {
			Integer insertCount = service.basketIn(mem_id,pd_code,bk_qty);
			if(insertCount == 0) {
				model.addAttribute("msg", "잘못된 접근 또는 시스템오류입니다");
				return "fail_back";
			}
		}else {
			String bk_order_num = searchOrderNum.toString();
			Integer updateBasket = service.updateBasket(bk_qty,mem_id,pd_code,bk_order_num);
			if(updateBasket == 0) {
				model.addAttribute("msg", "잘못된 접근 또는 시스템오류입니다");
				return "fail_back";
			}
		}
		
		
		if(choiceCheck.equals("cart")) {
			return "redirect:basket.me";
		}else if(choiceCheck.equals("list")) {
			return "redirect:storeMain.st";
		}else {
			return "redirect:productDetail.st?pd_code="+pd_code;
		}
	}
	
	
	
	
	
	
	
}
