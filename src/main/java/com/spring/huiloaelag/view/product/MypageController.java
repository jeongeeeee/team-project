package com.spring.huiloaelag.view.product;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.spring.huiloaelag.admin.ProductVO;
import com.spring.huiloaelag.admin.ReviewVO;
import com.spring.huiloaelag.community.CommunityVO;
import com.spring.huiloaelag.product.MypageService;
import com.spring.huiloaelag.product.MypageVO;
import com.spring.huiloaelag.users.OrderVO;
import com.spring.huiloaelag.qna.QnaVO;
import com.spring.huiloaelag.users.UserVO;

/*
@SessionAttributes : 같은 컨트롤러에서 모델(Model)객체 공유해서 사용하려는 경우 사용
	단, 현재(동일) 컨트롤러에서만 사용가능
	사용후에는 SessionStatus 객체의 setComplete() 메소드로 사용해제
*/
@SessionAttributes("mypage")
@Controller
public class MypageController {
	//@Autowired
	private MypageService mypageService;
	
	public MypageController() {
		System.out.println("==========> MypageController() 객체 생성");
	}
	
	@Autowired
	public MypageController(MypageService mypageService) {
		System.out.println("==========> MypageController(mypageService) 객체 생성");
		this.mypageService = mypageService;
	}
	
	@RequestMapping("/goMypageList.do")
	public String goMypageOrderList(HttpSession session, HttpServletRequest request) {
		System.out.println(">>> 마이페이지로 이동");
		String userId = (String) session.getAttribute("userId");
		
		List<UserVO> uvo = mypageService.myUsersInfo(userId);
		request.setAttribute("userPwd", uvo.get(0).getUserPwd());
		System.out.println(request.getAttribute("userPwd"));
		return "search/mypageTest";
	}
	
	@RequestMapping("/mypageOrder.do")
	@ResponseBody
	public List<MypageVO> getOrderList(OrderVO vo, 
			HttpSession session,
			@RequestParam(value="data") int data, Model model) {
		System.out.println(">>> 마이페이지 주문 목록 보여주기");
		System.out.println("vo : " + vo);
		int uCode = (int) session.getAttribute("ucode");
		
		List<MypageVO> orderList = mypageService.getOrderList(uCode);
		model.addAttribute("orderList",orderList);
		model.addAttribute("data",data);
		System.out.println(orderList);
		//List<ProductVO> productList = mypageService.getProductList();
		
//		Map<String, Object> mapList = new HashMap<String, Object>();
//		mapList.put("orderList", orderList);
//		mapList.put("data", data);
		
		return orderList;
	}
	
	@RequestMapping("/myCommunityList.do")
	@ResponseBody
	public List<CommunityVO> myCommunityList(CommunityVO vo,
			HttpSession session, Model model,
			@RequestParam(value="data") int data) {
		System.out.println(">>> 마이페이지 커뮤니티 목록 보여주기");
		int uCode = (int) session.getAttribute("ucode");
		System.out.println("uCode : " + uCode);
		System.out.println("data : " + data);
		
		System.out.println("vo : " + vo);
		List<CommunityVO> list = mypageService.myCommunityList(uCode);
		
		model.addAttribute("communityList", list);
		model.addAttribute("data", data);
		
		System.out.println("communityList : " + list);
		
		return list;
	}
	//커뮤니티 수정
		@RequestMapping("/updateMyComm.do")
		@ResponseBody
		public void updateMyComm(CommunityVO vo) {
			System.out.println(">>> 커뮤니티 게시글 수정처리");
			
			mypageService.updateMyComm(vo);
			
		}
		
		//커뮤니티 삭제
		@RequestMapping("/deleteMyComm.do")
		@ResponseBody
		public void deleteMyComm(CommunityVO vo, HttpServletRequest request) {
			System.out.println(">>> 커뮤니티 게시글 삭제처리");
			
			mypageService.deleteMyComm(vo);
		}
		
		@RequestMapping("/goUpdateMyComm.do")
		public String goUpdateMyComm(HttpSession session, HttpServletRequest request) {
			
			return "search/updateComm";
		}
	
//	//커뮤니티 수정
//	@RequestMapping("/myCommunityUpdate.do")
//	public String myCommunityUpdate(@ModelAttribute("community") CommunityVO vo) {
//		System.out.println(">>> 게시글 수정처리");
//		System.out.println("vo : " + vo);
//		
//		mypageService.myCommunityUpdate(vo);
//		
//		return "search/mypageTest";
//	}
//	//커뮤니티 삭제
//	@RequestMapping("/myCommunityDelete.do")
//	public String myCommunityDelete(CommunityVO vo, SessionStatus sessionStatus) {
//		System.out.println(">>> 게시글 삭제처리");
//		System.out.println("vo : " + vo);
//		
//		mypageService.myCommunityDelete(vo);
//		sessionStatus.setComplete(); //session 데이터 삭제
//		
//		return "goMypageList.do";
//		}
	
	//Qna
	@RequestMapping("/myQnaList.do")
	@ResponseBody
	public List<QnaVO> myQnaList(QnaVO vo,
			HttpSession session, Model model,
			@RequestParam(value="data") int data) {
		System.out.println(">>> 마이페이지 문의 목록 보여주기");
		int uCode = (int) session.getAttribute("ucode");
		System.out.println("uCode : " + uCode);
		System.out.println("data : " + data);
		
		List<QnaVO> list = mypageService.myQnaList(uCode);
//		model.addAttribute("qnalist", list);
//		System.out.println("vo : " + vo);
		System.out.println("list : " + list);
		
		return list;
//		int uCode = (int) session.getAttribute("ucode");
//		System.out.println("uCode : " + uCode);
//		System.out.println("data : " + data);
//		
//		System.out.println("vo : " + vo);
//		List<QnaVO> list = mypageService.myQnaList(uCode);
//		
//		model.addAttribute("communityList", list);
//		model.addAttribute("data", data);
//		
//		System.out.println("communityList : " + list);
//		
//		return list;
	}
	
