package com.spring.huiloaelag.community.view;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.huiloaelag.community.CommunityService;

@Controller
public class CommunityLikeController {
	@Autowired
	private CommunityService communityService;

	@ResponseBody
	@RequestMapping("/Like.do")
	public int Like(@RequestParam String mCode) {
		System.out.println("mCode :" + mCode);
		
		communityService.insertLike(mCode);
		System.out.println("insert 완료!");
		
		int selectLike = communityService.selectLike(mCode);
		
		return selectLike;
		
	}
	
}
