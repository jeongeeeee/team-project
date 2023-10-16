package com.spring.huiloaelag.view.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.huiloaelag.admin.ProductService;
import com.spring.huiloaelag.admin.ProductVO;


@Controller
public class ProductAjaxController {
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/test.do")
	@ResponseBody
	public String getJsonProductList() {
		System.out.println("====== ProductAjaxController.getAjaxProductList() 실행");
		
//		List<ProductVO> productList = productService.getProductList(vo);
//		System.out.println("productList : " + productList);
		
		return "123";
	}
	
}










