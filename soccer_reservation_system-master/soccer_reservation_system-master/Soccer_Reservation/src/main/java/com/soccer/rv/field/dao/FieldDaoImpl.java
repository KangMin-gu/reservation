package com.soccer.rv.field.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soccer.rv.field.dto.FieldDto;

@Repository
public class FieldDaoImpl implements FieldDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<FieldDto> getList() {
		List<FieldDto> list = session.selectList("field.getList");
		return list;
	}

}
