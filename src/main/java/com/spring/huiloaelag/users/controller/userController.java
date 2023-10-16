package com.spring.huiloaelag.users.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.huiloaelag.users.UserVO;
import com.spring.huiloaelag.users.userService;

@Controller
public class userController {
	@Autowired
	private userService userService;
	int a = 0;
	@RequestMapping("/insertUser.do")
	public String insertMember(UserVO vo,HttpServletRequest request , @RequestParam(value="membershipInsert", required = false) String optionButton){
		String addr1 = request.getParameter("addr1"); //우편번호
		String addr2 = request.getParameter("addr2"); //주소
		String addr3 = request.getParameter("addr3"); //상세주소
		int ubirth1 = Integer.parseInt(request.getParameter("ubirth1"));
		int ubirth2 = Integer.parseInt(request.getParameter("ubirth2"));
		int ubirth3 = Integer.parseInt(request.getParameter("ubirth3"));
		
		if (addr1 == null) addr1 = "";
		if (addr2 == null) addr2 = "";
		if (addr3 == null) addr3 = "";
		
		int userBirth = ubirth1 + ubirth2 + ubirth3;
		String userAddress = addr2 + addr3;
		System.out.println(addr1 + "," + addr2 + "," + addr3 + "," + userAddress);
		System.out.println("userAddress: " + userAddress );
		vo.setUaddr(userAddress);
		vo.setUbirth(userBirth);
		System.out.println(vo);
		userService.insertUserCheck(vo);
		
		System.out.println("최종 vo : 	" + vo);
		/* return "redirect:main.jsp"; */
		return "user/login";
	}
	
	@RequestMapping("/userCheck.do")
	public String go() {
		return "user/userCheck";

	}
	
	@RequestMapping("/userLoginPage.do")
	public ModelAndView login_check(@ModelAttribute UserVO vo, HttpSession session, HttpServletRequest request) {
	ModelAndView mav = new ModelAndView();
	System.out.println(vo);
	List<UserVO> list = userService.selectLogin(vo);  
	if (list.size() == 0) {
		request.setAttribute("loginUserX", "1");
		mav.setViewName("user/login");
		return mav;
	}
	System.out.println(list);
	 
	  if (list != null) { // 로그인 성공 시 
		  if ("관리자".equals(list.get(0).getUnick())) {
			   session.setAttribute("userId", vo.getUserId());
			   mav.setViewName("admin/adminPage");
		   } else {
			   session.setAttribute("ucode", list.get(0).getUcode());
				session.setAttribute("userId", vo.getUserId());
				session.setAttribute("unick", list.get(0).getUnick());
				mav.setViewName("redirect: main.jsp"); //메인으로 돌리는 ..
		   }
		
	   } else { // 로그인 실패 시
	     mav.setViewName("user/login"); 		
	     mav.addObject("message", "error");
	     }
	  System.out.println(mav.getViewName());
	     return mav;
	   }
	
	
	//로그아웃 
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("ucode");
		 session.removeAttribute("userId");
		 session.removeAttribute("unick");
		 return "redirect:main.jsp";
	  }
	
	@RequestMapping("/idSearch.do")
	public String goIdSearch() {
		return "user/findId";
	}
	
	//아이디 찾기 
	@RequestMapping(value = "/findId.do", method = RequestMethod.POST)
		public String findId(UserVO vo, HttpServletRequest request) {
		String user = userService.findId(vo);
		System.out.println(vo);
		if (user == null) {
			request.setAttribute("check", 1);
		} else {
			request.setAttribute("check", 0);
			request.setAttribute("userId", user);
		}
			
			return "user/findId";
		}
		
	@RequestMapping("/pwdSearch.do")
	public String goPwdSearch() {
		return "user/findPwd";
	}
	
	//비밀번호 찾기 
	@RequestMapping(value = "/findPwd.do", method = RequestMethod.POST)
		public String findPwd(UserVO vo, HttpServletRequest request) {
		String user = userService.findPwd(vo);
		System.out.println(user);
			
		if (user == null) {
			request.setAttribute("check", 1);
		} else {
			request.setAttribute("check", 0);
			request.setAttribute("userPwd", user);
		}
			return "user/findPwd";
		}
	
	@RequestMapping("/login.do")
	public String loginPageGO() {
		return "user/login";
	}
	
	@RequestMapping("/event.do")
	public String eventGo() {
		return "event/event";
	}

}
