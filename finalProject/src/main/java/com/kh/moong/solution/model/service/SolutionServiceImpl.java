package com.kh.moong.solution.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.solution.model.dao.SolutionDao;
import com.kh.moong.solution.model.vo.Solution;
import com.kh.moong.solution.model.vo.SolutionCmt;
import com.kh.moong.solution.model.vo.SolutionFiles;
import com.kh.moong.solution.model.vo.SolutionHeart;

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
	public ArrayList<Solution> listAll(PageInfo pi, String search_cat, String keyword, String subject, String tag) {
		return solutionDao.listAll(sqlSession, pi, search_cat, keyword, subject, tag);
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
	
	@Override
	public int insertSolutionFiles(SolutionFiles sf) {
		return solutionDao.insertSolutionFiles(sqlSession, sf);
	}
	
	@Override
	public ArrayList<SolutionCmt> cmtListAll(int solutionNo) {
		return solutionDao.cmtListAll(sqlSession,solutionNo);
	}
	
	@Override
	public int insertCmt(SolutionCmt sc) {
		return solutionDao.insertCmt(sqlSession,sc);
	}
	
	@Override
	public int sHeartInsert(SolutionHeart sh) {
		return solutionDao.sHeartInsert(sqlSession,sh);
	}

	@Override
	public int sHeartDelete(SolutionHeart sh) {
		return solutionDao.sHeartDelete(sqlSession,sh);
	}
	
	@Override
	public int sHeartCount(int solutionNo) {
		return solutionDao.sHeartCount(sqlSession,solutionNo);
	}
	
	@Override
	public int sHeartCheck(SolutionHeart sh) {
		return solutionDao.sHeartCheck(sqlSession,sh);
	}
	
}
