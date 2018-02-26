package com.soccer.rv.admin.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

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
	
	//회원 예약정보 확인 및 기간 초과시취소불가 기능
	@Override
	public ModelAndView rvList(HttpServletRequest request) {
		String id = (String)request.getParameter("id");
		List<ReservationOrderDto> list =adminDao.rvList(id);	
		List<ReservationOrderDto> olist = new ArrayList<>();
		for (ReservationOrderDto tmp : list) {
			String rvDate = tmp.getField_date();
			Date day = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");		
			try {
				Date rvD = format.parse(rvDate);
				boolean booldate =rvD.before(day);		
				System.out.println(booldate);
				System.out.println(rvDate);
				int num = tmp.getNum();
				String field_name = tmp.getField_name();
				String field_date = tmp.getField_date();
				String field_m_time = tmp.getField_m_time();
				String field_m_tname = tmp.getField_m_tname();
				String field_m_phone = tmp.getField_m_phone();
				int field_m_teamNP = tmp.getField_m_teamNP();
				String field_m_id = tmp.getField_m_id();
				String field_m_etc = tmp.getField_m_etc();
				String field_a_time = tmp.getField_a_time();
				String field_a_tname =tmp.getField_a_tname();
				String field_a_phone = tmp.getField_a_phone();
				int field_a_teamNP = tmp.getField_a_teamNP();
				String field_a_id = tmp.getField_a_id();
				String field_a_etc = tmp.getField_a_etc();
				String field_n_time = tmp.getField_n_time();
				String field_n_tname =tmp.getField_n_tname();
				String field_n_phone = tmp.getField_n_phone();
				int field_n_teamNP = tmp.getField_n_teamNP();
				String field_n_id = tmp.getField_n_id();
				String field_n_etc = tmp.getField_n_etc();
				ReservationOrderDto order = new ReservationOrderDto(num, field_name, field_date, field_m_time, field_m_tname, field_m_phone, field_m_teamNP, field_m_id, field_m_etc, field_a_time, field_a_tname, field_a_phone, field_a_teamNP, field_a_etc, field_a_id, field_n_time, field_n_tname, field_n_phone, field_n_teamNP, field_n_id, field_n_etc, booldate);
				order.setBooldate(booldate);
				olist.add(order);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}
		
	
		System.out.println(list.get(1));
		ModelAndView mView = new ModelAndView();
		mView.addObject("list",olist);
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
