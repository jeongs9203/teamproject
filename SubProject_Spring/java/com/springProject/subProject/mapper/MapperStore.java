package com.springProject.subProject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.springProject.subProject.vo.BasketVO;
import com.springProject.subProject.vo.PageInfo;
import com.springProject.subProject.vo.ProductVO;
import com.springProject.subProject.vo.ReviewVO;

public interface MapperStore {

	public int selectProductListCount();
	
	public List<ProductVO> selectProductList(@Param("pageInfo") PageInfo pageInfo, @Param("select")String select);

	public ProductVO selectProductDetail(String pd_code);

	public List<ReviewVO> selectProductReviewList(@Param("pd_code")String pd_code, @Param("choice")String choice);

	public int selectReviewCount(String pd_code);

	public Integer selectReviewAvg(String pd_code);

	public Integer insertBasket(@Param("mem_id") String mem_id,@Param("pd_code") String pd_code,@Param("bk_qty") String bk_qty);

	public Integer selectOrderNum(@Param("mem_id") String mem_id,@Param("pd_code") String pd_code);

	public Integer updateBasket(@Param("bk_qty")String bk_qty,@Param("mem_id") String mem_id,@Param("pd_code") String pd_code,@Param("bk_order_num") String bk_order_num);





}
