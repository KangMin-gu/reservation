package com.soccer.rv;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.soccer.rv.review.service.ReviewService;


@Controller
public class HomeController {
	@Autowired
	private ReviewService reviewService;
	@RequestMapping("/home")
	public ModelAndView home(HttpServletRequest request){
		ModelAndView mView=reviewService.list(request);
		mView.setViewName("home");
		return mView;
	}
	
	
}
