package com.soccer.rv.aspect;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

@Aspect
@Component
public class Authaspect {

	@Around("execution(* auth*(..))")
	public Object loginCheck(ProceedingJoinPoint joinPoint) throws Throwable {

		Object[] args = joinPoint.getArgs();

		for (Object tmp : args) {

			if (tmp instanceof HttpServletRequest) {

				HttpServletRequest request = (HttpServletRequest) tmp;

				String id = (String) request.getSession().getAttribute("id");

				if (id == null) {
					ModelAndView mView = new ModelAndView();

					String query = (String) request.getQueryString();

					String url = null;
					if (query == null) {
						url = request.getRequestURI();
						
					} else {
						url = request.getRequestURI() + "?" + query;
					}
					mView.setViewName("redirect:/users/loginform.do?url="+url);
					return mView;
				}

			}
		}
		return joinPoint.proceed();
	}
}
