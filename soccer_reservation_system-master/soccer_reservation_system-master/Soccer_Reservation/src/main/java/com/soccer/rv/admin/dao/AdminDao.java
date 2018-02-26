package com.soccer.rv.admin.dao;

import java.util.List;



import com.soccer.rv.field.dto.FieldDto;
import com.soccer.rv.reser.orderdto.ReservationOrderDto;
import com.soccer.rv.users.dto.UsersDto;

public interface AdminDao {
	//users 회원정보 
	public UsersDto getData(String id);
	public void update(UsersDto dto);
	public void delete(String id);
	public List<UsersDto> getList();
	
	/*=========================*/
	//reservation 예약정보
	public List<ReservationOrderDto> rvList(String id);
	public void rvDelete(ReservationOrderDto dto);
	public FieldDto getData2(String field_name);
	
}
