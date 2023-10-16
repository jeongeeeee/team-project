package com.spring.huiloaelag.community.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.huiloaelag.admin.pageing.PagingVO;
import com.spring.huiloaelag.community.CommentsVO;
import com.spring.huiloaelag.community.CommunityService;
import com.spring.huiloaelag.community.CommunityVO;
import com.spring.huiloaelag.community.dao.CommunityDAO;

//@Service : @Component 상속확장 어노테이션
//           비즈니스 로직 처리 서비스 영역에 사용
@Service("CommunityService")
public class CommunityServiceImpl implements CommunityService {
	@Autowired // 타입이 일치하는 객체(인스턴스) 주입
	private CommunityDAO communityDAO;

	public CommunityServiceImpl() {
		
	}
	
	@Override
	public void insertCommunity(CommunityVO vo) {
		communityDAO.insertCommunity(vo);
	}

	@Override
	public void updateCommunity(CommunityVO vo) {
		communityDAO.updateCommunity(vo);
	}

	@Override
	public void deleteCommunity(CommunityVO vo) {
		communityDAO.deleteCommunity(vo);
	}

	@Override
	public CommunityVO getCommunity(CommunityVO vo) {
		return communityDAO.getCommunity(vo);
	}   

	@Override
	public List<CommunityVO> getCommunityList(CommunityVO vo) {
		return communityDAO.getCommunityList(vo);
	}
	
	@Override
	public void insertLike(String mCode) {
		communityDAO.insertLike(mCode);
	}
	
	@Override
	public int selectLike(String mCode) {
		return communityDAO.selectLike(mCode);
	}
	
	@Override
	public void insertComment(CommentsVO vo) {
		communityDAO.insertComment(vo);
	}
	
	@Override
	public void updateComment(CommentsVO vo) {
		communityDAO.updateComment(vo);
	}
	
	@Override
	public int deleteComment(CommentsVO vo) {
		return communityDAO.deleteComment(vo);
	}
	
	@Override
	public String getComment(String cmtCode) {
		return communityDAO.getComment(cmtCode);
	}
	
	@Override
	public List<CommentsVO> getCommentsList(CommunityVO vo) {
		return communityDAO.getCommentsList(vo);
	}

	@Override
	public int getUserCode(String userId) {
		return communityDAO.getUserCode(userId);
	}

	@Override
	public List<CommunityVO> getCommunityListAll(PagingVO pvo) {
		return communityDAO.getCommunityListAll(pvo);
	}
	

}



