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
	public int countMatching(int groupNo) {
		
		return matchingDao.countMatching(sqlSession,groupNo);
	}


	@Override
	public int checkSubject(Matching m) {
		
		return matchingDao.checkSubject(sqlSession,m);
	}


	@Override
	public ArrayList<Matching> completeMatchingList(int groupNo) {
		
		return matchingDao.completeMatchingList(sqlSession,groupNo);
	}


	@Override
	public int completeMatching(int groupNo) {
		
		return matchingDao.completeMatching(sqlSession, groupNo);
	}


	@Override
	public ArrayList<Matching> alarmList(int userNo) {

		return matchingDao.alarmList(sqlSession,userNo);
	}


	@Override
	public int matchingAlarm(int userNo) {
		
		return matchingDao.matchingAlarm(sqlSession,userNo);
	}


	@Override
	public int matchingAlarm2(int userNo) {
		
		return matchingDao.matchingAlarm2(sqlSession,userNo);
	}


	@Override
	public int updateAlarm(int maNo) {
		
		return matchingDao.updateAlarm(sqlSession,maNo);
	}


	@Override
	public int deleteMatching(int maNo) {
		
		return matchingDao.deleteMatching(sqlSession,maNo);
	}

}
