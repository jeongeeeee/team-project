package com.spring.huiloaelag.product.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.huiloaelag.admin.ReviewVO;
import com.spring.huiloaelag.community.CommunityVO;
import com.spring.huiloaelag.product.MypageService;
import com.spring.huiloaelag.product.MypageVO;
import com.spring.huiloaelag.users.OrderVO;
import com.spring.huiloaelag.product.dao.MypageDAO;
import com.spring.huiloaelag.qna.QnaVO;
import com.spring.huiloaelag.users.UserVO;

@Service("mypageService")
public class MypageServiceImpl implements MypageService {
	@Autowired
	private MypageDAO mypageDAO;
	
	public MypageServiceImpl() {
		System.out.println(">> MypageServiceImpl() 객체 생성");
	}

	// 마이페이지
	// 주문내역 확인
	@Override
	public List<MypageVO> getOrderList(int uCode) {
		return mypageDAO.getOrderList(uCode);
	}

	//내가 작성한 커뮤니티
	@Override
	public List<CommunityVO> myCommunityList(int uCode) {
		return mypageDAO.myCommunityList(uCode);
	}
	@Override
	public void updateMyComm(CommunityVO vo) {
		mypageDAO.updateMyComm(vo);
	}
	@Override
	public void deleteMyComm(CommunityVO vo) {
		mypageDAO.deleteMyComm(vo);
	}
	
	//내가 작성한 문의
	@Override
	public List<QnaVO> myQnaList(int uCode) {
		return mypageDAO.myQnaList(uCode);
	}
	
	@Override
	public void deleteQnaList(QnaVO vo) {
		mypageDAO.deleteQnaList(vo);
	}
	
	@Override
	public void updateMyQna(QnaVO vo) {
		mypageDAO.updateMyQna(vo);
	}

	//회원정보
	@Override
	public List<UserVO> myUsersInfo(String userId) {
		return mypageDAO.myUsersInfo(userId);
	}

	@Override
	public void myUsersDelete(String userId) {
		mypageDAO.myUsersDelete(userId);
	}

	@Override
	public void myUsersUpdate(UserVO vo) {
		mypageDAO.myUsersUpdate(vo);
	}
	
	@Override
	public void insertReview(ReviewVO vo) {
		mypageDAO.insertReview(vo);
	}
	
	@Override
	public void updateReview(ReviewVO vo) {
		mypageDAO.updateReview(vo);
	}
	
	@Override
	public void deleteReview(ReviewVO vo) {
		mypageDAO.deleteReview(vo);
	}
	
	@Override
	public ReviewVO getReview(ReviewVO vo) {
		return mypageDAO.getReview(vo);
	}
	
	@Override
	public List<ReviewVO> getReviewList(String pCode) {
		return mypageDAO.getReviewList(pCode);
	}
	
	//마이페이지
	@Override
	public List<ReviewVO> getMyReview(int uCode) {
		return mypageDAO.getMyReview(uCode);
	}

	@Override
	public void updateUser(UserVO vo) {
		mypageDAO.updateUser(vo);
		
	}

}
