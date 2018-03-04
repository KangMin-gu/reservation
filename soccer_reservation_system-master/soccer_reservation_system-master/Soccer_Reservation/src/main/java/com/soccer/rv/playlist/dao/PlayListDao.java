package com.soccer.rv.playlist.dao;

import java.util.List;

import com.soccer.rv.field.dto.FieldDto;


public interface PlayListDao {
	public void insert(FieldDto dto);
	public List<FieldDto> getList(FieldDto dto);
	public int getCount(FieldDto dto);
	public FieldDto getData(FieldDto dto);
	public void delete(int num);
	public void update(FieldDto dto);
	public FieldDto getData(int num);
}
