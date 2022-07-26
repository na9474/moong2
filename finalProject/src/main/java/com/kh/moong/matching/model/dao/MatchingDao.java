package com.kh.moong.matching.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.moong.matching.model.vo.Matching;

import oracle.net.aso.s;

@Repository
public class MatchingDao {

	public int checkMatching(SqlSessionTemplate sqlSession, Matching m) {
		
		
		try{
			int result = sqlSession.selectOne("MatchingMapper.checkMatching",m);
			System.out.println(result);
		return result;
	}catch (NullPointerException e){
	    return 0;
	}
	}

	public int insertMatching(SqlSessionTemplate sqlSession, Matching m) {
		
			return  sqlSession.insert("MatchingMapper.insertMatching",m);
	}

	public int joinMatching(SqlSessionTemplate sqlSession, Matching m) {
		return sqlSession.insert("MatchingMapper.joinMatching",m);
	}

	public int countMatching(SqlSessionTemplate sqlSession,int groupNo) {
		
		return sqlSession.selectOne("MatchingMapper.countMatching",groupNo);
	}

	public int checkSubject(SqlSessionTemplate sqlSession, Matching m) {
	
		return sqlSession.selectOne("MatchingMapper.checkSubject",m);
	}

	public ArrayList<Matching> completeMatchingList(SqlSessionTemplate sqlSession, int groupNo) {
		
		return (ArrayList)sqlSession.selectList("MatchingMapper.completeMatchingList",groupNo);
	}

	public int completeMatching(SqlSessionTemplate sqlSession, int groupNo) {
		
		return sqlSession.update("MatchingMapper.completeMatching",groupNo);
	}

	public ArrayList<Matching> alarmList(SqlSessionTemplate sqlSession, int userNo) {
		
		return (ArrayList)sqlSession.selectList("MatchingMapper.alarmList",userNo);
	}

	public int matchingAlarm(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("MatchingMapper.matchingAlarm",userNo);
	}

	public int matchingAlarm2(SqlSessionTemplate sqlSession, int userNo) {
		
		try{
			int result = sqlSession.selectOne("MatchingMapper.matchingAlarm2",userNo);
			
		return result;
	}catch (NullPointerException e){
	    return 0;
	}
	}

	public int updateAlarm(SqlSessionTemplate sqlSession, int maNo) {
			   
		return sqlSession.update("MatchingMapper.updateAlarm",maNo);
	}

	public int deleteMatching(SqlSessionTemplate sqlSession, int maNo) {
		
		return sqlSession.delete("MatchingMapper.deleteMatching",maNo);
	}
	
	

}
