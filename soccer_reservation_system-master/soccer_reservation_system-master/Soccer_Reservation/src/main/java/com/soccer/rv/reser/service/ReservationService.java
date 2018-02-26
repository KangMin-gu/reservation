package com.soccer.rv.reser.service;





import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.soccer.rv.position.dto.PositionDto;
import com.soccer.rv.reser.orderdto.ReservationOrderDto;
import com.soccer.rv.reser.orderdto.RvinsertFormDto;



public interface ReservationService {
	public ReservationOrderDto getData(HttpServletRequest request);
	public ModelAndView detail(HttpServletRequest request);
	public ModelAndView rvform(HttpServletRequest request);
	public ModelAndView rvinsert(int num, RvinsertFormDto dto);
	public ModelAndView myreser(HttpServletRequest request);
	public ModelAndView myreserdelete(HttpServletRequest request);
	public ModelAndView userLocation(HttpServletRequest request);
	public List<PositionDto> fieldLocation();
}
