package com.spring.huiloaelag.qna.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.huiloaelag.admin.ProductVO;
import com.spring.huiloaelag.admin.pageing.PagingVO;
import com.spring.huiloaelag.qna.CartVO;
import com.spring.huiloaelag.qna.QnaService;
import com.spring.huiloaelag.qna.QnaVO;
import com.spring.huiloaelag.qna.dao.QnaDAO;
import com.spring.huiloaelag.users.OrderVO;
import com.spring.huiloaelag.users.UserVO;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {
	@Autowired
	private QnaDAO QnaDAO;
	
	public QnaServiceImpl() {
		System.out.println(">> QnaServiceImpl() 객체 생성");
	}

	@Override
	public void insertQna(QnaVO vo) {
		QnaDAO.insertQna(vo);
		
	}

	@Override
	public void updateQna(QnaVO vo) {
		QnaDAO.updateQna(vo);
		
	}

	@Override
	public void deleteQna(QnaVO vo) {
		QnaDAO.deleteQna(vo);
	}

	@Override
	public QnaVO getQna(QnaVO vo) {
		return QnaDAO.getQna(vo);
	}

	@Override
	public List<QnaVO> getQnaList(QnaVO vo) {
		return QnaDAO.getQnaList(vo);
	}

	//지역별 카테고리!!
	@Override
	public List<ProductVO> getAreaList(String pLocal) {
		return QnaDAO.getAreaList(pLocal);
	}

	@Override
	public List<UserVO> getUserCode(String userId) {
		return QnaDAO.getUserCode(userId);
	}

	@Override
	public List<QnaVO> getQnAList(PagingVO pvo) {
		return QnaDAO.getQnAList(pvo);
	}
	
	//장바구니!!!
	@Override
	public List<CartVO> getCartList(int uCode) {
		return QnaDAO.getCartList(uCode);
	}

	@Override
	public void deleteCart(CartVO vo) {
		QnaDAO.deleteCart(vo);
		
	}
	
	@Override
	public void deleteCart(int cCode) {
		QnaDAO.deleteCart(cCode);
	}

	@Override
	public void deleteCartAll() {
		QnaDAO.deleteCartAll();
	}

	@Override
	public int minusCartCnt(CartVO vo) {
		return QnaDAO.minusCartCnt(vo);
	}

	@Override
	public int plusCartCnt(CartVO vo) {
		return QnaDAO.plusCartCnt(vo);
	}

	@Override
	public String getUserName(int uCode) {
		return QnaDAO.getUserName(uCode);
	}

	@Override
	public List<ProductVO> getProduct(int pCode) {
		return QnaDAO.getProduct(pCode);
	}

	@Override
	public void insertCart(CartVO vo) {
		QnaDAO.insertCart(vo);	
	}

	@Override
	public List<ProductVO> getCartOneList(int pCode) {
		return QnaDAO.getCartOneList(pCode);
	}

	@Override
	public List<UserVO> getUserOneList(int uCode) {
		return QnaDAO.getUserOneList(uCode);
	}

	@Override
	public void insertOrderList(OrderVO ovo) {
		QnaDAO.insertOrderList(ovo);
		
	}

	@Override
	public void deleteCartSuccess(int uCode) {
		QnaDAO.deleteCartSuccess(uCode);
		
	}

//	@Override
//	public int getQnaTotalCount() {
//		return QnaDAO.getQnaTotalCount();
//	}
//
//	@Override
//	public List<QnaVO> getQnaList(int begin, int end) {
//		return QnaDAO.getQnaList(begin, end);
//	}
//
//	@Override
//	public List<QnaVO> getQnaList(Map<String, Integer> map) {
//		return QnaDAO.getQnaList(map);
//	}

}
