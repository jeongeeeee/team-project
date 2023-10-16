package com.spring.huiloaelag.users;

import java.util.List;

import javax.servlet.http.HttpSession;


public interface userService {
	void insertUserCheck(UserVO vo);
	int selectUserId(String userId);
	int selectUserNickname(String userNickname);
	List<UserVO> selectLogin(UserVO vo);
	void selectLogout(HttpSession session);
	String findId(UserVO vo);
	String findPwd(UserVO vo);
}
