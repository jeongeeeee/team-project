package com.spring.huiloaelag.product.dao;

import java.util.List;

import com.spring.huiloaelag.admin.ProductVO;

public interface SearchDAO {
	List<ProductVO> getSearchList(ProductVO vo);
}
