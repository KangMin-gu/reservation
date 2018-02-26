package com.soccer.rv.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soccer.rv.review.dto.ReviewDto;


@Repository
public class ReviewDaoImpl implements ReviewDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(ReviewDto dto) {
		session.insert("review.insert", dto);
	}

	@Override
	public void update(ReviewDto dto) {
		session.update("review.update", dto);
	}

	@Override
	public void delete(int num) {
		session.delete("review.delete", num);
	}

	@Override
	public ReviewDto getData(ReviewDto dto) {
		
		return session.selectOne("review.getData", dto);

	}

	@Override
	public ReviewDto getData2(int num) {
		ReviewDto dto = session.selectOne("review.getData2", num);
		return dto;
	}

	@Override
	public List<ReviewDto> getList(ReviewDto dto) {
		
		return session.selectList("review.getList", dto);

	}

	@Override
	public int getCount(ReviewDto dto) {
		int count=session.selectOne("review.getCount", dto);
		return count;
	}

	@Override
	public void increaseViewCount(int num) {
		session.update("review.addCount", num);
	}
}
