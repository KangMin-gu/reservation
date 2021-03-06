package com.soccer.rv.users.dao;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.soccer.rv.users.dto.UsersDto;

@Repository
public class UsersDaoImple implements UsersDao{
	
	@Autowired
	public SqlSession session;
	
	@Override
	public void insert(UsersDto dto) {
		session.insert("users.insert", dto);
	}

	@Override
	public UsersDto getData(String id) {
		return session.selectOne("users.getData", id);
	}

	@Override
	public void update(UsersDto dto) {
		session.update("users.update", dto);
	}

	@Override
	public void delete(String id) {
		session.delete("users.delete", id);
		
	}

	@Override
	public boolean canUseId(String id) {
		String result = session.selectOne("users.canUse", id);
		if(result == null){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public UsersDto getMap(String id) {
		return session.selectOne("users.getData", id);
	}

	@Override
	public boolean getEmail(String email) {
		String result = session.selectOne("users.canUseEmail", email);
		if(result == null){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public UsersDto findid(UsersDto dto) {
		UsersDto finddto = session.selectOne("users.findid", dto);
		return finddto;
	}

	@Override
	public UsersDto findpwd(UsersDto dto) {
		UsersDto finddto = session.selectOne("users.findpwd", dto);
		return finddto;
	}

	@Override
	public void findpwd2(UsersDto dto) {
		session.update("users.findpwd2", dto);
	}

}
