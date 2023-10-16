package com.spring.huiloaelag.product.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.huiloaelag.admin.ProductVO;
import com.spring.huiloaelag.admin.ReviewVO;
import com.spring.huiloaelag.product.CategoryService;
import com.spring.huiloaelag.product.dao.CategoryDAO;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDAO categoryDAO;

	public CategoryServiceImpl() {
		System.out.println(">> CategoryServiceImpl() 객체 생성");
	}

	@Override
	public List<ProductVO> getAllList(ProductVO vo) {
		return categoryDAO.getAllList(vo);
	}

	@Override
	public List<ProductVO> getProductList(int pCode) {
		return categoryDAO.getProductList(pCode);
	}

	@Override
	public List<ProductVO> getJsonProductList(int pCode) {
		return categoryDAO.getJsonProductList(pCode);
	}

	@Override
	public List<ProductVO> getDetail(String pCode) {
		return categoryDAO.getDetail(pCode);
	}

	@Override
	public int getReviewCount(String pCode) {
		return categoryDAO.getReviewCount(pCode);
	}

	@Override
	public Integer getReviewAVG(String pCode) {
		return categoryDAO.getReviewAVG(pCode);
	}

	@Override
	public List<ProductVO> getProductAll() {
		return categoryDAO.getProductAll();
	}

	@Override
	public List<ReviewVO> getReviewList(String pCode) {
		return categoryDAO.getReviewList(pCode);
	}

	@Override
	public List<ProductVO> getProductSelectList(Map<String, Integer> categoryMap) {
		return categoryDAO.getProductSelectList(categoryMap);
	}

}
