package com.spring.huiloaelag.view.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.huiloaelag.admin.ProductVO;
import com.spring.huiloaelag.qna.QnaService;

@RestController
public class AreaAjaxController {
	@Autowired
	private QnaService qnaService;
	
	@RequestMapping("/getJsonAreaList.do")
	public List<ProductVO> getJsonAreaList(ProductVO vo,
			@RequestParam(value = "pLocal", required = false) String pLocal) {
		
		System.out.println("====== AreaAjaxController.getAjaxAreaList() 실행");
		System.out.println(pLocal);
		List<ProductVO> areaList = qnaService.getAreaList(pLocal);
		System.out.println("areaList : " + areaList);
		
		return areaList;
	}

}
