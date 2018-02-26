package com.soccer.rv.transaction;

import java.util.NoSuchElementException;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ExceptionController {
	//MyException type 의 예외가 발생했을때 호출되는 메소드
	@ExceptionHandler(MyException.class)
	public ModelAndView handleMyException(MyException me){
		ModelAndView mView = new ModelAndView();
		mView.addObject("exception",me);
		mView.setViewName("error/my");
		return mView;
	}
	
	//DB 관련 작업 도중 발생한 Exception 은 DataAccessException type 으로 받을 수 있다.
	@ExceptionHandler(DataAccessException.class)
	public ModelAndView handleDataAccessException(DataAccessException dae){
		
		ModelAndView mView = new ModelAndView();
		mView.addObject("exception",dae);
		mView.setViewName("error/data_access");
		return mView;
	}
	
	//NoSuchElementException
	@ExceptionHandler(NoSuchElementException.class)
	public ModelAndView handleNoSuchElementException(NoSuchElementException nse){
		
		ModelAndView mView = new ModelAndView();
		mView.addObject("exception",nse);
		mView.setViewName("error/nosuch_exception");
		return mView;
	}
}
