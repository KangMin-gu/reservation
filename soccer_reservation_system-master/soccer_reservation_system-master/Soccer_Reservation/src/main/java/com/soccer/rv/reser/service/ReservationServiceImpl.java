package com.soccer.rv.reser.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.soccer.rv.field.dao.FieldDao;
import com.soccer.rv.field.dto.FieldDto;
import com.soccer.rv.position.dto.PositionDto;
import com.soccer.rv.reser.dao.ReservationDao;
import com.soccer.rv.reser.orderdto.ResDto;
import com.soccer.rv.reser.orderdto.ReservationOrderDto;
import com.soccer.rv.reser.orderdto.RvinsertFormDto;
import com.soccer.rv.users.dto.UsersDto;

@Service
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired
	private ReservationDao rvdao;
	
	@Autowired
	private FieldDao fielddao;
	
	//구글맵 회원의 주소좌표 호출
	@Override
	public ModelAndView userLocation(HttpServletRequest request){
		String id = (String) request.getSession().getAttribute("id");
		UsersDto dto = rvdao.userLocation(id);
		ModelAndView mView = new ModelAndView();
		mView.addObject("dto", dto);
		
		return mView;
	}
	
	//ajax 운동장DB 좌표 호출
	public List<PositionDto> fieldLocation(){
		List<FieldDto> flist = fielddao.getList();
		List<PositionDto> list= new ArrayList<>();
		for (FieldDto tmp : flist) {
			int num = tmp.getNum();
			String title = tmp.getField_name();
			float lat = tmp.getLat();
			float lng = tmp.getLng();
			
			PositionDto pos = new PositionDto(num, title, lat, lng);
			list.add(pos);
		}
		return list;
	}
	
	//예약 현황페이지로 이동하면서 정보가져오기
	@Override
	public ModelAndView detail(HttpServletRequest request) {
		
		int num = Integer.parseInt(request.getParameter("num"));
		FieldDto dto = rvdao.getData(num); //이동하면서 운동장 정보가져오기
		ModelAndView mView = new ModelAndView();
		mView.addObject("dto", dto);
	
		return mView;
		
	}
	
	// ajax 예약 현황정보 가져오기	
	@Override
	public ReservationOrderDto getData(HttpServletRequest request) {
		
		String field_name = (String)request.getParameter("field_name");
		String field_date = (String)request.getParameter("field_date");
		ResDto rdto = new ResDto(field_name, field_date); // rdto에 담아서
		ReservationOrderDto order = rvdao.getinfo(rdto); //운동장 field_order 정보가져오기
	
		return order;
	}
	
	//예약폼 이동하면서 예약선택 데이터 가져가기 
	@Override
	public ModelAndView rvform(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int num = Integer.parseInt(request.getParameter("num"));
		FieldDto dto = rvdao.getData(num); 
		
		String rv_date = (String)request.getParameter("rv_date");
		String field_name = (String)request.getParameter("field_name");
		String rv_time = (String)request.getParameter("rv_time");
		String phone = (String) session.getAttribute("phone");
		
		ModelAndView mView = new ModelAndView ();
		mView.addObject("field_date", rv_date);
		mView.addObject("field_name", field_name);
		mView.addObject("rv_time", rv_time);
		mView.addObject("phone", phone);
		mView.addObject("dto" , dto);
		return mView;
	}

	//예약하기
	@Override
	public ModelAndView rvinsert(int num, RvinsertFormDto dtoa) {
		ModelAndView mView = new ModelAndView();
		FieldDto dto = rvdao.getData(num); 
		System.out.println("a"+dto.getNum());
		
		String morning = dto.getField_morning();
		String afternoon = dto.getField_afternoon();
		String night = dto.getField_night();
		
		
		String field_name = dtoa.getField_name();
		String field_date = dtoa.getField_date();
		String rv_time = dtoa.getRv_time();
		String id = dtoa.getId();
		String team = dtoa.getTeam();
		String phone = dtoa.getPhone();
		int teamNP = dtoa.getTeamNP();
		String etc = dtoa.getEtc();
		System.out.println(rv_time);
		ReservationOrderDto order = new ReservationOrderDto();
		
			order.setField_name(field_name);
			order.setField_date(field_date);
			
		if(rv_time.equals(morning)){
			order.setField_m_time(rv_time);
			order.setField_m_tname(team);
			order.setField_m_phone(phone);
			order.setField_m_teamNP(teamNP);
			order.setField_m_id(id);
			order.setField_m_etc(etc);
			
		}else if(rv_time.equals(afternoon)){
			order.setField_a_time(rv_time);
			order.setField_a_tname(team);
			order.setField_a_phone(phone);
			order.setField_a_teamNP(teamNP);
			order.setField_a_id(id);
			order.setField_a_etc(etc);

	
		}else{
			order.setField_n_time(rv_time);
			order.setField_n_tname(team);
			order.setField_n_phone(phone);
			order.setField_n_teamNP(teamNP);
			order.setField_n_id(id);
			order.setField_n_etc(etc);
			
		}
		System.out.println("m타임체크"+order.getField_m_time());
		System.out.println("a타임체크"+order.getField_a_time());
		System.out.println("n타임체크"+order.getField_n_time());

		rvdao.rvinsert(order);
		
		mView.addObject("order", order);
		
		return mView;
	}
	
