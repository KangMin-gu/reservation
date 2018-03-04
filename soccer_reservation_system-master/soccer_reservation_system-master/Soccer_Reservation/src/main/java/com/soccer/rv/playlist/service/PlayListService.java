package com.soccer.rv.playlist.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.soccer.rv.field.dto.FieldDto;

public interface PlayListService {
	public void insert(HttpServletRequest request, FieldDto dto);
	public ModelAndView getList(HttpServletRequest request);
	public ModelAndView detail(HttpServletRequest request);
	public void delete(HttpServletRequest request);
	public ModelAndView update(FieldDto dto);
	public ModelAndView getData(int num);
}
