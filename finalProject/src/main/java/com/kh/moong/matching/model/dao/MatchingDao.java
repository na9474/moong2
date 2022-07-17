package com.kh.moong.matching.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.moong.matching.model.vo.Matching;

@Repository
public class MatchingDao {

	public int checkMatching(SqlSessionTemplate sqlSession, Matching m) {
		
		return sqlSession.selectOne("MatchingMapper.checkMatching",m);
	}

}
