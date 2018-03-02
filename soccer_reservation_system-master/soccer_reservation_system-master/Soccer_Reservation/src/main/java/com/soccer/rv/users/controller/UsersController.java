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
	public ModelAndView authlogout(HttpServletRequest request){
		String id = (String)request.getSession().getAttribute("id");
		request.getSession().invalidate();
		ModelAndView mView = new ModelAndView();
		mView.addObject("id", id);
		mView.setViewName("users/logout_result");
		return mView;
	}
	
	//회원정보 보기
	@RequestMapping("/users/info")
	public ModelAndView authinfo(HttpServletRequest request){
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		ModelAndView mView = service.detail(id);
		mView.setViewName("users/info");
		return mView;
	}
	
	//회원정보 수정폼
	@RequestMapping("/users/updateform")
	public ModelAndView authupdateform(HttpServletRequest request){
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
	public ModelAndView authdelete(HttpServletRequest request){
		HttpSession session = request.getSession();
		ModelAndView mView = service.delete(session);
		mView.setViewName("users/delete_result");
		return mView;
	}
	
	//아이디 중복 확인
	@RequestMapping("/users/checkid")
	@ResponseBody
	public Map<String, Object> checkid(@RequestParam String inputId){
		System.out.println("id체쿠 "+inputId);
		boolean canUse = service.canUseId(inputId);
		Map<String, Object> map = new HashMap<>();
		map.put("canUse", canUse);
		return map;
	}
	
	//email 중복확인
	@RequestMapping("/users/checkemail")
	@ResponseBody
	public Map<String, Object> checkEmail(@RequestParam String inputEmail){
		System.out.println("이멜체크"+inputEmail);
		boolean canUseEmail = service.canUseEmail(inputEmail);
		Map<String, Object> map = new HashMap<>();
		map.put("canUseEmail", canUseEmail);
		return map;
	}
	
	//비밀번호 및 아이디 찾기폼으로 이동
	@RequestMapping("/users/finduserform")
	public String finduserform(){
		return "users/finduserform";
	}
	
	//아이디 찾기 
	@RequestMapping("/users/findid")
	public ModelAndView findid(@ModelAttribute UsersDto dto, HttpServletRequest request){
		ModelAndView mView = service.findid(dto, request);
		mView.setViewName("users/findid_result");
		return mView;
	}
	
	//비밀번호 찾기
	@RequestMapping("/users/findpwd")
	public ModelAndView findpwd(@ModelAttribute UsersDto dto, HttpServletRequest request){
		ModelAndView mView = service.findpwd(dto, request);
		mView.setViewName("users/findpwd_result");
		return mView;
	}
//	//운동장주소와 나의 주소 위치 호출 구글맵 연동
//	@RequestMapping("/users/fieldlist")
//	public ModelAndView authfieldList(HttpServletRequest request){
//		ModelAndView mView = service.map(request);
//		mView.setViewName("users/fieldlist");
//		return mView;
//	}
//	
//	//ajax 모든 운동장 좌표 DB에서 호출
//	@RequestMapping("/users/fieldPosition")
//	@ResponseBody
//	public List<PositionDto> fieldPosition(){
//		List<PositionDto> list = service.fieldList();
//		return list;
//	}
//	
}
















