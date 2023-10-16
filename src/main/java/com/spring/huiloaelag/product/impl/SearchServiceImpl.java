package com.spring.huiloaelag.product.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.huiloaelag.admin.ProductVO;
import com.spring.huiloaelag.product.SearchService;
import com.spring.huiloaelag.product.dao.SearchDAO;

@Service("searchService")
public class SearchServiceImpl implements SearchService {
	@Autowired
	private SearchDAO searchDAO;
	
	public SearchServiceImpl() {
		System.out.println(">> SearchServiceImpl() 객체 생성");
	}
	
	@Override
	public List<ProductVO> getSearchList(ProductVO vo) {
		return searchDAO.getSearchList(vo);
	}
}
