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
	
	//게시글 파일첨부
	@Override
	public int insertSolutionFiles(SolutionFiles sf) {
		return solutionDao.insertSolutionFiles(sqlSession, sf);
	}
	
	//댓글 리스트 조회
	@Override
	public ArrayList<SolutionCmt> cmtListAll(int solutionNo) {
		return solutionDao.cmtListAll(sqlSession,solutionNo);
	}
	
	//댓글작성
	@Override
	public int insertCmt(SolutionCmt sc) {
		return solutionDao.insertCmt(sqlSession,sc);
	}
	
	//제목으로 검색
	@Override
	public ArrayList<Solution> searchTitle(String keyword) {
		return solutionDao.searchTitle(sqlSession,keyword);
	}
	
	//내용으로 검색
	@Override
	public ArrayList<Solution> searchContents(String keyword) {
		return solutionDao.searchContents(sqlSession,keyword);
	}
	
	//아이디로 검색
	@Override
	public ArrayList<Solution> searchId(String keyword) {
		return solutionDao.searchId(sqlSession,keyword);
	}
	
	//추천하기
	@Override
	public int sHeartInsert(SolutionHeart sh) {
		return solutionDao.sHeartInsert(sqlSession,sh);
	}
	
	//추천취소
	@Override
	public int sHeartDelete(SolutionHeart sh) {
		return solutionDao.sHeartDelete(sqlSession,sh);
	}
	
	//추천수
	@Override
	public int sHeartCount(int solutionNo) {
		return solutionDao.sHeartCount(sqlSession,solutionNo);
	}
	
	//user가 해당 게시물을 추천했는지 확인
	@Override
	public int sHeartCheck(SolutionHeart sh) {
		return solutionDao.sHeartCheck(sqlSession,sh);
	}
	
}
