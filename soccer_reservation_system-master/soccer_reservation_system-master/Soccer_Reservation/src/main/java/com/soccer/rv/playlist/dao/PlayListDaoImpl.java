package com.soccer.rv.playlist.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soccer.rv.playlist.dto.PlayListDto;

@Repository
public class PlayListDaoImpl implements PlayListDao {
	@Autowired
	SqlSession session;
	@Override
	public List<PlayListDto> getList(PlayListDto dto) {
		
		
		return session.selectList("playlist.getList", dto);
		
	}

	@Override
	public int getCount(PlayListDto dto) {
		
		int count=session.selectOne("playlist.getCount", dto);
		return count;
	}

	@Override
	public PlayListDto getData(PlayListDto dto) {
		
		return session.selectOne("playlist.getData", dto);
	}
	
	public void insert(PlayListDto dto){
		session.insert("playlist.insert",dto);
	}

	@Override
	public void delete(int num) {
		session.delete("playlist.delete", num);
		
	}

	@Override
	public void update(PlayListDto dto) {
		session.update("playlist.update", dto);
		System.out.println(dto.getNum());
		
		
	}

	@Override
	public PlayListDto getData(int num) {
		PlayListDto dto = session.selectOne("playlist.getData2", num);
		
		return dto;
	}
}
