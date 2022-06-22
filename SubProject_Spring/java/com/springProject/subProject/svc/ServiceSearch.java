package com.springProject.subProject.svc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springProject.subProject.mapper.MapperSearch;
import com.springProject.subProject.vo.ProductVO;

@Service
public class ServiceSearch {
	
	@Autowired
	private MapperSearch mapper;

	public List<ProductVO> getProductList(String keyword) {
		return mapper.selectProductList(keyword);
	}

	public int getProductListCount(String keyword) {
		return mapper.selectProducListCount(keyword);
	}

}
