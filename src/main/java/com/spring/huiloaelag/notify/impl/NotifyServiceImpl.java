package com.spring.huiloaelag.notify.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.huiloaelag.notify.NotifyService;
import com.spring.huiloaelag.notify.NoticeVO;


@Service("NotifyService")
public class NotifyServiceImpl implements NotifyService {
	@Autowired
	private NotifyDAO NotifyDAO;
	
	@Override
	public List<NoticeVO> NotifyList() {
		return NotifyDAO.NotifyList();
	}
	
}
