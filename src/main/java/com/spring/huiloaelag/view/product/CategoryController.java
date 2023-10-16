package com.spring.huiloaelag.view.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.huiloaelag.admin.ProductVO;
import com.spring.huiloaelag.admin.ReviewVO;
import com.spring.huiloaelag.product.CategoryService;

/*
@SessionAttributes : 같은 컨트롤러에서 모델(Model)객체 공유해서 사용하려는 경우 사용
	단, 현재(동일) 컨트롤러에서만 사용가능
	사용후에는 SessionStatus 객체의 setComplete() 메소드로 사용해제
*/
@SessionAttributes("category") // category 라는 이름의 Model 객체가 있으면 session 에 저장
@Controller
public class CategoryController {
	// @Autowired
	private CategoryService categoryService;

	public CategoryController() {
		System.out.println("==========> CategoryController() 객체 생성");
	}

	@Autowired
	public CategoryController(CategoryService categoryService) {
		System.out.println("==========> CategoryController(categoryService) 객체 생성");
		this.categoryService = categoryService;
	}

	@RequestMapping("/getAllList.do")
	public String getAllList(ProductVO vo, Model model) {
		System.out.println(">>> 전체목록 보여주기");
		System.out.println("vo : " + vo);

		List<ProductVO> list = categoryService.getAllList(vo);
		model.addAttribute("allList", list);
		System.out.println("list: " + list);

		return "search/allList";
	}

	@RequestMapping("/getProductList.do")
	public String getProductList(Model model, int pType, @RequestParam(value="selectValue", defaultValue = "1") int selectValue,
			HttpSession session) {
		System.out.println(">>> 카테고리 보여주기");
		String pTypeTitle = "";
		String pTypeInfo = "";
		List<ProductVO> list = categoryService.getProductList(pType);
		List<ProductVO> list2 = new ArrayList<ProductVO>();
		Map<String, Integer> categoryMap = new HashMap<String, Integer>();
		
		if (pType == 1) {
			pTypeTitle = "탁주";
			pTypeInfo = "맛있는 막걸리는 여기 다 있어요.";
			if (selectValue == 1) {
				list2.addAll(list);
			} else if (selectValue == 2) {
				
			} else if (selectValue == 3) {
				int pCode = pType * 100 + 1;
				
				categoryMap.put("start", pCode);
				pCode = pCode + list.size() - 1;
				categoryMap.put("end", pCode);
				categoryMap.put("sort", 1);
				list = categoryService.getProductSelectList(categoryMap);
				list2.addAll(list);
					
			} else if (selectValue == 4){
				int pCode = pType * 100 + 1;
				
				categoryMap.put("start", pCode);
				pCode = pCode + list.size() - 1;
				categoryMap.put("end", pCode);
				categoryMap.put("sort", 2);
				list = categoryService.getProductSelectList(categoryMap);
				list2.addAll(list);
			} else {
				int pCode[] = new int[100];
				System.out.println("1222");
				list2.addAll(list);
			}
			
			model.addAttribute("categoryList", list2);
			model.addAttribute("pTypeTitle", pTypeTitle);
			model.addAttribute("pTypeInfo", pTypeInfo);
			session.setAttribute("pTypeNumber", pType);
			System.out.println("categoryList : " + list2);

		} else if (pType == 2) {
			pTypeTitle = "약·청주";
			pTypeInfo = "맑고 깨끗한 술들이 모여있어요.";
			if (selectValue == 1) {
				list2.addAll(list);
			} else if (selectValue == 2) {
				
			} else if (selectValue == 3) {
				int pCode = pType * 100 + 1;
				
				categoryMap.put("start", pCode);
				pCode = pCode + list.size() - 1;
				categoryMap.put("end", pCode);
				categoryMap.put("sort", 1);
				list = categoryService.getProductSelectList(categoryMap);
				list2.addAll(list);
					
			} else if (selectValue == 4){
				int pCode = pType * 100 + 1;
				
				categoryMap.put("start", pCode);
				pCode = pCode + list.size() - 1;
				categoryMap.put("end", pCode);
				categoryMap.put("sort", 2);
				list = categoryService.getProductSelectList(categoryMap);
				list2.addAll(list);
			} else {
				int pCode[] = new int[100];
				System.out.println("1222");
				list2.addAll(list);
			}
			
			model.addAttribute("categoryList", list2);
			model.addAttribute("pTypeTitle", pTypeTitle);
			model.addAttribute("pTypeInfo", pTypeInfo);
			session.setAttribute("pTypeNumber", pType);
			System.out.println("categoryList : " + list2);

		} else if (pType == 3) {
			pTypeTitle = "과실주";
			pTypeInfo = "우리, 와인은 몰라도 분위기는 알잖아요.";
			if (selectValue == 1) {
				list2.addAll(list);
			} else if (selectValue == 2) {
				
			} else if (selectValue == 3) {
				int pCode = pType * 100 + 1;
				
				categoryMap.put("start", pCode);
				pCode = pCode + list.size() - 1;
				categoryMap.put("end", pCode);
				categoryMap.put("sort", 1);
				list = categoryService.getProductSelectList(categoryMap);
				list2.addAll(list);
					
			} else if (selectValue == 4){
				int pCode = pType * 100 + 1;
				
				categoryMap.put("start", pCode);
				pCode = pCode + list.size() - 1;
				categoryMap.put("end", pCode);
				categoryMap.put("sort", 2);
				list = categoryService.getProductSelectList(categoryMap);
				list2.addAll(list);
			} else {
				int pCode[] = new int[100];
				System.out.println("1222");
				list2.addAll(list);
			}
			
			model.addAttribute("categoryList", list2);
			model.addAttribute("pTypeTitle", pTypeTitle);
			model.addAttribute("pTypeInfo", pTypeInfo);
			session.setAttribute("pTypeNumber", pType);
			System.out.println("categoryList : " + list2);

		} else if (pType == 4) {
			pTypeTitle = "증류주";
			pTypeInfo = "소주도 취향 타는 거 알고 계셨어요?";
			if (selectValue == 1) {
				list2.addAll(list);
			} else if (selectValue == 2) {
				
			} else if (selectValue == 3) {
				int pCode = pType * 100 + 1;
				
				categoryMap.put("start", pCode);
				pCode = pCode + list.size() - 1;
				categoryMap.put("end", pCode);
				categoryMap.put("sort", 1);
				list = categoryService.getProductSelectList(categoryMap);
				list2.addAll(list);
					
			} else if (selectValue == 4){
				int pCode = pType * 100 + 1;
				
				categoryMap.put("start", pCode);
				pCode = pCode + list.size() - 1;
				categoryMap.put("end", pCode);
				categoryMap.put("sort", 2);
				list = categoryService.getProductSelectList(categoryMap);
				list2.addAll(list);
			} else {
				int pCode[] = new int[100];
				System.out.println("1222");
				list2.addAll(list);
			}
			
			model.addAttribute("categoryList", list2);
			model.addAttribute("pTypeTitle", pTypeTitle);
			model.addAttribute("pTypeInfo", pTypeInfo);
			session.setAttribute("pTypeNumber", pType);
			System.out.println("categoryList : " + list2);
		}

		return "search/category";
	}

