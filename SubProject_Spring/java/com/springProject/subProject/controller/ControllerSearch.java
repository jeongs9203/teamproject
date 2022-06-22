package com.springProject.subProject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.springProject.subProject.svc.ServiceSearch;
import com.springProject.subProject.vo.ProductVO;



@Controller
public class ControllerSearch {
	
	@Autowired
	private ServiceSearch service;

	 //검색 폼으로 이동
		@RequestMapping(value = "/search", method = RequestMethod.GET)
		public String searchForm() {
			return "search/search";
		}
		
		@RequestMapping(value = "/search", method = RequestMethod.POST)
	    public String searchProduct(@RequestParam String keyword, Model model) {
			
			int listCount = service.getProductListCount("%" + keyword + "%");
	        
	        // 검색 타입과 검색어를 활용하여 게시물 목록 조회하도록 파라미터 전달
	        // => 단, 검색어의 경우 앞뒤로 다른 문자를 포함 가능하도록 %검색어% 형태로 전환
	        List<ProductVO> productList = service.getProductList("%" + keyword + "%");
//	       System.out.println("검색 : " + listCount);
	        model.addAttribute("productList", productList);
	        model.addAttribute("keyword", keyword);
	        model.addAttribute("listCount", listCount);
	        
	        return "search/search";
	    }
}
