 package com.kh.moong.myBoard.model.service;

import java.util.ArrayList;

import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.myBoard.model.vo.Board;
import com.kh.moong.solution.model.vo.Solution;

public interface MyBoardService {

	//게시판 글 개수
	int selectBoardListCount(int userNo);

	//문제풀이 글 개수
	int selectSolutionListCount(int userNo);

	//게시판 목록 조히
	ArrayList<Board> selectBoardList(PageInfo pi, int userNo);

	//문제풀이 목록 조회
	ArrayList<Solution> selectSolutionList(PageInfo pi,int userNo);

	//좋아요
	//좋아요 게시판 글 수
	int selectLikeBoardListCount(int userNo);

	//좋아요 게시판 목록
	ArrayList<Board> selectLikeBoardList(PageInfo pi, int userNo);

	//좋아요 문제풀이 글 수
	int selectLikeSolutionListCount(int userNo);

	//좋아요 문제풀이 목록
	ArrayList<Solution> selectLikeSolutionList(PageInfo pi, int userNo);

	
}
