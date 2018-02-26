package com.soccer.rv.users.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.soccer.rv.field.dto.FieldDto;
import com.soccer.rv.position.dto.PositionDto;
import com.soccer.rv.users.dto.UsersDto;
import com.soccer.rv.users.service.UsersService;

@Controller
public class UsersController {
	
	@Autowired
	private UsersService service;
	
	//회원가입 폼으로 이동 
	@RequestMapping("/users/signupform")
	public String signupform (){
		return "users/signupform";
	}
	//회원가입 
	@RequestMapping("/users/signup")
	public ModelAndView signup(UsersDto dto){
		
		ModelAndView mView = service.signup(dto);
		mView.setViewName("users/signup_result");
		return mView;
	}
	
	//로그인 폼 이동 
	@RequestMapping("/users/loginform")
	public ModelAndView loginform(HttpServletRequest request){
		ModelAndView mView = new ModelAndView();
		String url = request.getParameter("url");
		if(url == null){
			url=request.getContextPath()+"/";
		}
		mView.addObject("url", url);
		mView.setViewName("users/loginform");
		return mView;
	}
	
	//로그인
	@RequestMapping("/users/login")
	public ModelAndView login(@ModelAttribute UsersDto dto, HttpServletRequest request){
		ModelAndView mView = service.login(dto, request);
		mView.setViewName("users/login_result");
		return mView;
	}
	
	//로그아웃
	@RequestMapping("/users/logout")
	public ModelAndView logout(HttpSession session){
		String id = (String)session.getAttribute("id");
		session.invalidate();
		ModelAndView mView = new ModelAndView();
		mView.addObject("id", id);
		mView.setViewName("users/logout_result");
		return mView;
	}
	
	//회원정보 보기
	@RequestMapping("/users/info")
	public ModelAndView info(HttpServletRequest request){
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		ModelAndView mView = service.detail(id);
		mView.setViewName("users/info");
		return mView;
	}
	
	//회원정보 수정폼
	@RequestMapping("/users/updateform")
	public ModelAndView updateform(HttpServletRequest request){
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		ModelAndView mView = service.detail(id);
		mView.setViewName("users/updateform");
		return mView;
	}
	
	//회원정보 수정
	@RequestMapping("/users/update")
	public ModelAndView update(@ModelAttribute UsersDto dto, HttpServletRequest request){
		HttpSession session = request.getSession();
		ModelAndView mView = service.update(dto, session);
		mView.setViewName("users/update_result");
		return mView;
	}
	
	//회원 탈퇴
	@RequestMapping("/users/delete")
	public ModelAndView delete(HttpServletRequest request){
		HttpSession session = request.getSession();
		ModelAndView mView = service.delete(session);
		mView.setViewName("users/delete_result");
		return mView;
	}
	
	//아이디 중복 확인
	@RequestMapping("/users/checkid")
	@ResponseBody
	public Map<String, Object> ßcheckid(@RequestParam String inputId){
		boolean canUse = service.canUseId(inputId);
		Map<String, Object> map = new HashMap<>();
		map.put("canUse", canUse);
		return map;
	}
	
	//운동장주소와 나의 주소 위치 호출 구글맵 연동
	@RequestMapping("/users/fieldlist")
	public ModelAndView authfieldList(HttpServletRequest request){
		ModelAndView mView = service.map(request);
		mView.setViewName("users/fieldlist");
		return mView;
	}
	
	//ajax 모든 운동장 좌표 DB에서 호출
	@RequestMapping("/users/fieldPosition")
	@ResponseBody
	public List<PositionDto> fieldPosition(){
		List<PositionDto> list = service.fieldList();
		return list;
	}
	
}
















