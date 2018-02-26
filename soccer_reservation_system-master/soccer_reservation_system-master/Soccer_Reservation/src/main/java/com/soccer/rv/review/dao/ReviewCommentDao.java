package com.soccer.rv.review.dao;

import java.util.List;

import com.soccer.rv.review.dto.ReviewCommentDto;


public interface ReviewCommentDao {
	public void insert(ReviewCommentDto dto);
	public List<ReviewCommentDto> getList(int ref_group);
	public int getSequence();///덧글의 글번호를 리턴하는 메소드 
}