//예약정보 확인하기
	@Override
	public ModelAndView myreser(HttpServletRequest request) {
		String id = (String)request.getSession().getAttribute("id");
		List<ReservationOrderDto> list = rvdao.myreser(id);
		List<ReservationOrderDto> olist = new ArrayList<>();
		for (ReservationOrderDto tmp : list) {
			
			String rvDate = tmp.getField_date();
			//오늘 기준 내일날짜를 구한다.
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.DATE, 1);
			//Date 에담는다.
			Date day = cal.getTime();
			System.out.println(day + "예약취소기준날짜");
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");	
			
			try {
				//예약날짜를 Date로 형변환
				Date rvD = format.parse(rvDate);
				//내일 날짜와 오늘 날짜 비교
				boolean booldate =day.after(rvD);	
				
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
				// boolean 값을 order에 넣는다.
				order.setBooldate(booldate);
				olist.add(order);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}
		ModelAndView mView = new ModelAndView();
		mView.addObject("list", olist);
		mView.addObject("id", id);
		return mView;
	}
	
//유저의 예약취소
@Override
public ModelAndView myreserdelete(HttpServletRequest request) {
	String field_name = (String)request.getParameter("fieldname");
	String field_date = (String)request.getParameter("fielddate");
	String field_m_time=(String)request.getParameter("fieldmornig");
	String field_a_time=(String)request.getParameter("fieldafternoon");
	String field_n_time=(String)request.getParameter("fieldnight");
	String id = (String) request.getSession().getAttribute("id");
	
	FieldDto dto = rvdao.getData2(field_name);
	String morning = dto.getField_morning();
	String afternoon = dto.getField_afternoon();
	String night = dto.getField_night();
	System.out.println(dto.getField_morning());
	System.out.println("비교할타임!"+morning);
	System.out.println("비교할타임!"+afternoon);
	System.out.println("비교할타임!"+night);
	System.out.println("비교대상자!"+field_m_time);
	System.out.println("비교대상자!"+field_a_time);
	
	ReservationOrderDto order = new ReservationOrderDto();
	
	order.setField_name(field_name);
	order.setField_date(field_date);
	if(field_m_time.equals(morning)){
		System.out.println("여기들어왔다.");
		order.setField_m_id(id);
	}else if(field_a_time.equals(afternoon)){
		order.setField_a_id(id);
	}else{
		order.setField_n_id(id);
	}
	
	System.out.println(order.getField_name()+order.getField_date()+order.getField_m_id()+order.getField_a_id()+order.getField_n_id());
	
	
	rvdao.myreserdelete(order);
	ModelAndView mView = new ModelAndView();

	
	return mView;
}
	

	
	

}
