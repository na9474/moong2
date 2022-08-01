package com.kh.moong.board.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.moong.board.model.vo.Board;
import com.kh.moong.board.model.vo.BoardLike;
import com.kh.moong.board.model.vo.BoardReply;
import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.solution.model.vo.Solution;

@Repository
public class BoardDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectListCount");
	}

	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String search_cat, String keyword) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
				
		RowBounds rowBounds = new RowBounds(offset,limit);

		HashMap<String, String> param = new HashMap<String, String>();
		param.put("keyword", keyword);
		param.put("search_cat", search_cat);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectList",param,rowBounds);
	}
	
	public ArrayList<Solution> listAll(SqlSessionTemplate sqlSession, PageInfo pi, String search_cat, String keyword,
			String subject, String tag) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);

		HashMap<String, String> param = new HashMap<String, String>();
		param.put("search_cat", search_cat);
		param.put("keyword", keyword);
		param.put("subject", subject);
		param.put("tag", tag);
	
		return (ArrayList) sqlSession.selectList("solutionMapper.listAll", param, rowBounds);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoard",b);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.increaseCount",boardNo);
	}

	public Board selectBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.selectBoard",boardNo);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.deleteBoard",boardNo);
	}
	
	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.updateBoard",b);
	}
	
	//추천
	public int boardLikeInsert(SqlSessionTemplate sqlSession, BoardLike bl) {
		return sqlSession.insert("boardLikeMapper.boardLikeInsert", bl);
	}
	
	//추천취소
	public int boardLikeDelete(SqlSessionTemplate sqlSession, BoardLike bl) {
		return sqlSession.update("boardLikeMapper.boardLikeDelete", bl);
	}
	
	//추천수 
	public int boardLikeCount(SqlSessionTemplate sqlSession, int board_no) {
		return sqlSession.selectOne("boardLikeMapper.boardLikeCount", board_no);
	}
	
	//추천체크
	public int boardLikeCheck(SqlSessionTemplate sqlSession, int board_no, int user_no) {
		HashMap<String, Integer> param = new HashMap<String, Integer>();
		param.put ("board_no", board_no);
		param.put ("user_no", user_no);
		return sqlSession.selectOne("boardLikeMapper.boardLikeCheck", param);
	}
	
	//댓글 목록
	public ArrayList<BoardReply> replyList(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("boardReplyMapper.replyList", boardNo);
	}
	
	//댓글 작성
	public int insertReply(SqlSessionTemplate sqlSession, BoardReply br) {
		return sqlSession.insert("boardReplyMapper.insertReply", br);
	}
	
	//댓글 삭제
	public int deleteReply(SqlSessionTemplate sqlSession, int rNo) {
		return sqlSession.update("boardReplyMapper.deleteReply",rNo);
	}
	
}
