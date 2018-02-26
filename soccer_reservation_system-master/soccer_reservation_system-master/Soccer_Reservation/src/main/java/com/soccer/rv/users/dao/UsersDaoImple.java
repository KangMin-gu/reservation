package com.soccer.rv.users.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public boolean isValid(UsersDto dto) {
		UsersDto resultDto = session.selectOne("users.isValid", dto);
		
		if(resultDto == null){
			return false;
		}else{
			return true;
		}
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

}
