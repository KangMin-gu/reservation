package com.soccer.rv.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class PasswordUtil implements PasswordEncoder {
	
	private BCryptPasswordEncoder encoder;
	//생성자
	public PasswordUtil(){
		encoder=new BCryptPasswordEncoder();
	}
	@Override
	public String encode(CharSequence pwd) {
		String hash=encoder.encode(pwd);
		return hash;
	}

	@Override
	public boolean matches(CharSequence pwd	, String hash) {
		
		boolean isMatch=encoder.matches(pwd, hash);
		
		return isMatch;
	}
	
	
}
