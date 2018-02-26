package com.soccer.rv.playlist.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.soccer.rv.playlist.dto.PlayListDto;
import com.soccer.rv.playlist.service.PlayListService;

@Controller
public class PlayListController {
	
	@Autowired
	PlayListService service;
	
	@RequestMapping("/playlist/playlist")
	public ModelAndView authlist(HttpServletRequest request){
		
		ModelAndView mView=service.getList(request);
		
		mView.setViewName("playlist/playlist");
		return mView;
	}

	@RequestMapping("/playlist/detail")
	public ModelAndView detail(HttpServletRequest request){
		ModelAndView mView= service.detail(request);
		
		mView.setViewName("playlist/detail");
		return mView;
	}

	
	@RequestMapping("/playlist/insertform")
	public ModelAndView insertform(HttpServletRequest request){
		 
		return new ModelAndView("playlist/insertform");
	}
	

	@RequestMapping("/playlist/insert")
	public ModelAndView Insert(HttpServletRequest request,
			@ModelAttribute PlayListDto dto	){
		
		service.insert(dto);
		
		return new ModelAndView("redirect:/playlist/playlist.do");
	}
	
	@RequestMapping("/playlist/delete")
	public ModelAndView Delete(HttpServletRequest request){
		
		ModelAndView mView= new ModelAndView();
		
		service.delete(request);
		
		mView.setViewName("redirect:/playlist/playlist.do");
		
		return mView;
		
	}
	
	@RequestMapping("/playlist/updateform")
	public ModelAndView UpdateForm(HttpServletRequest request,
			@RequestParam int num){
		
		ModelAndView mView = service.getData(num);
		mView.setViewName("playlist/updateform");
		
		
		
		return mView;
		
	}
	
	@RequestMapping("/playlist/update")
	public ModelAndView Update( @ModelAttribute PlayListDto dto){
		ModelAndView mView= service.update(dto);
		mView.addObject("num",dto.getNum());
		mView.setViewName("playlist/alert");
		return mView;
		
		
	}
}

















