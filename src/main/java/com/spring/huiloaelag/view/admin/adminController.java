package com.spring.huiloaelag.view.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.huiloaelag.admin.ProductService;
import com.spring.huiloaelag.admin.ProductVO;
import com.spring.huiloaelag.admin.ReviewVO;
import com.spring.huiloaelag.admin.pageing.PagingVO;
import com.spring.huiloaelag.notify.NoticeVO;
import com.spring.huiloaelag.qna.QnaVO;
import com.spring.huiloaelag.users.OrderVO;
import com.spring.huiloaelag.users.UserVO;

@Controller
public class adminController {
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/period.do")
	@ResponseBody
	public Map<String, Object> datetimes(Model model, @RequestParam(value = "startDate", required = false) String startDate, @RequestParam(value = "endDate", required = false) String endDate) {
       System.out.println(startDate + "," + endDate);
       Map<String, String> map = new HashMap<String, String>();
       Map<String, Object> mapList = new HashMap<String, Object>();
       map.put("startDate", startDate);
       map.put("endDate", endDate);
       List<ProductVO> productList = productService.getDatetimes(map);
       mapList.put("productList", productList);
       
       //List<Map<String, Object>> list = productService.getDatetimes(map);
       return mapList;
	}
	
	@RequestMapping("/product.do")
	@ResponseBody
	public Map<String, Object> getAlcoholList(Model model,@RequestParam(value = "divisionNum", required = false) int divisionNum, @RequestParam(value = "pageNum", required = false) int pageNum) {
		List<ProductVO> list = productService.getProductList(divisionNum);
		int total = list.size();
		int cntPerPage = 10;
		PagingVO p = new PagingVO(total, pageNum, cntPerPage, divisionNum);

		List<ProductVO> resultList = productService.getAjaxProductList(p);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("resultList", resultList);
		result.put("page",  p.getNowPageNum());
	    result.put("startpage",  p.getStartPage());
	    result.put("endpage",  p.getEndPage());
	    result.put("lastPage", p.getLastPage());
	    System.out.println(result);
	    System.out.println(p);
		return result;
	}
	
	@RequestMapping("/product_state.do")
	public String goProductState(Model model,int state, @RequestParam(value = "pcode", required = false) int pcode) {
		System.out.println(state);
		System.out.println(pcode);
		if (state == 1) {
			//insert
			return "admin/productInsert";
		} else if (state == 2) {
			List<ProductVO> list = productService.getProduct(pcode);
			model.addAttribute("productOne", list);
			return "admin/productUpdate";
		} else if (state == 3) {
			productService.productDelete(pcode);
		} else {
			//화면 출력으로 잘못입력되어 되돌아간다는 문구 적어두기
			
		}
		return "admin/adminPage";
	}
	
