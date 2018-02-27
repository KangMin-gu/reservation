package com.soccer.rv.reser.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.soccer.rv.position.dto.PositionDto;
import com.soccer.rv.reser.orderdto.ReservationOrderDto;
import com.soccer.rv.reser.orderdto.RvinsertFormDto;
import com.soccer.rv.reser.service.ReservationService;

@Controller
public class ReservationController {
		
	@Autowired
	private ReservationService rvservice;
	
	//예약 현황 페이지로 이동
	@RequestMapping("/reser/rv_detail")
	public ModelAndView authrvdetail(HttpServletRequest request, @RequestParam int num){
		
		ModelAndView mView = rvservice.detail(request);
		mView.setViewName("reser/rv_detail");
		return mView;
	}
	
	//ajax 예약 현황 불러오기
	@RequestMapping("/reser/rvfieldinfo")
	@ResponseBody
	public ReservationOrderDto getData(HttpServletRequest request){
		
		ReservationOrderDto order = rvservice.getData(request);
			return order;
		
	}
	
	//운동장의 모든 위치와 유저위치 구글맵호출
	@RequestMapping("/reser/fieldlist")
	public ModelAndView authfieldList(HttpServletRequest request){
		ModelAndView mView = rvservice.userLocation(request);
		mView.setViewName("reser/fieldlist");
		return mView;
	}
	
	//ajax 모든 운동장 좌표 DB에서 호출
	@RequestMapping("/reser/fieldPosition")
	@ResponseBody
	public List<PositionDto> fieldPosition(){
		List<PositionDto> list = rvservice.fieldLocation();
		return list;
	}
	
	
	//예약화면으로 이동
	@RequestMapping("/reser/rv_form")
	public ModelAndView authrvform(HttpServletRequest request){ 
		
		ModelAndView mView = rvservice.rvform(request);
		mView.setViewName("reser/rv_form");
		return mView;
		
	}
	
	//예약하기 및 결과페이지로이동
	@RequestMapping("/reser/rvinsert")
	public ModelAndView authrvinsert(@RequestParam int num ,@ModelAttribute RvinsertFormDto dtoa){
		ModelAndView mView = rvservice.rvinsert(num, dtoa);
		mView.setViewName("/reser/rvinsert_result");
		return mView;
	}
	
	//나의 예약정보 확인하기
	@RequestMapping("/reser/myreser")
	public ModelAndView authmyreser(HttpServletRequest request){
		ModelAndView mView = rvservice.myreser(request);
		mView.setViewName("reser/myreser");
		return mView;
	}
	
	//유저예약취소하기
	@RequestMapping("/reser/rvdelete")
	public ModelAndView authmyreserdelete(HttpServletRequest request){
		rvservice.myreserdelete(request);
		ModelAndView mView = new ModelAndView();
		mView.setViewName("/reser/myreserdel_result");
		return mView;
	}
}










