package com.soccer.rv.users.dao;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.soccer.rv.users.dto.UsersDto;

public interface UsersDao {
	public void insert(UsersDto dto);
	public UsersDto getData(String id);
	public void update(UsersDto dto);
	public void delete(String id);
	public boolean canUseId(String id);
	public UsersDto getMap(String id);
	public boolean getEmail(String email);
	public UsersDto findid(UsersDto dto);
	public UsersDto findpwd(UsersDto dto);
	public void findpwd2(UsersDto dto);
}