	@RequestMapping("/updateMyQna.do")
	public String updateMyQna(QnaVO vo) {
		System.out.println(">>> 마이페이지 문의 수정처리");
		System.out.println(vo);
		mypageService.updateMyQna(vo);
		return "search/mypageTest";
	}
	
	@RequestMapping("/deleteQnaList.do")
	@ResponseBody
	public void deleteQnaList(QnaVO vo, HttpServletRequest request) {
		System.out.println(">>> 마이페이지 문의 삭제처리");
		
		mypageService.deleteQnaList(vo);
	}
	
	@RequestMapping("/goupdateMyQna.do")
	public String goupdateMyQna(HttpSession session, HttpServletRequest request) {
		
		return "search/updateQna";
	}
	
	@RequestMapping("/myUsersInfo.do")
	@ResponseBody
	public List<UserVO> updateUsers(UserVO vo, HttpSession session) {
		System.out.println(">>> 마이페이지 회원정보 보여주기");
		String userId = (String) session.getAttribute("userId");
		System.out.println("userId : " + userId);
		
		List<UserVO> uvo = mypageService.myUsersInfo(userId);
		System.out.println(uvo);
		
		return uvo;
	}
	
	@RequestMapping("/myUsersDelete.do")
	public String updateUsers(UserVO vo, SessionStatus sessionStatus, HttpSession session) {
		System.out.println(">>> 마이페이지 회원탈퇴 처리");
		String userId = (String) session.getAttribute("userId");
		
		mypageService.myUsersDelete(userId);
		sessionStatus.setComplete();
		session.removeAttribute("userId");
		session.removeAttribute("ucode");
		session.removeAttribute("unick");
		return "redirect:main.jsp";
	}
	
	@RequestMapping("/myUsersUpdate.do")
	public String deleteUsers(UserVO vo) {
		System.out.println(">>> 마이페이지 회원수정 처리");
		
		mypageService.myUsersUpdate(vo);
		System.out.println("vo : " + vo);
		
		
		return "search/mypageTest";
	}
	
	//jsp페이지 이동 처리
	@RequestMapping("/insertReivewGo.do")
	public String insertCommunityGo(HttpSession session, HttpServletRequest request) {
	
		return "search/insertReview";
	}
	
	@RequestMapping("/updateReviewGO.do")
	public String updateReview(HttpSession session, HttpServletRequest request) {
	
		return "search/updateReview";
	}
	
	@RequestMapping("/getReview.do")
	public String getReview(ReviewVO vo, Model model) {
		System.out.println(">>> 리뷰 한개 보기");
		System.out.println("vo : " + vo);
		
		ReviewVO review = mypageService.getReview(vo);
		model.addAttribute("review", review); // Model 객체 사용 View에 데이터 전달
		System.out.println("DB데이터 review : " + review);
		
		//return "review.jsp";
		return "updateReview.jsp";
	}	

	@RequestMapping("/getReviewList.do")
	public String getReviewList(String pCode, Model model) {
		System.out.println(">>> 게시글 리뷰 목록 보여주기");
		System.out.println("pCode : " + pCode);

		List<ReviewVO> list = mypageService.getReviewList(pCode);
		model.addAttribute("reviewList", list);
		
		return "review.jsp";
	}
	
	@RequestMapping("/insertReview.do")
	public String insertReview(ReviewVO vo) throws IllegalStateException, IOException {
		System.out.println(">>> 리뷰 입력처리");
		System.out.println("vo : " + vo);
		
		mypageService.insertReview(vo);

		return "search/mypageTest";
	}

	@RequestMapping("/deleteReview.do")
	@ResponseBody
	public void deleteReview(ReviewVO vo) throws IllegalStateException, IOException {
		System.out.println(">>> 리뷰 삭제처리");
		System.out.println("vo : " + vo);
		
		mypageService.deleteReview(vo);
		
		//return "삭제되었습니다";
	}
	
	@RequestMapping("/updateReview.do")
	public String updateReview(@ModelAttribute("review") ReviewVO vo) {
		System.out.println(">>> 리뷰 수정처리");
		System.out.println("vo : " + vo);
		
		mypageService.updateReview(vo);
		
		return "search/mypageTest";
	}
	
	@RequestMapping("/myReviewList.do")
	@ResponseBody
	public List<ReviewVO> getMyReview(ReviewVO vo, HttpSession session, Model model,
			@RequestParam(value="data") int data) {
	      	System.out.println(">>> 마이페이지 리뷰 목록 보여주기");
	        int uCode = (int) session.getAttribute("ucode");
	        System.out.println("uCode : " + uCode);
	        System.out.println("data : " + data);

	        List<ReviewVO> list = mypageService.getMyReview(uCode);
	        //model.addAttribute("myReviewList", list);
	        System.out.println("getMyReview : " + list);
	      
	       return list;
	   }
	
	@RequestMapping("/updateUser.do")
	public String updateUser(UserVO vo, HttpSession session) {
		System.out.println(vo);
		int uCode = (int) session.getAttribute("ucode");
		vo.setUcode(uCode);
		System.out.println(vo);
		mypageService.updateUser(vo);
		
		return "search/mypageTest";
	}
	
}
