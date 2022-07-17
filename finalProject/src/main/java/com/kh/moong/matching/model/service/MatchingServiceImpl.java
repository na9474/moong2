package com.kh.moong.matching.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.moong.matching.model.dao.MatchingDao;
import com.kh.moong.matching.model.vo.Matching;

@Service
public class MatchingServiceImpl implements MatchingService{

	@Autowired
	private MatchingDao matchingDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public int checkMatching(Matching m) {
		
		return matchingDao.checkMatching(sqlSession,m);
	}

}
