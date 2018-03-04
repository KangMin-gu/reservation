package com.soccer.rv.playlist.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soccer.rv.field.dto.FieldDto;

@Repository
public class PlayListDaoImpl implements PlayListDao {
	@Autowired
	SqlSession session;
	@Override
	public List<FieldDto> getList(FieldDto dto) {
		
		
		return session.selectList("playlist.getList", dto);
		
	}

	@Override
	public int getCount(FieldDto dto) {
		
		int count=session.selectOne("playlist.getCount", dto);
		return count;
	}

	@Override
	public FieldDto getData(FieldDto dto) {
		
		return session.selectOne("playlist.getData", dto);
	}
	
	public void insert(FieldDto dto){
		session.insert("playlist.insert",dto);
	}

	@Override
	public void delete(int num) {
		session.delete("playlist.delete", num);
		
	}

	@Override
	public void update(FieldDto dto) {
		session.update("playlist.update", dto);
		System.out.println(dto.getNum());
		
		
	}

	@Override
	public FieldDto getData(int num) {
		FieldDto dto = session.selectOne("playlist.getData2", num);
		
		return dto;
	}
}
