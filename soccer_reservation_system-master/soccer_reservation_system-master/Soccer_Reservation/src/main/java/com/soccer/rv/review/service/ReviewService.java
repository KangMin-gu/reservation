package com.soccer.rv.review.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.soccer.rv.review.dto.ReviewDto;


public interface ReviewService {
	public void insert(ReviewDto dto);
	public void update(ReviewDto dto);
	public void delete(int num);
	public ModelAndView list(HttpServletRequest request);
	public ModelAndView detail(HttpServletRequest request);
	public ModelAndView update(int num);
	//덧글 추가하는 메소드
	public void commentInsert(HttpServletRequest request);
}
