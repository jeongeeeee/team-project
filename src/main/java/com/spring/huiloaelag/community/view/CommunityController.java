package com.spring.huiloaelag.community.view;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.spring.huiloaelag.admin.pageing.PagingVO;
import com.spring.huiloaelag.community.CommentsVO;
import com.spring.huiloaelag.community.CommunityService;
import com.spring.huiloaelag.community.CommunityVO;

//@SessionAttributes("community")
@Controller
public class CommunityController {
	//@Autowired
	private CommunityService communityService;
		
	public CommunityController() {
		System.out.println("==========> CommunityController() 객체 생성");
	}
		
	@Autowired
	public CommunityController(CommunityService communityService) {
		System.out.println("==========> CommunityController(communityService) 객체 생성");
		this.communityService = communityService;
	}
	//검색
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		System.out.println("=====> Map searchConditionMap() 실행");
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "MTITLE");
		conditionMap.put("내용", "MCONTENT");
		return conditionMap;
	}
	
	//커뮤니티 상세보기
	@RequestMapping("/getCommunity.do")
	public String getCommunity(CommunityVO vo, Model model) {
		System.out.println(">>> 게시글 상세보기");
		System.out.println("vo : " + vo);
		
		CommunityVO community = communityService.getCommunity(vo);
		model.addAttribute("community", community); // Model 객체 사용 View에 데이터 전달
		System.out.println("DB데이터 community : " + community);
		
		//댓글 보여주기
		List<CommentsVO> list = communityService.getCommentsList(vo);
		model.addAttribute("commentsList", list);
		
		return "community/getCommunity";
	}	
	//커뮤니티 전체 목록
	@RequestMapping("/getCommunityList.do")
	public String getCommunityList(CommunityVO vo, Model model,
			@RequestParam(value = "searchDivision", required = false, defaultValue = "MTITLE") String searchDivision,
			@RequestParam(value = "searchKeyword", required = false, defaultValue = "") String searchKeyword,
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage) {
		System.out.println(">>> 게시글 전체 목록 보여주기");
		System.out.println("vo : " + vo);
		
		int total = 0;
		int cntPerPage = 10;
		vo.setSearchDivision(searchDivision);
		vo.setmContent(searchKeyword);
		List<CommunityVO> list = communityService.getCommunityList(vo);
		System.out.println("vo : " + vo);
		total = list.size();
		PagingVO pvo = new PagingVO(total, nowPage, cntPerPage, searchDivision, searchKeyword);
		System.out.println(list);
		System.out.println(total);
		List<CommunityVO> CommunityList = communityService.getCommunityListAll(pvo);
		model.addAttribute("CommunityList", CommunityList);
		System.out.println("communityList : "+ CommunityList);
		model.addAttribute("page",  pvo.getNowPageNum());
		model.addAttribute("startpage",  pvo.getStartPage());
		model.addAttribute("endpage",  pvo.getEndPage());
		model.addAttribute("lastPage", pvo.getLastPage());
		model.addAttribute("searchDivision", searchDivision);
		model.addAttribute("searchKeyword", searchKeyword);
		
		return "community/getCommunityList";
	}
	//커뮤니티 입력
	@RequestMapping("/insertCommunity.do")
	public String insertCommunity(CommunityVO vo, HttpServletRequest request, HttpSession session) throws IllegalStateException, IOException {
		System.out.println(">>> 게시글 입력처리");
		System.out.println("vo : " + vo);
		String userId = (String) session.getAttribute("userId");
		int uCode = communityService.getUserCode(userId);
		vo.setuCode(uCode);
		
		communityService.insertCommunity(vo);
		System.out.println(vo);
		request.setAttribute("success", "1");
		//return "community/insertCommunity";
		return "redirect:/getCommunityList.do";
	}
	//커뮤니티 수정
	@RequestMapping("/updateCommunity.do")
	public String updateCommunity(@ModelAttribute("community") CommunityVO vo) {
		System.out.println(">>> 게시글 수정처리");
		System.out.println("vo : " + vo);
		
		communityService.updateCommunity(vo);
		
		return "redirect:/getCommunityList.do";
	}
	//커뮤니티 삭제
	@RequestMapping("/deleteCommunity.do")
	public String deleteCommunity(CommunityVO vo, SessionStatus sessionStatus) {
		System.out.println(">>> 게시글 삭제처리");
		System.out.println("vo : " + vo);
		
		communityService.deleteCommunity(vo);
		sessionStatus.setComplete(); //session 데이터 삭제
		
		return "redirect:/getCommunityList.do";
	}
	//댓글 입력
	@RequestMapping(value = "/insertComment.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String insertComments(CommentsVO vo,HttpSession session) {
		System.out.println(">>> 댓글 입력처리");
		System.out.println("vo : " + vo);
		
		int uCode = (int) session.getAttribute("ucode");
		vo.setuCode(uCode);
		
		communityService.insertComment(vo);
		String success= "댓글이 등록 되었습니다";
		return success;
	}
	//댓글 삭제
	@RequestMapping(value="/deleteComment.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String deleteCommunity(CommentsVO vo, SessionStatus sessionStatus, @RequestParam(value="cmtPwd") int cmtPwd) {
		System.out.println(">>> 댓글 삭제처리");
		System.out.println("vo : " + vo);
		vo.setCmtPwd(cmtPwd);
		int result = communityService.deleteComment(vo);
		sessionStatus.setComplete(); //session 데이터 삭제
		
		return "삭제되었습니다";
		//return "getCommunity.do";
	}
	//댓글 수정
	@RequestMapping(value="/updateComment.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String updateComment(CommentsVO vo) {
		System.out.println(">>> 댓글 수정처리");
		System.out.println("vo : " + vo);
		
		communityService.updateComment(vo);
		return "댓글 수정이 완료되었습니다";
	}
	//댓글의 비밀번호 받아오기(수정시에 사용)
	@ResponseBody
	@RequestMapping("/getComment.do")
	public String getComment(String cmtCode, Model model) {
		System.out.println(">>> 댓글 하나보기");
		System.out.println("cmtCode : " + cmtCode);
		
		String comment = communityService.getComment(cmtCode);
		model.addAttribute("comment", comment); // Model 객체 사용 View에 데이터 전달
		System.out.println("DB데이터 comment : " + comment);

		return comment.toString();
	}
	
	//jsp페이지 이동 처리
	@RequestMapping("/insertCommunityGo.do")
	public String insertCommunityGo(HttpSession session, HttpServletRequest request) {
		String userId = (String) session.getAttribute("userId");
		if (userId == null) {
			request.setAttribute("msg", "1");
			System.out.println(request.getAttribute("msg"));
			return "redirect:/getCommunityList.do";
		}
		
		return "community/insertCommunity";
	}
	@RequestMapping("/updateCommunityGo.do")
	public String updateCommunityGo() {
		return "community/updateCommunity";
	}
	@RequestMapping("/viewCommunityGo.do")
	public String viewCommunityGo(CommunityVO vo) {
		System.out.println(vo);
		return "community/viewCommunity";
	}
    
}
