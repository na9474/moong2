package com.kh.moong.solution.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.solution.model.vo.Solution;
import com.kh.moong.solution.model.vo.SolutionCmt;
import com.kh.moong.solution.model.vo.SolutionFiles;
import com.kh.moong.solution.model.vo.SolutionHeart;

@Repository
public class SolutionDao {
	
	//게시판 리스트 조회 + 페이징처리
	//전체 게시글 수 구하기
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("solutionMapper.selectListCount");
	}
	
	//게시글 리스트 조회
	public ArrayList<Solution> listAll(SqlSessionTemplate sqlSession, PageInfo pi, String search_cat, String keyword
										,String subject, String tag) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset,limit);
		
		HashMap<String, String> param = new HashMap<String, String>();
		param.put ( "search_cat" , search_cat);
		param.put ( "keyword" , keyword);
		param.put ( "subject" , subject);
		param.put( "tag", tag );

		
 		return (ArrayList)sqlSession.selectList("solutionMapper.listAll",param,rowBounds);
	}
	
	//게시글 작성하기
	public int insertSolution(SqlSessionTemplate sqlSession, Solution s) {
		return sqlSession.insert("solutionMapper.insertSolution",s);
	}
	
	//게시글 조회수 증가
	public int increaseCount(SqlSessionTemplate sqlSession, int solutionNo) {
		return sqlSession.update("solutionMapper.increaseCount",solutionNo);
	}
	
	//게시글 상세조회
	public Solution selectSolution(SqlSessionTemplate sqlSession, int solutionNo) {
		return sqlSession.selectOne("solutionMapper.selectSolution",solutionNo);
	}
	
	//게시글 삭제
	public int deleteSolution(SqlSessionTemplate sqlSession, int solutionNo) {
		return sqlSession.update("solutionMapper.deleteSolution",solutionNo);
	}
	
	//게시글 파일 첨부
	public int insertSolutionFiles(SqlSessionTemplate sqlSession, SolutionFiles sf) {
		return sqlSession.insert("solutionFilesMapper.insertSolutionFiles",sf);
	}
	
	//댓글 리스트 조회
	public ArrayList<SolutionCmt> cmtListAll(SqlSessionTemplate sqlSession, int solutionNo) {
		return (ArrayList)sqlSession.selectList("solutionCmtMapper.cmtListAll",solutionNo);
	}
	
	//댓글작성
	public int insertCmt(SqlSessionTemplate sqlSession, SolutionCmt sc) {
		return sqlSession.insert("solutionCmtMapper.insertCmt",sc);
	}
	
	//추천하기
	public int sHeartInsert(SqlSessionTemplate sqlSession, SolutionHeart sh) {
		return sqlSession.insert("solutionHeartMapper.sHeartInsert", sh);
	}
	
	//추천취소
	public int sHeartDelete(SqlSessionTemplate sqlSession, SolutionHeart sh) {
		return sqlSession.update("solutionHeartMapper.sHeartDelete", sh);
	}
	
	//추천수
	public int sHeartCount(SqlSessionTemplate sqlSession, int solutionNo) {
		return sqlSession.selectOne("solutionHeartMapper.sHeartCount", solutionNo);
	}
	
	//user가 해당 게시물을 추천했는지 확인
	public int sHeartCheck(SqlSessionTemplate sqlSession, SolutionHeart sh) {
		return sqlSession.selectOne("solutionHeartMapper.sHeartCheck", sh);
	}
	
}
