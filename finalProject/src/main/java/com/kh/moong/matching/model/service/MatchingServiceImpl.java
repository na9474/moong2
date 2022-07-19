package com.kh.moong.matching.model.service;

import java.util.ArrayList;

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


	@Override
	public int insertMatching(Matching m) {
		return matchingDao.insertMatching(sqlSession,m);
	}


	@Override
	public int joinMatching(Matching m) {
		
		return matchingDao.joinMatching(sqlSession,m);
	}


	@Override
	public int countMatching(Matching m) {
		
		return matchingDao.countMatching(sqlSession,m);
	}


	@Override
	public int checkSubject(Matching m) {
		
		return matchingDao.checkSubject(sqlSession,m);
	}


	@Override
	public ArrayList<Matching> completeMatching(Matching m) {
		
		return matchingDao.completeMatching(sqlSession,m);
	}

}
