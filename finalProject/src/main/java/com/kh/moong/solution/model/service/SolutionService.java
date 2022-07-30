package com.kh.moong.solution.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.qna.model.vo.QnaFile;
import com.kh.moong.qna.model.vo.QnaQuestion;
import com.kh.moong.solution.model.vo.Solution;
import com.kh.moong.solution.model.vo.SolutionCmt;
import com.kh.moong.solution.model.vo.SolutionCmtFiles;
import com.kh.moong.solution.model.vo.SolutionFiles;
import com.kh.moong.solution.model.vo.SolutionHeart;

public interface SolutionService {
	
	public abstract ArrayList<String> selectTags();
	
	//게시판 리스트 조회 + 페이징처리
	//전체 게시글 수 구하기
	int selectListCount();
	
	//게시글 리스트 조회
	ArrayList<Solution> listAll(PageInfo pi, String search_cat, String keyword, String subject, String tag);
	
	//게시글 작성하기
	int insertSolution(Solution s);
	
	//게시글 조회수 증가
	int increaseCount(int solutionNo);
	
	//게시글 상세조회
	public abstract Solution selectSolution(int solutionNo); 
	
	//게시글 삭제
	public abstract int deleteSolution(int solutionNo);
	
	//댓글 리스트 조회
	public abstract ArrayList<SolutionCmt> cmtListAll(int solutionNo);
	
	//댓글 작성
	public abstract int insertCmt(SolutionCmt sc);

	//댓글 파일첨부
	int insertSolCmtFiles(SolutionCmtFiles scf);
	
	//댓글 삭제
	public abstract int deleteCmt(int scNo);
	
	//댓글 solutionNo뽑기
	SolutionCmt cmtSelctSn(int scNo);
	
	//추천하기
	int sHeartInsert(SolutionHeart sh);
	
	//추천취소
	public abstract int sHeartDelete(SolutionHeart sh);
	
	//추천수
	int sHeartCount(int solution_no);
	
	//user가 해당 게시물을 추천했는지 확인
	int sHeartCheck(int solution_no, int user_no);

	//댓글 scNo뽑기
	int getScNo();
	
	//첨부파일 이름 db저장
	int insertSolutionFiles(SolutionFiles sf);

	//첨부파일의 solutionNo 넣어주기
	int updateSolutionNo(Solution s);
	
	//게시글 수정
	int updateSolution(Solution s);
	
	//해시태그 가져오기
	public abstract ArrayList<String> selectTag();
	
	//선생 추천 게시물 가져오기
	public abstract ArrayList<Solution> teacherSolution(String subject);
	
	//학생 추천 게시물 가져오기
	public abstract ArrayList<Solution> studentSolution(Solution s2);
	
	public abstract int solDeletePolice(int solutionNo);
	
	public abstract int cmtDeletePolice(int scNo);
	
	//user가 해당 게시물을 신고했는지 확인
	int solPoliceCheck(int solution_no, int user_no);
	
	//user가 해당 게시물을 신고했는지 확인
	int cmtPoliceCheck(int sc_no, int user_no);
	
}