	@RequestMapping("/productInsert.do")
	public String ProductInset(ProductVO pvo, 
			HttpServletRequest request,
			@RequestParam(value = "pcodeDivision", required = false) int pcodeDivision,			
			@RequestParam(value = "pimgPath", required = false) MultipartFile pimgPath,
			@RequestParam(value = "pdetailimgPath", required = false) MultipartFile pdetailimgPath,
			@RequestParam(value = "pctyimgPath", required = false) MultipartFile pctyimgPath) {
		System.out.println(pvo);
		System.out.println(pcodeDivision);

		String pimgRealName = pimgPath.getOriginalFilename();
		String pdetailimgRealName = pdetailimgPath.getOriginalFilename();
		String pctyimgRealName = pctyimgPath.getOriginalFilename();		
		String uploadFolder = "";
		String absolutePath = "C:\\MYSTUDY\\project_3\\project_3\\src\\main\\webapp\\";
		String allUploadFolder = "resources\\alcohol_img\\alcohol\\";
		switch (pcodeDivision) {
		case 1 :
			uploadFolder = "resources\\alcohol_img\\Takju\\";
			break;
		case 2 :
			uploadFolder = "resources\\alcohol_img\\Yakju\\";
			break;
		case 3 :
			uploadFolder = "resources\\alcohol_img\\Gwasilju\\";
			break;
		case 4 :
			uploadFolder = "resources\\alcohol_img\\jeunglyuju\\";
			break;

		default:
			break;
		}
		
		//1찐
		File savePimgFile = new File(absolutePath + uploadFolder + pimgRealName);
		File savepDetailimgRealNameFile = new File(absolutePath + uploadFolder + pdetailimgRealName);
		File savepCtyimgRealNameFile = new File(absolutePath + uploadFolder + pctyimgRealName);
		
		//2임시
		File savePimgFileTemp = new File(absolutePath + uploadFolder + pimgRealName);
		File savepDetailimgRealNameFileTemp = new File(absolutePath + uploadFolder + pdetailimgRealName);
		File savepCtyimgRealNameFileTemp = new File(absolutePath + uploadFolder + pctyimgRealName);
		
		//3옮길파일
		File savePimgFileAll = new File(absolutePath + allUploadFolder);
		File savepDetailimgRealNameFileAll = new File(absolutePath + allUploadFolder);
		File savepCtyimgRealNameFileAll = new File(absolutePath + allUploadFolder);

		try {
			pimgPath.transferTo(savePimgFile);
			pdetailimgPath.transferTo(savepDetailimgRealNameFile);
			pctyimgPath.transferTo(savepCtyimgRealNameFile);
			
			Files.copy(savePimgFileAll.toPath(), savePimgFileTemp.toPath(), StandardCopyOption.REPLACE_EXISTING);
			Files.copy(savepDetailimgRealNameFileAll.toPath(), savepDetailimgRealNameFileTemp.toPath(), StandardCopyOption.REPLACE_EXISTING);
			Files.copy(savepCtyimgRealNameFileAll.toPath(), savepCtyimgRealNameFileTemp.toPath(), StandardCopyOption.REPLACE_EXISTING);
			
//			FileUtils.moveFile(savePimgFile, savePimgFileAll);
//			FileUtils.moveFile(savepDetailimgRealNameFile, savepDetailimgRealNameFileAll);
//			FileUtils.moveFile(savepCtyimgRealNameFile, savepCtyimgRealNameFileAll);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		pvo.setPcode(pcodeDivision);
		pvo.setPimg(pimgRealName);
		pvo.setPdetailimg(pdetailimgRealName);
		pvo.setPctyimg(pctyimgRealName);
		
		productService.ProductInsert(pvo);
		System.out.println(pvo);
		request.setAttribute("success", "1");
		return "admin/productInsert";
	}
	
	@RequestMapping("/productUpdate.do")
	public String ProductUpdate(ProductVO pvo,
			HttpServletRequest request,
			@RequestParam(value = "pcodeDivision", required = false) int pcodeDivision,
			@RequestParam(value = "pimgPath", required = false) MultipartFile pimgPath,
			@RequestParam(value = "pdetailimgPath", required = false) MultipartFile pdetailimgPath,
			@RequestParam(value = "pctyimgPath", required = false) MultipartFile pctyimgPath) {
		
		String pimgRealName = pimgPath.getOriginalFilename();
		String pdetailimgRealName = pdetailimgPath.getOriginalFilename();
		String pctyimgRealName = pctyimgPath.getOriginalFilename();
		String uploadFolder = "";
		String absolutePath = "C:\\MYSTUDY\\project_3\\project_3\\src\\main\\webapp\\";
		
		File savePimgFile = new File(absolutePath + uploadFolder + pimgRealName);
		File savepDetailimgRealNameFile = new File(absolutePath + uploadFolder + pdetailimgRealName);
		File savepCtyimgRealNameFile = new File(absolutePath + uploadFolder + pctyimgRealName);
		System.out.println(savePimgFile);
		System.out.println(savepDetailimgRealNameFile);
		System.out.println(savepCtyimgRealNameFile);
		
		try {
			pimgPath.transferTo(savePimgFile);
			pdetailimgPath.transferTo(savepDetailimgRealNameFile);
			pctyimgPath.transferTo(savepCtyimgRealNameFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		pvo.setPimg(pimgRealName);
		pvo.setPdetailimg(pdetailimgRealName);
		pvo.setPctyimg(pctyimgRealName);
		
		productService.productUpdate(pvo);
		
		return "admin/adminPage";
	}
	
	@RequestMapping("/searchUsers.do")
	@ResponseBody
	public Map<String, Object> getSearchUsers( 
			@RequestParam(value = "searchDivision", required = false) String searchDivision,
			@RequestParam(value = "searchKeyword", required = false) String searchKeyword,
			@RequestParam(value = "pageNum", required = false) int pageNum) {

		int total = 0;
		int cntPerPage = 10;
		
		PagingVO pvoTotal = new PagingVO(searchDivision, searchKeyword);
		total = productService.getSearchDivisionTotal(pvoTotal);
		
		PagingVO pvo = new PagingVO(total, pageNum, cntPerPage, searchDivision, searchKeyword);
		
		List<UserVO> resultUserList = productService.getUsersList(pvo);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("resultUserList", resultUserList);
		result.put("page",  pvo.getNowPageNum());
	    result.put("startpage",  pvo.getStartPage());
	    result.put("endpage",  pvo.getEndPage());
	    result.put("lastPage", pvo.getLastPage());
	    result.put("searchDivision", searchDivision);
	    result.put("searchKeyword", searchKeyword);
	    System.out.println(result);
		return result;
	}
	
	@RequestMapping("/review.do")
	@ResponseBody
	public Map<String, Object> review(@RequestParam(value = "pageNum", required = false) int pageNum) {
		int reviewCnt = productService.getReviewCnt();
		int total = reviewCnt;
		int cntPerPage = 10;
		PagingVO p = new PagingVO(total, pageNum, cntPerPage);

		List<ReviewVO> reviewList = productService.getAjaxReviewList(p);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("reviewList", reviewList);
		result.put("page",  p.getNowPageNum());
	    result.put("startpage",  p.getStartPage());
	    result.put("endpage",  p.getEndPage());
	    result.put("lastPage", p.getLastPage());
	    System.out.println(result);
	    System.out.println(p);
		
		return result;
	}
	
	@RequestMapping("/QnAList.do")
	@ResponseBody
	public Map<String, Object> getQnAList(
			@RequestParam(value = "searchDivision", required = false) String searchDivision,
			@RequestParam(value = "searchKeyword", required = false) String searchKeyword,
			@RequestParam(value = "pageNum", required = false) int pageNum) {
		int QnACnt = productService.getQnACnt();
		int total = QnACnt;
		int cntPerPage = 10;

		PagingVO pvo = new PagingVO(total, pageNum, cntPerPage, searchDivision, searchKeyword);

		List<QnaVO> QnAList = productService.getAjaxQnAList(pvo);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("QnAList", QnAList);
		result.put("page",  pvo.getNowPageNum());
	    result.put("startpage",  pvo.getStartPage());
	    result.put("endpage",  pvo.getEndPage());
	    result.put("lastPage", pvo.getLastPage());
	    System.out.println(result);
	    System.out.println(pvo);
		
		return result;
	}
	
	@RequestMapping("/noticeList.do")
	@ResponseBody
	public Map<String, Object> getNoticeList(
			@RequestParam(value = "pageNum", required = false) int pageNum) {
		int NoticeCnt = productService.getNoticeCnt();
		int total = NoticeCnt;
		int cntPerPage = 10;

		PagingVO pvo = new PagingVO(total, pageNum, cntPerPage);
		
		//Notice 리스트 가져오기
		List<NoticeVO> NoticeList = productService.getNoticeList(pvo);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("NoticeList", NoticeList);
		result.put("page",  pvo.getNowPageNum());
	    result.put("startpage",  pvo.getStartPage());
	    result.put("endpage",  pvo.getEndPage());
	    result.put("lastPage", pvo.getLastPage());
	    System.out.println(result);
	    System.out.println(pvo);
		
		return result;
	}
	
	@GetMapping("/noticeInsert.do")
	public String noticeInsertGo() {
		return "admin/noticeInsert";
	}
	
	@PostMapping("/noticeInsert.do")
	public String noticeInsertSuccess(NoticeVO nvo, HttpServletRequest request) {
		System.out.println(nvo);
		productService.noticeInsert(nvo);
		request.setAttribute("success", "1");
		return "admin/noticeInsert";
	}
	
	@RequestMapping("/reviewDelete.do")
	public String reviewDelete(
			@RequestParam(value = "userId", required = false) String userId,
			@RequestParam(value = "pCode", required = false) int pCode) {
		ReviewVO rvo = new ReviewVO();
		rvo.setUserId(userId);
		rvo.setpCode(pCode);
		
		productService.reviewDelete(rvo);
		return "admin/adminPage";
	}
	
	@RequestMapping("/memberDelete.do")
	public String memberDelete(@RequestParam(value = "uCode", required = false) int uCode) {
		System.out.println(uCode);
		productService.memberDelete(uCode);
		return "admin/adminPage";
	}
	
	@RequestMapping("/questionDelete.do")
	public String questionDelete(@RequestParam(value = "qCode", required = false) int qCode) {
		productService.questionDelete(qCode);
		return "admin/adminPage";
	}
	
	@RequestMapping("/noticeDelete.do")
	public String noticeDelete(@RequestParam(value = "ncode", required = false) int ncode) {
		productService.noticeDelete(ncode);
		return "admin/adminPage";
	}
	
	@RequestMapping("/adminPage.do")
	public String adminPageGo() {
		System.out.println("adminPage");
		return "admin/adminPage";
	}
	@RequestMapping("/orderHistory.do")
	@ResponseBody
	public List<Map<String, Object>> orderHistory() {
		
		List<Map<String, Object>> list = productService.getOrderHistory();
		System.out.println(list);
		return list;
	}
	
	@RequestMapping("/monthly.do")
	@ResponseBody
	public Map<String, Integer> monthlyData(Model model) {
		Map<String, Integer> mapList = new HashMap<String, Integer>();
		int[] monthlyPrice = new int[12];
		
		for (int index = 0; index < 12; index++) {
			monthlyPrice[index] = productService.getMonthlyPrice(index);
			System.out.println(monthlyPrice[index]);
		}
		mapList.put("one", monthlyPrice[0]);
		mapList.put("two", monthlyPrice[1]);
		mapList.put("three", monthlyPrice[2]);
		mapList.put("four", monthlyPrice[3]);
		mapList.put("five", monthlyPrice[4]);
		mapList.put("six", monthlyPrice[5]);
		mapList.put("seven", monthlyPrice[6]);
		mapList.put("eight", monthlyPrice[7]);
		mapList.put("nine", monthlyPrice[8]);
		mapList.put("ten", monthlyPrice[9]);
		mapList.put("eleven", monthlyPrice[10]);
		mapList.put("twelve", monthlyPrice[11]);
		
		return mapList;
	}
}
