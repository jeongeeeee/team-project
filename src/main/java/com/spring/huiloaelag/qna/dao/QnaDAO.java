package com.spring.huiloaelag.qna.dao;

import java.util.List;
import java.util.Map;

import com.spring.huiloaelag.admin.ProductVO;
import com.spring.huiloaelag.admin.pageing.PagingVO;
import com.spring.huiloaelag.qna.CartVO;
import com.spring.huiloaelag.qna.QnaVO;
import com.spring.huiloaelag.users.OrderVO;
import com.spring.huiloaelag.users.UserVO;

public interface QnaDAO {
	void insertQna(QnaVO vo);
	void updateQna(QnaVO vo);
	void deleteQna(QnaVO vo);
	QnaVO getQna(QnaVO vo);
	List<QnaVO> getQnaList(QnaVO vo);
	
	// --------------------
	// 페이징처리
//	int getQnaTotalCount();
//	List<QnaVO> getQnaList(int begin, int end);
//	List<QnaVO> getQnaList(Map<String, Integer> map);
	
	//--------------------
	//지역별 카테고리!!!
	List<ProductVO> getAreaList(String pLocal);
	List<UserVO> getUserCode(String userId);
	List<QnaVO> getQnAList(PagingVO pvo);
	
	//장바구니!!!
	List<CartVO> getCartList(int uCode);
	void deleteCart(CartVO vo);
	void deleteCart(int cCode);
	void deleteCartAll();
	int minusCartCnt(CartVO vo);
	int plusCartCnt(CartVO vo);
	String getUserName(int uCode);
	List<ProductVO> getProduct(int pCode);
	void insertCart(CartVO vo);
	List<ProductVO> getCartOneList(int pCode);
	List<UserVO> getUserOneList(int uCode);
	void insertOrderList(OrderVO ovo);
	void deleteCartSuccess(int uCode);
}
