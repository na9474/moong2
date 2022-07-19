package com.kh.moong.matching.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.moong.matching.model.vo.Matching;

@Repository
public class MatchingDao {

	public int checkMatching(SqlSessionTemplate sqlSession, Matching m) {
		try{
		return sqlSession.selectOne("MatchingMapper.checkMatching",m);
	}catch (Exception e){
	    return 0;
	}
	}

	public int insertMatching(SqlSessionTemplate sqlSession, Matching m) {
		
			return  sqlSession.insert("MatchingMapper.insertMatching",m);
	}

	public int joinMatching(SqlSessionTemplate sqlSession, Matching m) {
		return sqlSession.insert("MatchingMapper.joinMatching",m);
	}

	public int countMatching(SqlSessionTemplate sqlSession, Matching m) {
		
		return sqlSession.selectOne("MatchingMapper.countMatching",m);
	}

	public int checkSubject(SqlSessionTemplate sqlSession, Matching m) {
	
		return sqlSession.selectOne("MatchingMapper.checkSubject",m);
	}

	public ArrayList<Matching> completeMatching(SqlSessionTemplate sqlSession, Matching m) {
		
		return (ArrayList)sqlSession.selectList("MatchingMapper.completeMatching",m);
	}

	

}
