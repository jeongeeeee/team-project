package com.spring.huiloaelag.product;

import java.util.List;
import java.util.Map;

import com.spring.huiloaelag.admin.ProductVO;
import com.spring.huiloaelag.admin.ReviewVO;

public interface CategoryService {
	List<ProductVO> getAllList(ProductVO vo);
	List<ProductVO> getProductList(int pCode);
	List<ProductVO> getJsonProductList(int pCode);
	List<ProductVO> getDetail(String pCode);
	int getReviewCount(String pCode);
	Integer getReviewAVG(String pCode);
	List<ProductVO> getProductAll();
	List<ReviewVO> getReviewList(String pCode);
	List<ProductVO> getProductSelectList(Map<String, Integer> categoryMap);
}
