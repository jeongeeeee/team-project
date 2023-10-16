package com.spring.huiloaelag.product;

import java.util.List;

import com.spring.huiloaelag.admin.ProductVO;

public interface SearchService {
	List<ProductVO> getSearchList(ProductVO vo);
}
