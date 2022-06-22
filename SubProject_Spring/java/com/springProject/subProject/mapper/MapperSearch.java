package com.springProject.subProject.mapper;

import java.util.List;

import com.springProject.subProject.vo.ProductVO;

public interface MapperSearch {

	List<ProductVO> selectProductList(String keyword);

	int selectProducListCount(String keyword);

}
