package com.soccer.rv.aspect;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

@Aspect
@Component
public class Adminaspect {

	@Around("execution(* admin*(..))")
	public Object loginCheck(ProceedingJoinPoint joinPoint) throws Throwable {
		Object[] args = joinPoint.getArgs();

		for (Object tmp : args) {

			if (tmp instanceof HttpServletRequest) {

				HttpServletRequest request = (HttpServletRequest) tmp;

				String id = (String) request.getSession().getAttribute("id");
				String a = "admin";
				ModelAndView mView = new ModelAndView();
				
				if(id == null){
					
					String query = (String) request.getQueryString();
					String url = null;
					if(query == null){
						url = request.getRequestURI();
						
					} else {
						url = request.getRequestURI() + "?" + query;
					}
					
					mView.setViewName("redirect:/users/loginform.do?url="+url);
					return mView;
		
				}else if(!id.equals(a)){
					mView.setViewName("admin/noadmin");
					return mView;
				}
					
					
				

			}
			
		}
		return joinPoint.proceed();
	}
}














