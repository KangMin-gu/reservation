package com.soccer.rv.users.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.soccer.rv.position.dto.PositionDto;
import com.soccer.rv.users.dto.UsersDto;

public interface UsersService {
	public ModelAndView signup(UsersDto dto);
	public boolean canUseId(String id);
	public ModelAndView login(UsersDto dto, HttpServletRequest request);
	public ModelAndView update(UsersDto dto, HttpSession session);
	public ModelAndView delete(HttpSession session);
	public ModelAndView detail(String id);
	public ModelAndView map(HttpServletRequest request);
	public List<PositionDto> fieldList();
}
