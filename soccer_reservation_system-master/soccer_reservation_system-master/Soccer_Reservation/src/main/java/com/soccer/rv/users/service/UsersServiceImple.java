package com.soccer.rv.users.service;

import java.io.IOException;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.code.geocoder.Geocoder;
import com.google.code.geocoder.GeocoderRequestBuilder;
import com.google.code.geocoder.model.GeocodeResponse;
import com.google.code.geocoder.model.GeocoderRequest;
import com.google.code.geocoder.model.GeocoderResult;
import com.google.code.geocoder.model.LatLng;
import com.soccer.rv.users.dao.UsersDao;
import com.soccer.rv.users.dto.UsersDto;

@Service
public class UsersServiceImple implements UsersService{
	
	@Autowired
	private UsersDao dao;
	
	@Autowired
	private PasswordEncoder encoder;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	//회원가입
	@Override
	public ModelAndView signup(UsersDto dto) {
		//회원이 등록 주소를 불러와 location에 담는다. 
		 String location = dto.getAddr();
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
				
				float lat = coords[0];
				float lng = coords[1];
				//회원의 주소를 좌표로 변경한 정보를 dto 담는다.
				dto.setLat(lat);
				dto.setLng(lng);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		//폼에서 password 를 꺼내와서 암호화를 한 후 hash에 담는다. 
		 String hash = encoder.encode(dto.getPwd());
		//dto에 다시 담는다.
		 dto.setPwd(hash);
		 
		 dao.insert(dto);
		 
		 mView.addObject("id", dto.getId());
		
		return mView;
	}
	
	//id 사용가능유무
	@Override
	public boolean canUseId(String id) {
		boolean canUse = dao.canUseId(id);
		return canUse;
	}
	
	//email 사용 가능 유무 
	 @Override
	 public boolean canUseEmail(String email){
		 boolean canUseEmail = dao.getEmail(email);
		 return canUseEmail;
	 }
	
