package com.kh.moong.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.moong.board.model.dao.BoardDao;
import com.kh.moong.board.model.vo.Board;
import com.kh.moong.board.model.vo.BoardLike;
import com.kh.moong.board.model.vo.BoardReply;
import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.solution.model.vo.Solution;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		return boardDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi, String search_cat, String keyword) {
		return boardDao.selectList(sqlSession, pi, search_cat, keyword);
	}
	

	@Override
	public int insertBoard(Board b) {
		return boardDao.insertBoard(sqlSession,b);
	}

	@Override
	public int increaseCount(int boardNo) {
		return boardDao.increaseCount(sqlSession,boardNo);
	}

	@Override
	public Board selectBoard(int boardNo) {
		return boardDao.selectBoard(sqlSession, boardNo);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return boardDao.deleteBoard(sqlSession,boardNo);
	}

	@Override
	public int updateBoard(Board b) {
		return boardDao.updateBoard(sqlSession, b);
	}

	@Override
	public int boardLikeInsert(BoardLike bl) {
		return boardDao.boardLikeInsert(sqlSession, bl);
	}
	
	@Override
	public int boardLikeDelete(BoardLike bl) {
		return boardDao.boardLikeDelete(sqlSession, bl);
	}
	
	@Override
	public int boardLikeCount(int board_no) {
		return boardDao.boardLikeCount(sqlSession, board_no);
	}
	
	@Override
	public int boardLikeCheck(int board_no, int user_no) {
		return boardDao.boardLikeCheck(sqlSession, board_no, user_no);
	}
	
	@Override
	public ArrayList<BoardReply> replyList(int boardNo) {
		return boardDao.replyList(sqlSession,boardNo);
	}
	
	@Override
	public int insertReply(BoardReply br) {
		return boardDao.insertReply(sqlSession,br);
	}

	@Override
	public int deleteReply(int rNo) {
		return boardDao.deleteReply(sqlSession, rNo);
	}
	
}
