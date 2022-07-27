package com.kh.moong.myBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.myBoard.model.dao.MyBoardDao;
import com.kh.moong.myBoard.model.vo.Board;
import com.kh.moong.solution.model.vo.Solution;

@Service
public class MyBoardServiceImpl implements MyBoardService  {

	@Autowired
	private MyBoardDao myBoardDao;

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//게시판 글 개수
	@Override
	public int selectBoardListCount(int userNo) {
		return myBoardDao.selectBoardListCount(sqlSession,userNo);
	}

	//문제풀이 글 개수
	@Override
	public int selectSolutionListCount(int userNo) {
		return myBoardDao.selectSolutionCount(sqlSession,userNo);
	}

	//게시판 목록 조회
	@Override
	public ArrayList<Board> selectBoardList(PageInfo pi,int userNo) {
		return myBoardDao.selectBoardList(sqlSession, pi, userNo);
	}

	//문제풀이 목록 조히
	@Override
	public ArrayList<Solution> selectSolutionList(PageInfo pi,int userNo) {
		return myBoardDao.selectSolutionList(sqlSession, pi, userNo);
	}

	//좋아요
	//좋아요 게시판 글 수
	@Override
	public int selectLikeBoardListCount(int userNo) {
		return myBoardDao.selectLikeBoardListCount(sqlSession,userNo);
	}

	//좋아요 게시판 목록
	@Override
	public ArrayList<Board> selectLikeBoardList(PageInfo pi, int userNo) {
		return myBoardDao.selectLikeBoardList(sqlSession,pi,userNo);
	}
	
	//좋아요 문제풀이 글 수
	@Override
	public int selectLikeSolutionListCount(int userNo) {
		return myBoardDao.selectLikeSolutionListCount(sqlSession,userNo);
	}

	//좋아요 문제풀이 목록
	@Override
	public ArrayList<Solution> selectLikeSolutionList(PageInfo pi, int userNo) {
		return myBoardDao.selectLikeSolutionList(sqlSession,pi,userNo);
	}

}
