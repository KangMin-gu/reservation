package com.soccer.rv.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soccer.rv.review.dto.ReviewCommentDto;

@Repository
public class ReviewCommentDaoImpl implements ReviewCommentDao{
	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(ReviewCommentDto dto) {
		session.insert("reviewComment.insert", dto);	
	}

	@Override
	public List<ReviewCommentDto> getList(int ref_group) {
		return session.selectList("reviewComment.getList", ref_group);
	}

	@Override
	public int getSequence() {
		return session.selectOne("reviewComment.getSequence");
	}

}
