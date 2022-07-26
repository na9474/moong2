package com.kh.moong.myBoard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.myBoard.model.vo.Board;
import com.kh.moong.solution.model.vo.Solution;

@Repository
public class MyBoardDao {

	//게시판 글 개수
	public int selectBoardListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("myBoardMapper.selectBoardListCount",userNo);
	}

	//문제풀이 글 개수
	public int selectSolutionCount(SqlSessionTemplate sqlSession,int userNo) {
		return sqlSession.selectOne("myBoardMapper.selectSolutionListCount",userNo);
	}

	//게시판 목록 조회
	public ArrayList<Board> selectBoardList(SqlSessionTemplate sqlSession, PageInfo pi, int userNo) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("myBoardMapper.selectBoardList", userNo, rowBounds);
	}

	//문제풀이 목록 조히
	public ArrayList<Solution> selectSolutionList(SqlSessionTemplate sqlSession, PageInfo pi, int userNo) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("myBoardMapper.selectSolutionList", userNo, rowBounds);
	}

	//좋아요
	//좋아요 게시판 글 수
	public int selectLikeBoardListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("myBoardMapper.selectLikeBoardListCount", userNo);
	}

	//좋아요 게시판 목록
	public ArrayList<Board> selectLikeBoardList(SqlSessionTemplate sqlSession, PageInfo pi, int userNo) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("myBoardMapper.selectLikeBoardList", userNo, rowBounds);
	}

	//좋아요 문제풀이 글 수
	public int selectLikeSolutionListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("myBoardMapper.selectLikeSolutionListCount", userNo);
	}

	//좋아요 문제풀이 목록
	public ArrayList<Solution> selectLikeSolutionList(SqlSessionTemplate sqlSession, PageInfo pi, int userNo) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("myBoardMapper.selectLikeSolutionsList", userNo, rowBounds);
	}

}
