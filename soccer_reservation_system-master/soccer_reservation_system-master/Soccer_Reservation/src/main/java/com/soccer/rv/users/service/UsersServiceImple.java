 package com.soccer.rv.users.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.code.geocoder.Geocoder;
import com.google.code.geocoder.GeocoderRequestBuilder;
import com.google.code.geocoder.model.GeocodeResponse;
import com.google.code.geocoder.model.GeocoderRequest;
import com.google.code.geocoder.model.GeocoderResult;
import com.google.code.geocoder.model.LatLng;
import com.soccer.rv.field.dao.FieldDao;
import com.soccer.rv.field.dto.FieldDto;
import com.soccer.rv.position.dto.PositionDto;
import com.soccer.rv.users.dao.UsersDao;
import com.soccer.rv.users.dto.UsersDto;

@Service
public class UsersServiceImple implements UsersService{
	
	@Autowired
	private UsersDao dao;
	
	@Autowired
	private FieldDao fieldDao;
	
	@Autowired
	private PasswordEncoder encoder;
	
	
	//회원가입
	@Override
	public ModelAndView signup(UsersDto dto) {
		
		 String hash=encoder.encode(dto.getPwd());
		 dto.setPwd(hash);
		 
		 dao.insert(dto);
		 ModelAndView mView = new ModelAndView();
		 mView.addObject("id", dto.getId());
		
		return mView;
	}
	//id 사용가능유무
	@Override
	public boolean canUseId(String id) {
		boolean canUse = dao.canUseId(id);
		return canUse;
	}
	//로그인 기능
	@Override
	public ModelAndView login(UsersDto dto, HttpServletRequest request) {
		
		UsersDto resultDto=dao.getData(dto.getId());
		
		boolean isValid = dao.isValid(dto);
		
		if(resultDto != null){
			boolean isMatch=encoder.matches(dto.getPwd(), resultDto.getPwd());
			if(isMatch){
				isValid=true;
			}
		}
		
		
		String url = request.getParameter("url");
		ModelAndView mView = new ModelAndView();
		
		
		if(isValid){
			request.getSession().setAttribute("id", dto.getId());
			String id = (String)request.getSession().getAttribute("id");
			UsersDto Udto = dao.getData(id);
			request.getSession().setAttribute("phone", Udto.getPhone());
			mView.addObject("msg", dto.getId()+"님 환영합니다.");
			mView.addObject("url", url);
		}else{
			mView.addObject("msg", "아이디 혹은 비밀번호를 확인해주세요.");
			String location = request.getContextPath()
					+"/users/loginform.do?url="+url;
			mView.addObject("url", location);
		}
		
		return mView;
	}
	
	//유저정보 업데이트
	@Override
	public ModelAndView update(UsersDto dto, HttpSession session) {
		String id = (String)session.getAttribute("id");
		dao.update(dto);
		ModelAndView mView = new ModelAndView();
		mView.addObject("id", id);
		return mView;
	}
	//회원탈퇴 및 세션에서 id 지우기
	@Override
	public ModelAndView delete(HttpSession session) {
		String id = (String)session.getAttribute("id");
		dao.delete(id);
		ModelAndView mView = new ModelAndView();
		mView.addObject("id", id);
		session.invalidate();
		return mView;
	}
	//user 상세보기페이지
	@Override
	public ModelAndView detail(String id) {
		UsersDto dto = dao.getData(id);
		ModelAndView mView = new ModelAndView();
		mView.addObject("dto", dto);
		return mView;
	}
	
	//user 정보에 저장되어 있는 주소를 좌표로 변환하는 메소
	@Override
	public ModelAndView map(HttpServletRequest request) {
		String id = (String)request.getSession().getAttribute("id"); 
		UsersDto dto = dao.getMap(id);
		String location = dto.getAddr(); // DB에서 받은 주소를 location에 담는다.
		System.out.println(location);
		ModelAndView mView = new ModelAndView();
		Geocoder geocoder = new Geocoder(); //Geocoder 구글 API 객체 생
		
		GeocoderRequest geocoderRequest = new GeocoderRequestBuilder() 
				.setAddress(location).setLanguage("ko").getGeocoderRequest(); //주소를 좌표로 변경해주는 구글 url 명령어 주소를 java api명령어로 표현.
		try {
			GeocodeResponse geocoderResponse = geocoder.geocode(geocoderRequest);
			GeocoderResult geocoderResult=geocoderResponse.getResults().iterator().next();
			LatLng latitudeLongitude = geocoderResult.getGeometry().getLocation(); //json형식으로 출력된 정보 중 좌표만 얻어온다.
			Float[] coords = new Float[2]; //Float 타입의 배열에 담는다.
			coords[0] = latitudeLongitude.getLat().floatValue(); //json형식의 좌표값을 불러온다.
			coords[1] = latitudeLongitude.getLng().floatValue();

			mView.addObject("lat", coords[0]); //구글 map API에 좌표값을 넣기위해 view로 정보를 담아 보낸다.
			mView.addObject("lng", coords[1]);
			System.out.println("좌표"+coords[0]+coords[1]);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		mView.addObject("addr", location);
		return mView;
		}

	//전체 운동장 주소를 좌표로 변환하여 리턴하는 메소드
	@Override
	public  List<PositionDto> fieldList() {
		
		List<FieldDto> list = fieldDao.getList();
		List<PositionDto> lis = new ArrayList<PositionDto>();
		for(FieldDto tmp : list){
			String location = tmp.getField_addr();
			String title = tmp.getField_name();
			int num = tmp.getNum();
			System.out.println(tmp.getNum());
			Geocoder geocoder = new Geocoder();
			GeocoderRequest geocoderRequest = new GeocoderRequestBuilder()
					.setAddress(location).setLanguage("ko").getGeocoderRequest();
			try {
				GeocodeResponse geocoderResponse = geocoder.geocode(geocoderRequest);
				GeocoderResult geocoderResult=geocoderResponse.getResults().iterator().next();
				LatLng latitudeLongitude = geocoderResult.getGeometry().getLocation();
				Float[] coords = new Float[2];
				coords[0] = latitudeLongitude.getLat().floatValue();
				coords[1] = latitudeLongitude.getLng().floatValue();
				
				float lat = coords[0];
				float lng = coords[1];
				
				PositionDto pos = new PositionDto(num, title, lat, lng);
				lis.add(pos);
				
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return lis;
	}

}
