package com.kh.moong.matching.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.moong.matching.model.dao.MatchingDao;
import com.kh.moong.matching.model.vo.Matching;
import com.kh.moong.matching.model.vo.Room;
import com.kh.moong.matching.model.vo.Talarm;

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
	public int tlistCheck(int userNo) {
		
		return matchingDao.tlistCheck(sqlSession,userNo);
	}


	@Override
	public Matching selectcomparison(int userNo) {
		
		return matchingDao.selectComparison(sqlSession,userNo);
	}

	@Override
	public int deleteMatching(int maNo) {
		
		return matchingDao.deleteMatching(sqlSession,maNo);
	}


	@Override
	public int cheifCheck(int userNo) {
		
		return matchingDao.cheifCheck(sqlSession,userNo);
	}


	@Override
	public Matching cheifCheck2(int userNo) {
		
		return matchingDao.cheifCheck2(sqlSession,userNo);
	}


	@Override
	public int sendUrl(int groupNo) {
		
		return matchingDao.sendUrl(sqlSession,groupNo);
	}


	@Override
	public Room selectUrl(int groupNo) {
		
		return matchingDao.selectUrl(sqlSession,groupNo);
	}


	@Override
	public int checkUrl(int userNo) {
		
		return matchingDao.checkUrl(sqlSession,userNo);
	}


	@Override
	public int insertTAlarm(Talarm t) {
		
		return matchingDao.insertTAlarm(sqlSession,t);
	}


	@Override
	public ArrayList<Talarm> checkGroupNo(int userNo) {
		
		return matchingDao.checkGroupNo(sqlSession,userNo);
	}


	@Override
	public Matching matchingInfo(int groupNo) {
		
		return matchingDao.matchingInfo(sqlSession,groupNo);
	}


	@Override
	public Room matchingURL(int groupNo) {
		
		return matchingDao.matchingURL(sqlSession,groupNo);
	}


	@Override
	public int updateSendUrl(int groupNo) {
		
		return matchingDao.updateSendUrl(sqlSession,groupNo);
	}


	@Override
	public int talarmStatusUpdate(int groupNo) {
		
		return matchingDao.talarmStatusUpdate(sqlSession,groupNo);
	}


	@Override
	public int checkSendUrl(int userNo) {
		
		return matchingDao.checkSendUrl(sqlSession,userNo);
	}


	@Override
	public int checkSendUrlUpdate(int userNo) {
		
		return matchingDao.checkSendUrlUpdate(sqlSession,userNo);
	}


	@Override
	public int checkSendUrl2(int userNo) {
		
		return matchingDao.checkSendUrl2(sqlSession,userNo);
	}



	


	




}
