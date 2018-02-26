package com.soccer.rv.admin.service;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.web.servlet.ModelAndView;
import java.util.List;
import com.soccer.rv.admin.dao.AdminDao;
import com.soccer.rv.field.dto.FieldDto;
import com.soccer.rv.reser.orderdto.ReservationOrderDto;
import com.soccer.rv.users.dto.UsersDto;

@Service
public class AdminServiceIpml implements AdminService{
	
	@Autowired
	private AdminDao adminDao;

	

	@Override
	public ModelAndView List(HttpServletRequest request) {
		//회원 목록 불러오기
		
		List<UsersDto> list = adminDao.getList();
		System.out.println(list);
		ModelAndView mView = new ModelAndView();
		mView.addObject("list",list);
		System.out.println(list+"admin list 입니다.");
		return mView;
	}



	@Override
	public ModelAndView getData(String id) {
		
		System.out.println(id+"= service id 값");
		UsersDto dto = adminDao.getData(id);
		
		ModelAndView mView = new ModelAndView();
		mView.addObject("dto",dto);
		return mView;
	}



	@Override
	public ModelAndView update(UsersDto dto) {

		adminDao.update(dto);
		ModelAndView mView = new ModelAndView();
		mView.addObject("msg","회원정보를 수정했습니다.");
		return mView;
	}



	@Override
	public void delete(HttpServletRequest request) {
		String id = (String)request.getParameter("id");
		adminDao.delete(id);
		
		
	}



	
	
	/*============================================*/
	
	//회원 예약정보 확인
	@Override
	public ModelAndView rvList(HttpServletRequest request) {
		String id = (String)request.getParameter("id");
		System.out.println("회원정보에서 id 가져왔다." + id);
		List<ReservationOrderDto> list =adminDao.rvList(id);
		ModelAndView mView = new ModelAndView();
		mView.addObject("list",list);
		mView.addObject("id", id);
		return mView;
	}


	//회원 예약정보 취소 
	@Override
	public ModelAndView rvDelete(HttpServletRequest request) {
		String field_name = (String)request.getParameter("fieldname");
		String field_date = (String)	request.getParameter("fielddate");
		String field_m_time = (String)request.getParameter("fieldmornig");
		String field_a_time = (String)request.getParameter("fieldafternoon");
		String field_n_time = (String)request.getParameter("fieldnight");
		String field_m_id = (String)request.getParameter("field_m_id");
		String field_a_id = (String)request.getParameter("field_a_id");
		String field_n_id = (String)request.getParameter("field_n_id");
		
		ModelAndView mView = new ModelAndView();
	
		
		FieldDto dto = adminDao.getData2(field_name);
		String morning = dto.getField_morning();
		String afternoon = dto.getField_afternoon();
		String night = dto.getField_night();
		

		ReservationOrderDto order = new ReservationOrderDto();
		
		order.setField_name(field_name);
		order.setField_date(field_date);
		if(field_m_time.equals(morning)){
			order.setField_m_id(field_m_id);
		}else if(field_a_time.equals(afternoon)){
			order.setField_a_id(field_a_id);
		}else{
			order.setField_n_id(field_n_id);
		}
		
		
		adminDao.rvDelete(order);
		
		mView.addObject("field_m_id", field_m_id);
		mView.addObject("field_a_id", field_a_id );
		mView.addObject("field_n_id", field_n_id);
	
		return mView;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