	//로그인 기능
	@Override
	public ModelAndView login(UsersDto dto, HttpServletRequest request) {
	//로그인폼 아이디를 가져와서 회원 정보를 가져온다.
		UsersDto resultDto=dao.getData(dto.getId());
		
		boolean isValid = false;
		
		if(resultDto != null){
			boolean isMatch = encoder.matches(dto.getPwd(), resultDto.getPwd());
			if(isMatch){
				isValid = true;
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
		//폼에서 password 를 꺼내와서 암호화를 한 후 hash에 담는다. 
		String hash = encoder.encode(dto.getPwd());
		//dto에 다시 담는다.
		dto.setPwd(hash);
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

	//이메일 아이디 찾기 
	@Override
	public ModelAndView findid(UsersDto dto, HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		UsersDto finddto = dao.findid(dto);
		
		boolean isValid = false;
		
		if(finddto != null){	
			isValid = true;
		}
		
		
		if(isValid) {
			String id = finddto.getId();
			
			//id 메일보내기 로직
			final MimeMessagePreparator preparator = new MimeMessagePreparator() {
				
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
					helper.setFrom("Soccer_Reservation <mincu1028@gmail.com>");
					helper.setTo(finddto.getEmail());
					helper.setSubject(finddto.getName()+"님이 요청하신 아이디의 정보입니다.");
					helper.setText(finddto.getName()+"님의 아이디는"+""+id+""+"입니다.");
				}
			};	
			
			mailSender.send(preparator);
			String location = request.getContextPath()+"/users/loginform.do";
			mView.addObject("location", location);
			mView.addObject("msg", finddto.getName()+"님 메일에서 아이디를 확인해주세요.");	
			
		}else{	
			
			String location = request.getContextPath()+"/users/finduserform.do";
			mView.addObject("location", location);
			mView.addObject("msg", " 존재하지 않는 회원입니다. 이름이나 이메일을 확인 해주세요.");
			
		}
			return mView;
	}

	@Override
	public ModelAndView findpwd(UsersDto dto, HttpServletRequest request) {
		ModelAndView mView = new ModelAndView();
		UsersDto finddto = dao.findpwd(dto);
		System.out.println(finddto.getPwd());
		
		boolean isValid = false;
		
		if(finddto != null){	
			isValid = true;
		}
		
		if(isValid){
			
			StringBuffer temp = new StringBuffer();
			Random rnd = new Random();
			for (int i = 0; i < 10; i++) {
			    int rIndex = rnd.nextInt(3);
			    switch (rIndex) {
			    case 0:
			        // a-z
			        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
			        break;
			    case 1:
			        // A-Z
			        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
			        break;
			    case 2:
			        // 0-9
			        temp.append((rnd.nextInt(10)));
			        break;
			    }
			}
			
			System.out.println(finddto.getEmail()+"aa");
			String newpwd = temp.toString();
			System.out.println(newpwd);
			
			//id 메일보내기 로직
			final MimeMessagePreparator preparator = new MimeMessagePreparator() {
				
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
					helper.setFrom("Soccer_Reservation <mincu1028@gmail.com>");
					helper.setTo(finddto.getEmail());
					helper.setSubject(finddto.getName()+"님이 요청하신 임시비밀번호 정보입니다.");
					helper.setText(finddto.getName()+"님의 임시 비밀번호는"+""+newpwd+""+"입니다. 꼭 바로 변경해주세요.");
				}
			};	
			
			mailSender.send(preparator);
			//폼에서 password 를 꺼내와서 암호화를 한 후 hash에 담는다. 
			String hash = encoder.encode(newpwd);
			//dto에 다시 담는다.
			finddto.setPwd(hash);
			
			dao.findpwd2(finddto);
			
			String location = request.getContextPath()+"/users/updateform.do";
			mView.addObject("location", location);
			mView.addObject("msg", finddto.getName()+"님 메일에서 임시 비밀번호를 확인해주세요.");	
			
			
		}else{
			
			String location = request.getContextPath()+"/users/finduserform.do";
			mView.addObject("location", location);
			mView.addObject("msg", " 입력하신 정보가 맞지 않습니다. 이름이나 이메일을 확인 해주세요.");
			
		}
		
		return mView;
	}

	
//	//user 정보에 저장되어 있는 주소를 좌표로 변환하는 메소
//	@Override
//	public ModelAndView map(HttpServletRequest request) {
//		String id = (String)request.getSession().getAttribute("id"); 
//		UsersDto dto = dao.getMap(id);
//		String location = dto.getAddr(); // DB에서 받은 주소를 location에 담는다.
//		System.out.println(location);
//		ModelAndView mView = new ModelAndView();
//		Geocoder geocoder = new Geocoder(); //Geocoder 구글 API 객체 생
//		
//		GeocoderRequest geocoderRequest = new GeocoderRequestBuilder() 
//				.setAddress(location).setLanguage("ko").getGeocoderRequest(); //주소를 좌표로 변경해주는 구글 url 명령어 주소를 java api명령어로 표현.
//		try {
//			GeocodeResponse geocoderResponse = geocoder.geocode(geocoderRequest);
//			GeocoderResult geocoderResult=geocoderResponse.getResults().iterator().next();
//			LatLng latitudeLongitude = geocoderResult.getGeometry().getLocation(); //json형식으로 출력된 정보 중 좌표만 얻어온다.
//			Float[] coords = new Float[2]; //Float 타입의 배열에 담는다.
//			coords[0] = latitudeLongitude.getLat().floatValue(); //json형식의 좌표값을 불러온다.
//			coords[1] = latitudeLongitude.getLng().floatValue();
//
//			mView.addObject("lat", coords[0]); //구글 map API에 좌표값을 넣기위해 view로 정보를 담아 보낸다.
//			mView.addObject("lng", coords[1]);
//			System.out.println("좌표"+coords[0]+coords[1]);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//		mView.addObject("addr", location);
//		return mView;
//		}
//
//	//전체 운동장 주소를 좌표로 변환하여 리턴하는 메소드
//	@Override
//	public  List<PositionDto> fieldList() {
//		
//		List<FieldDto> list = fieldDao.getList();
//		List<PositionDto> lis = new ArrayList<PositionDto>();
//		for(FieldDto tmp : list){
//			String location = tmp.getField_addr();
//			String title = tmp.getField_name();
//			int num = tmp.getNum();
//			System.out.println(tmp.getNum());
//			Geocoder geocoder = new Geocoder();
//			GeocoderRequest geocoderRequest = new GeocoderRequestBuilder()
//					.setAddress(location).setLanguage("ko").getGeocoderRequest();
//			try {
//				GeocodeResponse geocoderResponse = geocoder.geocode(geocoderRequest);
//				GeocoderResult geocoderResult=geocoderResponse.getResults().iterator().next();
//				LatLng latitudeLongitude = geocoderResult.getGeometry().getLocation();
//				Float[] coords = new Float[2];
//				coords[0] = latitudeLongitude.getLat().floatValue();
//				coords[1] = latitudeLongitude.getLng().floatValue();
//				
//				float lat = coords[0];
//				float lng = coords[1];
//				
//				PositionDto pos = new PositionDto(num, title, lat, lng);
//				lis.add(pos);
//				
//				
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
//		
//		return lis;
//	}

}
