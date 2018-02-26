package com.soccer.rv.playlist.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;


import com.soccer.rv.playlist.dto.PlayListDto;

public interface PlayListService {
	public void insert(PlayListDto dto);
	public ModelAndView getList(HttpServletRequest request);
	public ModelAndView detail(HttpServletRequest request);
	public void delete(HttpServletRequest request);
	public ModelAndView update(PlayListDto dto);
	public ModelAndView getData(int num);
}
