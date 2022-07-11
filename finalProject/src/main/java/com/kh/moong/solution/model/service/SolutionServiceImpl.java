package com.kh.moong.solution.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.solution.model.dao.SolutionDao;
import com.kh.moong.solution.model.vo.Solution;

@Service
public class SolutionServiceImpl implements SolutionService {
	
	@Autowired
	private SolutionDao solutionDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount() {
		
		return solutionDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Solution> listAll(PageInfo pi) {

		return solutionDao.listAll(sqlSession,pi);
	}

	@Override
	public int insertSolution(Solution s) {

		return solutionDao.insertSolution(sqlSession,s);
	}

	@Override
	public int increaseCount(int solutionNo) {
		
		return solutionDao.increaseCount(sqlSession,solutionNo);
	}

	@Override
	public Solution selectSolution(int solutionNo) {
		
		return solutionDao.selectSolution(sqlSession,solutionNo);
	}

	@Override
	public int deleteSolution(int solutionNo) {
		return solutionDao.deleteSolution(sqlSession, solutionNo);
	}

	@Override
	public int updateBoard(Solution b) {
		return 0;
	}
	
}