	@RequestMapping("/detail.do")
	public String getDetail(String pCode, Model model) {
		System.out.println(">> 상세 정보 보여주기");
		System.out.println("pCode: " + pCode);

		List<ProductVO> list = categoryService.getDetail(pCode);
		model.addAttribute("detail", list);
		System.out.println("list: " + list);

		int reviewCount = categoryService.getReviewCount(pCode);
		model.addAttribute("reviewCount", reviewCount);
		
		List<ReviewVO> reviewList = categoryService.getReviewList(pCode);
		model.addAttribute("reviewList", reviewList);
		
		Integer reviewAVG = categoryService.getReviewAVG(pCode);
//		if null = 0
		model.addAttribute("reviewAVG", reviewAVG);
		return "search/detail";
	}
	@RequestMapping("/mainData.do")
	@ResponseBody
	public List<ProductVO> getMainData(Model model) {
		List<ProductVO> list = categoryService.getProductAll();
		List<ProductVO> list2 = new ArrayList<ProductVO>();
		double randomValue = Math.random();
		int chack[] = new int[4];
		int randomNum = 0;
		for (int index = 0; index < 4; index++) {
			ProductVO resultList = new ProductVO();
			randomValue = Math.random();
			randomNum = (int)(randomValue * (list.size()));
			chack[index] = randomNum;
			for (int i = 0; i < list2.size(); i++) {
				if (chack[i] == randomNum) {
					randomValue = Math.random();
					randomNum = (int)(randomValue * (list.size()));
					i = 0;
				}
			}
			resultList = list.get(randomNum);
			list2.add(resultList);
		}
		
		System.out.println(list2);
		return list2;
	}

}
