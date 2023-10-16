package com.spring.huiloaelag.product.dao;

import java.util.List;

import com.spring.huiloaelag.admin.ReviewVO;
import com.spring.huiloaelag.community.CommunityVO;
import com.spring.huiloaelag.product.MypageVO;
import com.spring.huiloaelag.users.OrderVO;
import com.spring.huiloaelag.qna.QnaVO;
import com.spring.huiloaelag.users.UserVO;

public interface MypageDAO {

	// 마이페이지
		// 주문내역 확인
		List<MypageVO> getOrderList(int uCode);
		
		//내가 작성한 커뮤니티
		List<CommunityVO> myCommunityList(int uCode);
		void updateMyComm(CommunityVO vo);
		void deleteMyComm(CommunityVO vo);
		
		//내가 작성한 문의
		List<QnaVO> myQnaList(int uCode);
		void deleteQnaList(QnaVO vo);
		void updateMyQna(QnaVO vo);
		
		//회원정보
		List<UserVO> myUsersInfo(String userId);
		//회원탈퇴
		void myUsersDelete(String userId);
		//회원수정
		void myUsersUpdate(UserVO vo);
		
		//리뷰
		void insertReview(ReviewVO vo);
		void updateReview(ReviewVO vo);
		int deleteReview(ReviewVO vo);
		ReviewVO getReview(ReviewVO vo);
		List<ReviewVO> getReviewList(String pCode);
		List<ReviewVO> getMyReview(int uCode);

		void updateUser(UserVO vo);
}
