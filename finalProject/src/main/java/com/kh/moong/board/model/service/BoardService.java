package com.kh.moong.board.model.service;

import java.util.ArrayList;

import com.kh.moong.board.model.vo.Board;
import com.kh.moong.board.model.vo.BoardLike;
import com.kh.moong.board.model.vo.BoardReply;
import com.kh.moong.common.model.vo.PageInfo;

public interface BoardService {

	//전체 게시글 수
	int selectListCount();
	
	//게시글 리스트 조회
	ArrayList<Board> selectList(PageInfo pi, String search_cat, String keyword);
	
	//게시글 작성
	int insertBoard(Board b);
	
	//조회수 증가
	int increaseCount(int boardNo);
	
	//게시글 상세조회
	Board selectBoard(int boardNo);
	
	//게시글 삭제
	int deleteBoard(int boardNo);
	
	//게시글 수정
	int updateBoard(Board b);
	
	//댓글 리스트 조회
	ArrayList<BoardReply> replyList(int boardNo);
	
	//댓글 작성
	int insertReply(BoardReply br);
	
	//댓글 삭제
	int deleteReply(int rNo);
	
	//추천
	int boardLikeInsert(BoardLike bl);
	
	//추천취소
	public abstract int boardLikeDelete(BoardLike bl);
	
	//추천 수
	int boardLikeCount(int board_no);
	
	//추천 확인
	int boardLikeCheck(int board_no, int user_no);
}
