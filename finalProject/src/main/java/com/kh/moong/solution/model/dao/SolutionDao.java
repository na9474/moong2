package com.kh.moong.solution.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.moong.common.model.vo.PageInfo;

import com.kh.moong.solution.model.vo.Solution;

@Repository
public class SolutionDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("solutionMapper.selectListCount");
	}
	
	public ArrayList<Solution> listAll(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset,limit);
		
 		return (ArrayList)sqlSession.selectList("solutionMapper.listAll",null,rowBounds);
	}
	
	public int insertSolution(SqlSessionTemplate sqlSession, Solution s) {
		return sqlSession.insert("solutionMapper.insertSolution",s);
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int solutionNo) {
		return sqlSession.update("solutionMapper.increaseCount",solutionNo);
	}
	
	public Solution selectSolution(SqlSessionTemplate sqlSession, int solutionNo) {
		return sqlSession.selectOne("solutionMapper.selectSolution",solutionNo);
	}
	
	public int deleteSolution(SqlSessionTemplate sqlSession, int solutionNo) {
		return sqlSession.update("solutionMapper.deleteSolution",solutionNo);
	}
	
	
}
