package com.spring.huiloaelag.view.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.huiloaelag.admin.ProductVO;
import com.spring.huiloaelag.product.SearchService;

/*
@SessionAttributes : 같은 컨트롤러에서 모델(Model)객체 공유해서 사용하려는 경우 사용
	단, 현재(동일) 컨트롤러에서만 사용가능
	사용후에는 SessionStatus 객체의 setComplete() 메소드로 사용해제
*/
@SessionAttributes("search") // search 라는 이름의 Model 객체가 있으면 session 에 저장
@Controller
public class SearchController {
	//@Autowired
	private SearchService searchService;
	
	public SearchController() {
		System.out.println("==========> SearchController() 객체 생성");
	}
	
	@Autowired
	public SearchController(SearchService searchService) {
		System.out.println("==========> SearchController(searchService) 객체 생성");
		this.searchService = searchService;
	}
	
	@RequestMapping("/getSearchList.do")
	public String getSearchList(ProductVO vo, Model model, HttpServletRequest rq) {
		System.out.println(">>> 검색 목록 보여주기");
		System.out.println("vo : " + vo);

		List<ProductVO> list = searchService.getSearchList(vo);
		model.addAttribute("searchList", list);
		System.out.println("list: " + list);
		
		String searchKeyword = rq.getParameter("searchKeyword");
		model.addAttribute("searchKeyword", searchKeyword);
		System.out.println(searchKeyword);
		return "search/search";
	}
	
}
