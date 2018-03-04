package com.soccer.rv;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.soccer.rv.admin.service.AdminService;
import com.soccer.rv.field.dto.FieldDto;


@Controller
public class HomeController {
	
	@Autowired
	private AdminService adminservice;
	
	@RequestMapping("/home")
	public ModelAndView home(){
		
		ModelAndView mView = adminservice.mainorder();
		
		mView.setViewName("home");

		return mView;
	}
	
}
