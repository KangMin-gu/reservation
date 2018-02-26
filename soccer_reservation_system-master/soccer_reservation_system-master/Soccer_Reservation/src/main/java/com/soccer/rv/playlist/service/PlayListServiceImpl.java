package com.soccer.rv.playlist.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.soccer.rv.playlist.dao.PlayListDao;
import com.soccer.rv.playlist.dto.PlayListDto;



@Service
public class PlayListServiceImpl implements PlayListService {
	@Autowired
	private PlayListDao dao;
	
	//한 페이지에 나타낼 로우의 갯수
	private static final int PAGE_ROW_COUNT=3;
	//하단 디스플레이 페이지 갯수
	private static final int PAGE_DISPLAY_COUNT=5;
	
	@Override
	public ModelAndView getList(HttpServletRequest request) {

		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		String id = (String)request.getSession().getAttribute("id");
		
		ModelAndView mView= new ModelAndView();
		
		PlayListDto dto = new PlayListDto();
		
		if(keyword != null){
			if(condition.equals("field_name")){
				dto.setField_name(keyword);
			}else if(condition.equals("field_addr")){
				dto.setField_addr(keyword);
			}
			mView.addObject("condition", condition);
			mView.addObject("keyword", keyword);
		}
		//보여줄 페이지의 번호
				int pageNum=1;
				//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어온다.
				String strPageNum=request.getParameter("pageNum");
				if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면
					//페이지 번호를 설정한다.
					pageNum=Integer.parseInt(strPageNum);
				}
				//보여줄 페이지 데이터의 시작 ResultSet row 번호
				int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
				//보여줄 페이지 데이터의 끝 ResultSet row 번호
				int endRowNum=pageNum*PAGE_ROW_COUNT;
				//전체 row 의 갯수를 DB 에서 얻어온다.
				int totalRow = dao.getCount(dto);
				//전체 페이지의 갯수 구하기
				int totalPageCount=
						(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
				//시작 페이지 번호
				int startPageNum=
					1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
				//끝 페이지 번호
				int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
				//끝 페이지 번호가 잘못된 값이라면 
				if(totalPageCount < endPageNum){
					endPageNum=totalPageCount; //보정해준다. 
				}
				
				dto.setStartRowNum(startRowNum);
				dto.setEndRowNum(endRowNum);
				
				//1. 글목록을 불러온다.
				List<PlayListDto> list=dao.getList(dto);
				
				mView.addObject("list", list);
				mView.addObject("id", id);
				mView.addObject("pageNum", pageNum);
				mView.addObject("startPageNum", startPageNum);
				mView.addObject("endPageNum", endPageNum);
				mView.addObject("totalPageCount", totalPageCount);
		return mView;
	}

	@Override
	public ModelAndView detail(HttpServletRequest request) {
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		
		ModelAndView mView= new ModelAndView();
		
		System.out.println("detail 들어옴");
		//검색 조건을 알려주기 위한 메시지
		String msg= null;
		
		PlayListDto dto = new PlayListDto();
		if(keyword != null){
			System.out.println("검색들어옴");
			if(condition.equals("field_name")){
				dto.setField_name(keyword);
				msg="키워드 :"+keyword+"에 대한 검색결과";
			}else if(condition.equals("field_addr")){
				dto.setField_addr(keyword);
				msg="키워드 :" +keyword+"에 대한 검색결과";
			}
			
			mView.addObject("condition", condition);
			mView.addObject("keyword", keyword);
			mView.addObject("msg",msg);
		}
		
		int num=Integer.parseInt(request.getParameter("num"));
		dto.setNum(num);
		
		PlayListDto resultDto=dao.getData(dto);
		mView.addObject("dto", resultDto);
		
		return mView;
	}

	@Override
	public void insert(PlayListDto dto) {
		dao.insert(dto);
	}

	@Override
	public void delete(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("num"));
		dao.delete(num);
		
	}

	@Override
	public ModelAndView update(PlayListDto dto) {
		
		dao.update(dto);

		ModelAndView mView= new ModelAndView();
		
		mView.addObject("msg","수정하였습니다");
		return mView;
	}

	@Override
	public ModelAndView getData(int num) {
		PlayListDto dto = dao.getData(num);
		
		ModelAndView mView= new ModelAndView();
		
		mView.addObject("num", num);
		mView.addObject("dto",dto);
		return mView;
	}




}



















