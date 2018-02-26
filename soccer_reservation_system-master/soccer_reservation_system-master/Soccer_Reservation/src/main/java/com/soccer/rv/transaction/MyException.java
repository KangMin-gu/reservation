package com.soccer.rv.transaction;

public class MyException extends Exception {
	//멤버필드
	private String message;
	
	//생성자
	public MyException(String message){
		this.message=message;
	}
	
	public void setMessage(String message){
		this.message=message;
	}
	
	@Override
	public String getMessage() {
		// TODO Auto-generated method stub
		return  message;
	}
}
