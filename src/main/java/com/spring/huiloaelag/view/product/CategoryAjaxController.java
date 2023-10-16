package com.spring.huiloaelag.view.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.huiloaelag.admin.ProductVO;
import com.spring.huiloaelag.product.CategoryService;
import com.spring.huiloaelag.product.SearchService;

//@Controller
@RestController // 클래스 내의 요청처리 결과가 모두 @ResponseBody 처리됨
public class CategoryAjaxController {
	@Autowired
	private CategoryService categoryService;

	@RequestMapping("/getJsonProductList.do")
	public String getAllList(Model model, int pType, @RequestParam(value="selectValue", defaultValue = "1") int selectValue,
			HttpSession session) {
		System.out.println(">>> 전체목록 보여주기");
		System.out.println("pType : " + pType);
		System.out.println("selectValue : " + selectValue);
		List<ProductVO> list2 = new ArrayList<ProductVO>();
		Map<String, Integer> categoryMap = new HashMap<String, Integer>();
		String pTypeTitle = "";
		String pTypeInfo = "";
		List<ProductVO> list = categoryService.getProductList(pType);
		
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

}
