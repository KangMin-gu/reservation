package com.soccer.rv.admin.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.soccer.rv.admin.service.AdminService;
import com.soccer.rv.users.dto.UsersDto;


@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminservice;
	
	//회원 목록 요청 처리
	@RequestMapping("/admin/adminlist")
	public ModelAndView authList(HttpServletRequest request){
		
		ModelAndView mView = adminservice.List(request);
		mView.setViewName("admin/adminlist");
		return mView;
	}
	
	//회원 정보 폼  수정 요청처리 
	@RequestMapping("/admin/adminupdateform")
	public ModelAndView updateform(HttpServletRequest request,@ModelAttribute UsersDto dto){
	
		
		String id =(String)request.getParameter("id");
		System.out.println(id+"=controller id 값");
		ModelAndView mView = adminservice.getData(id);
		mView.setViewName("admin/adminupdateform");
		return mView;
	}
	
	//회원 정보 수정 반영 요청 처리
	@RequestMapping("/admin/adminupdate")
	public ModelAndView update(@ModelAttribute UsersDto dto){
		
		
		ModelAndView mView = adminservice.update(dto);
		mView.setViewName("admin/adminalert");
		return mView;
	}
	
	//회원 정보 삭제 요청 처리
	@RequestMapping("/admin/admindel")
	public ModelAndView delete(HttpServletRequest request){
		
		ModelAndView mView = new ModelAndView();
		adminservice.delete(request);
		mView.setViewName("admin/admindel_result");
		return mView;
	}
	/*=====================================================*/
	
	//회원 예약 정보 확인 요청처리
	@RequestMapping("/admin/adminrvlist")
	public ModelAndView authAdminRvList(HttpServletRequest request){
		ModelAndView mView = adminservice.rvList(request);
		mView.setViewName("admin/adminrvlist");
		return mView;
	}
	//회원 예약 취소 요청 처리
	@RequestMapping("/admin/adminrvdelete")
	public ModelAndView RvDelete(HttpServletRequest request){
		ModelAndView mView = adminservice.rvDelete(request);
		mView.setViewName("admin/adminrvdel_result");
		return mView;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
