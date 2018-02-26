package com.soccer.rv.playlist.dao;

import java.util.List;


import com.soccer.rv.playlist.dto.PlayListDto;


public interface PlayListDao {
	public void insert(PlayListDto dto);
	public List<PlayListDto> getList(PlayListDto dto);
	public int getCount(PlayListDto dto);
	public PlayListDto getData(PlayListDto dto);
	public void delete(int num);
	public void update(PlayListDto dto);
	public PlayListDto getData(int num);
}
