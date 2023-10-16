package com.spring.huiloaelag.admin;

import java.util.List;
import java.util.Map;

import com.spring.huiloaelag.admin.pageing.PagingVO;
import com.spring.huiloaelag.notify.NoticeVO;
import com.spring.huiloaelag.qna.QnaVO;
import com.spring.huiloaelag.users.UserVO;

public interface ProductService {
	List<ProductVO> getProductList(int num);
	List<ProductVO> getAjaxProductList(PagingVO vo);
	void productDelete(int pcode);
	void ProductInsert(ProductVO pvo);
	List<ProductVO> getProduct(int pcode);
	void productUpdate(ProductVO pvo);
	List<UserVO> getUsersList(PagingVO pvo);
	int getSearchDivisionTotal(PagingVO pvo);
	int getReviewCnt();
	List<ReviewVO> getAjaxReviewList(PagingVO p);
	int getQnACnt();
	List<QnaVO> getAjaxQnAList(PagingVO pvo);
	void reviewDelete(ReviewVO rvo);
	void memberDelete(int uCode);
	void questionDelete(int qCode);
	int getNoticeCnt();
	List<NoticeVO> getNoticeList(PagingVO pvo);
	void noticeDelete(int ncode);
	void noticeInsert(NoticeVO nvo);
	List<Map<String, Object>> getOrderHistory();
	int getMonthlyPrice(int index);
//	List<Map<String, Object>> getDatetimes(Map<String, String> map);
	List<ProductVO> getDatetimes(Map<String, String> map);
}
