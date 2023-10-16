package com.spring.huiloaelag.admin.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.huiloaelag.admin.ProductVO;
import com.spring.huiloaelag.admin.ReviewVO;
import com.spring.huiloaelag.admin.pageing.PagingVO;
import com.spring.huiloaelag.notify.NoticeVO;
import com.spring.huiloaelag.qna.QnaVO;
import com.spring.huiloaelag.users.UserVO;

@Repository
public class ProductDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ProductVO> getAlcoholList(int num) {
		List<ProductVO> list = mybatis.selectList("ProductDAO.getAlcoholList", num);
		return list;
	}
	
	public List<ProductVO> getAjaxAlcoholList(PagingVO vo) {
		List<ProductVO> list = mybatis.selectList("ProductDAO.getAlcoholAjaxList", vo);
		return list;
	}
	
	public void ProductInsert(ProductVO pvo) {
		mybatis.insert("ProductDAO.productInsert", pvo);
	}
	
	public void productDelete(int pcode) {
		mybatis.delete("ProductDAO.productDelete", pcode);
	}

	public List<ProductVO> getProduct(int pcode) {
		List<ProductVO> list = mybatis.selectList("ProductDAO.getProduct", pcode);
		return list;
	}

	public void productUpdate(ProductVO pvo) {
		mybatis.update("ProductDAO.productUpdate", pvo);
	}

	public List<UserVO> getUsersList(PagingVO pvo) {
		List<UserVO> userList = mybatis.selectList("ProductDAO.getUsersList", pvo);
		return userList;
	}

	public int getSearchDivisionTotal(PagingVO pvo) {
		int total = mybatis.selectOne("ProductDAO.getUsersTotal", pvo);
		return total;
	}

	public int getReviewCntTotal() {
		int total = mybatis.selectOne("ProductDAO.getReviewCntTotal");
		return total;
	}

	public List<ReviewVO> getAjaxReviewList(PagingVO p) {
		List<ReviewVO> result = mybatis.selectList("ProductDAO.getAjaxReviewList", p);
		return result;
	}

	public int getQnACnt() {
		int QnACnt = mybatis.selectOne("ProductDAO.getQnACnt");
		return QnACnt;
	}

	public List<QnaVO> getAjaxQnAList(PagingVO pvo) {
		List<QnaVO> list = mybatis.selectList("ProductDAO.getAjaxQnAList", pvo);
		return list;
	}

	public void reviewDelete(ReviewVO rvo) {
		System.out.println(rvo);
		mybatis.delete("ProductDAO.reviewDelete", rvo);
		
	}

	public void memberDelete(int uCode) {
		mybatis.delete("ProductDAO.memberDelete", uCode);
		
	}

	public void questionDelete(int qCode) {
		mybatis.delete("ProductDAO.questionDelete", qCode);
		
	}

	public int getNoticeCnt() {
		int cnt = mybatis.selectOne("ProductDAO.getNoticeCnt");
		return cnt;
	}

	public List<NoticeVO> getNoticeList(PagingVO pvo) {
		List<NoticeVO> list = mybatis.selectList("ProductDAO.getNoticeList", pvo);
		return list;
	}

	public void noticeDelete(int ncode) {
		mybatis.delete("ProductDAO.noticeDelete", ncode);
		
	}

	public void noticeInsert(NoticeVO nvo) {
		mybatis.insert("ProductDAO.noticeInsert", nvo);
		
	}

	public List<Map<String, Object>> getOrderHistory() {
		return mybatis.selectList("ProductDAO.getOrderHistory");
	}

	public int getMonthlyPrice(int index) {
		Integer result = mybatis.selectOne("ProductDAO.getMonthlyPrice", index);
		if (result == null) {
			result = 0;
		}
		return result;
	}

	public List<ProductVO> getDatetimes(Map<String, String> map) {
		return mybatis.selectList("ProductDAO.getDatetimes",map);
	}

//	public List<Map<String, Object>> getDatetimes(Map<String, String> map) {
//		List<Map<String, Object>> result = mybatis.selectList("ProductDAO.getDatetimes", map);
//		return result;
//	}


}
