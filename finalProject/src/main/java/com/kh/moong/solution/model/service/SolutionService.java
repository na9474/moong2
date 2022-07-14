package com.kh.moong.solution.model.service;

import java.util.ArrayList;

import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.solution.model.vo.Solution;
import com.kh.moong.solution.model.vo.SolutionCmt;
import com.kh.moong.solution.model.vo.SolutionFiles;
import com.kh.moong.solution.model.vo.SolutionHeart;

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
	public abstract int updateBoard(Solution s);
	
	//게시글 파일첨부
	int insertSolutionFiles(SolutionFiles sf);
	
	//댓글 리스트 조회
	public abstract ArrayList<SolutionCmt> cmtListAll(int solutionNo);
	
	//댓글 작성
	public abstract int insertCmt(SolutionCmt sc);
	
	//제목으로 검색
	ArrayList<Solution> searchTitle(String keyword);
	
	//내용으로 검색
	ArrayList<Solution> searchContents(String keyword);
	
	//아이디로 검색
	ArrayList<Solution> searchId(String keyword);
	
	//추천하기
	int sHeartInsert(SolutionHeart sh);
	
	//추천취소
	public abstract int sHeartDelete(SolutionHeart sh);
	
	//추천수
	int sHeartCount(int solutionNo);
	
	//user가 해당 게시물을 추천했는지 확인
	int sHeartCheck(SolutionHeart sh);

}
