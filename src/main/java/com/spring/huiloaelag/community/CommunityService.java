package com.spring.huiloaelag.community;

import java.util.List;

import com.spring.huiloaelag.admin.pageing.PagingVO;

public interface CommunityService {
	//게시판 기능
	void insertCommunity(CommunityVO vo);
	void updateCommunity(CommunityVO vo);
	void deleteCommunity(CommunityVO vo);
	CommunityVO getCommunity(CommunityVO vo);
	List<CommunityVO> getCommunityList(CommunityVO vo);
	
	//추천(좋아요) 기능
	void insertLike(String mCode);
	int selectLike(String mCode);
	
	//댓글
	void insertComment(CommentsVO vo);
	void updateComment(CommentsVO vo);
	int deleteComment(CommentsVO vo);
	String getComment(String cmtCode);
	List<CommentsVO> getCommentsList(CommunityVO vo);
	int getUserCode(String userId);
	List<CommunityVO> getCommunityListAll(PagingVO pvo);
	
}

