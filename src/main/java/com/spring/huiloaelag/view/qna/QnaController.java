package com.spring.huiloaelag.view.qna;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.spring.huiloaelag.admin.ProductVO;
import com.spring.huiloaelag.admin.pageing.PagingVO;
import com.spring.huiloaelag.qna.CartVO;
import com.spring.huiloaelag.qna.QnaService;
import com.spring.huiloaelag.qna.QnaVO;
import com.spring.huiloaelag.users.OrderVO;
import com.spring.huiloaelag.users.UserVO;

@SessionAttributes("qna")
@Controller
public class QnaController {
	//@Autowired
	private QnaService QnaService;
	
	public QnaController() {
		System.out.println("==========> QnaController() 객체 생성");
	}
	
	@Autowired
	public QnaController(QnaService QnaService) {
		System.out.println("==========> QnaController(QnaService) 객체 생성");
		this.QnaService = QnaService;
	}
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		System.out.println("=====> Map searchConditionMap() 실행");
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("작성자", "NAME");
		return conditionMap;
	}

	// 리턴타입 : ModelAndView ---> String
	@RequestMapping("/getQna.do")
	public String getQna(QnaVO vo, Model model) {
		System.out.println(">>> 게시글 상세보기");
		System.out.println("vo : " + vo);
		
		QnaVO qna = QnaService.getQna(vo);
		model.addAttribute("qna", qna); // Model 객체 사용 View에 데이터 전달
		System.out.println("DB데이터 qna : " + qna);
		
		return "QnA/getQna";
	}	
	
	@RequestMapping("/getQnaList.do")
	public String getQnaList(QnaVO vo, Model model,
			@RequestParam(value = "searchDivision", required = false, defaultValue = "NAME") String searchDivision,
			@RequestParam(value = "searchKeyword", required = false, defaultValue = "") String searchKeyword,
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage) {
		System.out.println(">>> 게시글 전체 목록 보여주기");
		System.out.println("vo : " + vo);

		int total = 0;
		int cntPerPage = 10;
		vo.setSearchCondition(searchDivision);
		List<QnaVO> list = QnaService.getQnaList(vo);
		total = list.size();
		
		System.out.println(total);
		PagingVO pvo = new PagingVO(total, nowPage, cntPerPage, searchDivision, searchKeyword);

		List<QnaVO> resultList = QnaService.getQnAList(pvo);
		model.addAttribute("resultList", resultList);
		model.addAttribute("page",  pvo.getNowPageNum());
		model.addAttribute("startpage",  pvo.getStartPage());
		model.addAttribute("endpage",  pvo.getEndPage());
		model.addAttribute("lastPage", pvo.getLastPage());
		model.addAttribute("searchDivision", searchDivision);
		model.addAttribute("searchKeyword", searchKeyword);
		return "QnA/getQnaList";
	}
	
	@RequestMapping("/insertQna.do")
	public String insertQna(QnaVO vo, HttpSession session, HttpServletRequest request) throws IllegalStateException, IOException {
		System.out.println(">>> 게시글 입력처리");
		System.out.println("vo : " + vo);
		String userId = (String) session.getAttribute("userId");
		
		List<UserVO> list = QnaService.getUserCode(userId);
		
		vo.setuCode(list.get(0).getUcode());
		vo.setuName(list.get(0).getUname());
		QnaService.insertQna(vo);
		request.setAttribute("success", "1");
		return "redirect:/getQnaList.do";
	}
	
	@RequestMapping("/insertQnaGo.do")
	public String insertQnaGo() {
		return "QnA/insertQna";
	}

	@RequestMapping("/updateQna.do")
	public String updateQna(@ModelAttribute("qna") QnaVO vo, HttpServletRequest request) {
		System.out.println(">>> 게시글 수정처리");
		System.out.println("vo : " + vo);
		
		int qCode = vo.getqCode();
		System.out.println("qCode : " + qCode);
		
		QnaService.updateQna(vo);
		request.setAttribute("success", "1");
		return "redirect:/getQna.do?qCode=" + qCode;
	}
	
	@RequestMapping("/deleteQna.do")
	public String deleteQna(QnaVO vo, SessionStatus sessionStatus) {
		System.out.println(">>> 게시글 삭제처리");
		System.out.println("vo : " + vo);
		
		QnaService.deleteQna(vo);
		sessionStatus.setComplete(); //session 데이터 삭제
		
		return "redirect:/getQnaList.do";
	}
	
	//지역별 카테고리!!!
	@RequestMapping("/getAreaList.do")
	public String getAreaList(QnaVO vo, Model model) {
		System.out.println(">>> 지역별 목록 보여주기");
		System.out.println("vo : " + vo);

		List<QnaVO> list = QnaService.getQnaList(vo);
		model.addAttribute("qnaList", list);
		
		return "categoryArea/categoryArea";
	}
	
	@RequestMapping("/viewQnaGo.do")
	public String viewQnaGo() {
		return "QnA/viewQna";
	}
	@RequestMapping("/updateQnaGo.do")
	public String updateQnaGo() {
		return "QnA/updateQna";
	}
	
	//장바구니!!!
	@RequestMapping("/getCartList.do")
	public String getCartList(HttpSession session, Model model) {
		System.out.println(">>> 장바구니 전체 목록 보여주기");
		System.out.println(session.getAttribute("ucode"));
		int uCode = (int)(session.getAttribute("ucode"));
		System.out.println("uCode : " + uCode);
		
		List<CartVO> list = QnaService.getCartList(uCode);
		System.out.println("cartList : " + list);
		model.addAttribute("cartList", list);
		
		return "cart/cart";
	}
	@RequestMapping("/insertCart.do")
	public String insertCart(CartVO vo,
			@RequestParam(value="pCode") int pCode,
			@RequestParam(value="cCnt") int cCnt,
			@RequestParam(value="uCode") int uCode,
			HttpServletRequest request) {
		
		String userName = QnaService.getUserName(uCode);
		List<ProductVO> productList =  QnaService.getProduct(pCode);
		
		vo.setuCode(uCode);
		vo.setpCode(pCode);
		vo.setcCnt(cCnt);
		vo.setuName(userName);
		vo.setpName(productList.get(0).getPname());
		vo.setpPrice(productList.get(0).getPprice());
		
		System.out.println(vo);
		QnaService.insertCart(vo);
		request.setAttribute("success", "1");
		return "search/detail";
	}
	
	@RequestMapping("/deleteCart.do")
	public String deleteCart(CartVO vo, HttpServletRequest request, SessionStatus sessionStatus, HttpSession session) {
		System.out.println(">>> 장바구니 삭제처리");
		int cCode = Integer.parseInt(request.getParameter("cCode"));
		System.out.println("cCode : " + cCode);
		
		int uCode = (int)(session.getAttribute("ucode"));
		vo.setcCode(cCode);
		vo.setuCode(uCode);
		QnaService.deleteCart(vo);
		sessionStatus.setComplete();
		
		return "redirect:/getCartList.do?uCode="+uCode;
	}
	
	@RequestMapping("/deleteCartList.do")
	public String deleteCartList(HttpServletRequest request, SessionStatus sessionStatus) {
		System.out.println(">>> 장바구니 선택 삭제처리");
		
		int uCode = Integer.parseInt(request.getParameter("uCode"));
		System.out.println("uCode : " + uCode);
		String[] arrValues = request.getParameterValues("arr");
		int size = arrValues.length;
		
		System.out.println("size : " + size);
		for (String value : arrValues) {
			System.out.println("cCode : " + value);
			int cCode = Integer.parseInt(value);
			QnaService.deleteCart(cCode);
			sessionStatus.setComplete();
		}
		return "redirect:/getCartList.do?uCode="+uCode;
//			return "getCartList.do";
		//return "cart/cart";
	}
	
	@RequestMapping("/deleteCartAll.do")
	public String deleteCartAll(SessionStatus sessionStatus) {
		System.out.println(">>> 장바구니 전체 삭제처리");
		
		QnaService.deleteCartAll();
		sessionStatus.setComplete();
		//return "getCartList";
		return "cart/cart";
	}
	
	@RequestMapping("/minusCartCnt.do")
	public String minusCartCnt(CartVO vo) {
		System.out.println(">>> 장바구니 수량 뺄셈처리");
		System.out.println("vo : " + vo);
		
		QnaService.minusCartCnt(vo);
		
		return "cart/cart";
	}
	
	@RequestMapping("/plusCartCnt.do")
	public String plusCartCnt(CartVO vo) {
		System.out.println(">>> 장바구니 수량 덧셈처리");
		System.out.println("vo : " + vo);
		
		QnaService.plusCartCnt(vo);
		
		return "cart/cart";
	}
	
	@RequestMapping("/order.do")
	public String orderGo(HttpSession session, Model model) {
		int uCode = (int)(session.getAttribute("ucode"));
		List<CartVO> list = QnaService.getCartList(uCode);
		List<UserVO> userList = QnaService.getUserOneList(uCode);
		model.addAttribute("orderList", list);
		model.addAttribute("userList", userList);
		model.addAttribute("result", "order");
		return "cart/orderList";
	}
	
	//결제완료부분
	@RequestMapping("/payment.do")
	public String paymentSuccess(HttpSession session, OrderVO ovo, String couponName, int orderprice, String payment) {
		int uCode = (int)(session.getAttribute("ucode"));
		String coupon = "";
		List<CartVO> list = QnaService.getCartList(uCode);
		if (couponName == "coupon1") {
			coupon = "WELCOMTOHUILOAELAG";
		} else if (couponName == "coupon2") {
			coupon = "술마시는노트북";
		} else {
			coupon = "쿠폰없음";
		}
		for (int index = 0; index < list.size(); index++) {
			ovo.setuCode(uCode);
			ovo.setcOucode(coupon);
			ovo.setpCode(list.get(index).getpCode());
			ovo.setcCode(list.get(index).getcCode());
			ovo.setoCnt(list.get(index).getcCnt());
			ovo.setoPrice(orderprice);
			ovo.setoPay(payment);
			QnaService.insertOrderList(ovo);
		}
		QnaService.deleteCartSuccess(uCode);
		
		System.out.println(list);
		return "redirect:main.jsp";
	}
	
	//바로구매
	@RequestMapping("/credit.do")
	public String creditGo(Model model, @RequestParam(value="pCode") int pCode, HttpSession session,
			@RequestParam(value="cCnt") int cCnt) {
		int uCode = (int)session.getAttribute("ucode");
		List<ProductVO> productList = QnaService.getCartOneList(pCode);
		List<UserVO> userList = QnaService.getUserOneList(uCode);
		productList.get(0).setcCnt(cCnt);
		model.addAttribute("orderList", productList);
		model.addAttribute("userList", userList);
		model.addAttribute("result", "credit");
		
		return "cart/orderList";
	}
	
}
