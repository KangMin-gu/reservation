package com.soccer.rv.review.dao;

import java.util.List;

import com.soccer.rv.review.dto.ReviewDto;


public interface ReviewDao {
	public void insert(ReviewDto dto);
	public void update(ReviewDto dto);
	public void delete(int num);
	public ReviewDto getData(ReviewDto dto);
	public ReviewDto getData2(int num);
	public List<ReviewDto> getList(ReviewDto dto);
	public int getCount(ReviewDto dto);
	public void increaseViewCount(int num);
}
