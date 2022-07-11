package com.kh.moong.solution.model.service;

import java.util.ArrayList;

import com.kh.moong.common.model.vo.PageInfo;

import com.kh.moong.solution.model.vo.Solution;

public interface SolutionService {
	
	//게시판 리스트 조회 + 페이징처리
	//전체 게시글 수 구하기
	int selectListCount();
	//게시글 리스트 조회
	ArrayList<Solution> listAll(PageInfo pi);
	
	//게시글 작성하기
	int insertSolution(Solution s);
	
	//게시글 조회수 증가
	int increaseCount(int solutionNo);
	
	//게시글 상세조회
	public abstract Solution selectSolution(int solutionNo); 
	
	//게시글 삭제
	public abstract int deleteSolution(int solutionNo);
	
	//게시글 수정
	public abstract int updateBoard(Solution b);
	

}
