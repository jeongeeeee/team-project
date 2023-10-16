package com.spring.huiloaelag.admin.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.huiloaelag.admin.ProductService;
import com.spring.huiloaelag.admin.ProductVO;
import com.spring.huiloaelag.admin.ReviewVO;
import com.spring.huiloaelag.admin.pageing.PagingVO;
import com.spring.huiloaelag.notify.NoticeVO;
import com.spring.huiloaelag.qna.QnaVO;
import com.spring.huiloaelag.users.UserVO;

@Service("productService")
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productDAO;
	
	@Override	
	public List<ProductVO> getProductList(int num) {
		List<ProductVO> list = productDAO.getAlcoholList(num);
		return list;
	}

	@Override
	public void ProductInsert(ProductVO pvo) {
		productDAO.ProductInsert(pvo);
	}

	@Override
	public List<ProductVO> getAjaxProductList(PagingVO vo) {
		List<ProductVO> list = productDAO.getAjaxAlcoholList(vo);
		return list;
	}

	@Override
	public void productDelete(int pcode) {
		productDAO.productDelete(pcode);
	}

	@Override
	public List<ProductVO> getProduct(int pcode) {
		List<ProductVO> list = productDAO.getProduct(pcode);
		return list;
	}

	@Override
	public void productUpdate(ProductVO pvo) {
		productDAO.productUpdate(pvo);
		
	}

	@Override
	public List<UserVO> getUsersList(PagingVO pvo) {
		List<UserVO> userList = productDAO.getUsersList(pvo);
		return userList;
	}

	@Override
	public int getSearchDivisionTotal(PagingVO pvo) {
		int total = productDAO.getSearchDivisionTotal(pvo);
		return total;
	}

	@Override
	public int getReviewCnt() {
		int total = productDAO.getReviewCntTotal();
		return total;
	}

	@Override
	public List<ReviewVO> getAjaxReviewList(PagingVO p) {
		List<ReviewVO> result = productDAO.getAjaxReviewList(p);
		return result;
	}

	@Override
	public int getQnACnt() {
		int QnACnt = productDAO.getQnACnt();
		return QnACnt;
	}

	@Override
	public List<QnaVO> getAjaxQnAList(PagingVO pvo) {
		List<QnaVO> list = productDAO.getAjaxQnAList(pvo);
		return list;
	}

	@Override
	public void reviewDelete(ReviewVO rvo) {
		productDAO.reviewDelete(rvo);
	}

	@Override
	public void memberDelete(int uCode) {
		productDAO.memberDelete(uCode);
		
	}

	@Override
	public void questionDelete(int qCode) {
		productDAO.questionDelete(qCode);
		
	}

	@Override
	public int getNoticeCnt() {
		int cnt = productDAO.getNoticeCnt();
		return cnt;
	}

	@Override
	public List<NoticeVO> getNoticeList(PagingVO pvo) {
		List<NoticeVO> list = productDAO.getNoticeList(pvo);
		return list;
	}

	@Override
	public void noticeDelete(int ncode) {
		productDAO.noticeDelete(ncode);
		
	}

	@Override
	public void noticeInsert(NoticeVO nvo) {
		productDAO.noticeInsert(nvo);
		
	}

	@Override
	public List<Map<String, Object>> getOrderHistory() {
		List<Map<String, Object>> list = productDAO.getOrderHistory();
		return list;
	}

	@Override
	public int getMonthlyPrice(int index) {
		int resultPrice =  productDAO.getMonthlyPrice(index);
		return resultPrice;
	}

	@Override
	public List<ProductVO> getDatetimes(Map<String, String> map) {
		List<ProductVO> result = productDAO.getDatetimes(map);
		return result;
	}

//	@Override
//	public List<Map<String, Object>> getDatetimes(Map<String, String> map) {
//		List<Map<String, Object>> result = productDAO.getDatetimes(map);
//		return result;
//	}


}
