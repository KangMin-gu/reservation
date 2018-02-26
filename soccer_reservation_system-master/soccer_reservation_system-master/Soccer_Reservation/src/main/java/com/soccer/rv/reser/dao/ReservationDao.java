package com.soccer.rv.reser.dao;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.soccer.rv.field.dto.FieldDto;
import com.soccer.rv.reser.orderdto.ResDto;
import com.soccer.rv.reser.orderdto.ReservationOrderDto;

public interface ReservationDao {
	public ReservationOrderDto getinfo(ResDto rdto);
	public FieldDto getData(int num);
	public void rvinsert(ReservationOrderDto order);
	public List<ReservationOrderDto> myreser(String id);
	public void myreserdelete(ReservationOrderDto order);
	public FieldDto getData2(String field_name);
}
