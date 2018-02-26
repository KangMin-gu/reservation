package com.soccer.rv.admin.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.soccer.rv.users.dto.UsersDto;



public interface AdminService {
	//users회원정보
	public ModelAndView List(HttpServletRequest request);
	public ModelAndView getData(String id);
	public ModelAndView update(UsersDto dto);
	public void delete(HttpServletRequest request);
	
	
	/*======================================*/
	//reservation 예약정보
	public ModelAndView rvList(HttpServletRequest request);
	public ModelAndView rvDelete(HttpServletRequest request);
	
	
}
