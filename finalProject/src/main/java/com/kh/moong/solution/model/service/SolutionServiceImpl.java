package com.kh.moong.solution.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.qna.model.vo.QnaFile;
import com.kh.moong.qna.model.vo.QnaQuestion;
import com.kh.moong.solution.model.dao.SolutionDao;
import com.kh.moong.solution.model.vo.Solution;
import com.kh.moong.solution.model.vo.SolutionCmt;
import com.kh.moong.solution.model.vo.SolutionCmtFiles;
import com.kh.moong.solution.model.vo.SolutionFiles;
import com.kh.moong.solution.model.vo.SolutionHeart;

@Service
public class SolutionServiceImpl implements SolutionService {
	
	@Autowired
	private SolutionDao solutionDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<String> selectTags(){
		return solutionDao.selectTags(sqlSession);
	};

	@Override
	public int selectListCount() {
		return solutionDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Solution> listAll(PageInfo pi, String search_cat, String keyword, String subject, String tag) {
		ArrayList<Solution>list = solutionDao.listAll(sqlSession, pi, search_cat, keyword, subject, tag);
		return list;
	}

	@Override
	public int insertSolution(Solution s) {
		return solutionDao.insertSolution(sqlSession,s);
	}

	@Override
	public int increaseCount(int solutionNo) {
		return solutionDao.increaseCount(sqlSession,solutionNo);
	}

	@Override
	public Solution selectSolution(int solutionNo) {
		return solutionDao.selectSolution(sqlSession,solutionNo);
	}

	@Override
	public int deleteSolution(int solutionNo) {
		return solutionDao.deleteSolution(sqlSession, solutionNo);
	}
	
	@Override
	public ArrayList<SolutionCmt> cmtListAll(int solutionNo) {
		return solutionDao.cmtListAll(sqlSession,solutionNo);
	}
	
	@Override
	public int insertCmt(SolutionCmt sc) {
		return solutionDao.insertCmt(sqlSession,sc);
	}
	
	@Override
	public int insertSolCmtFiles(SolutionCmtFiles scf) {
		return solutionDao.insertSolCmtFiles(sqlSession, scf);
	}
	
	@Override
	public int deleteCmt(int scNo) {
		return solutionDao.deleteCmt(sqlSession, scNo);
	}
	
	@Override
	public SolutionCmt cmtSelctSn(int scNo) {
		return solutionDao.cmtSelctSn(sqlSession,scNo);
	}
	
	@Override
	public int sHeartInsert(SolutionHeart sh) {
		return solutionDao.sHeartInsert(sqlSession,sh);
	}
	

	@Override
	public int sHeartDelete(SolutionHeart sh) {
		return solutionDao.sHeartDelete(sqlSession,sh);
	}
	
	@Override
	public int sHeartCount(int solution_no) {
		return solutionDao.sHeartCount(sqlSession,solution_no);
	}
	
	@Override
	public int sHeartCheck(int solution_no, int user_no) {
		return solutionDao.sHeartCheck(sqlSession, solution_no, user_no);
	}
	
	@Override
	public int getScNo() {
		return solutionDao.getScNo(sqlSession);
	}
	
	@Override
	public int insertSolutionFiles(SolutionFiles sf) {
		return solutionDao.insertSolutionFiles(sqlSession, sf);
	}
	
	@Override
	public int updateSolutionNo(Solution s) {
		return solutionDao.updateSolutionNo(sqlSession,s);
	}
	
	@Override
	public int updateSolution(Solution s) {
		return solutionDao.updateSolution(sqlSession,s);
	}
	
	@Override
	public ArrayList<String> selectTag() {
		return solutionDao.selectTag(sqlSession);
	}
	
	@Override
	public ArrayList<Solution> teacherSolution(String subject) {
		return solutionDao.teacherSolution(sqlSession,subject);
	}

	@Override
	public ArrayList<Solution> studentSolution(Solution s2) {
		ArrayList<Solution>list = solutionDao.studentSolution(sqlSession, s2);
		return list;
	}
	
	@Override
	public int solDeletePolice(int solutionNo) {
		return solutionDao.solDeletePolice(sqlSession, solutionNo);
	}
	
	@Override
	public int cmtDeletePolice(int scNo) {
		return solutionDao.cmtDeletePolice(sqlSession, scNo);
	}
	
	@Override
	public int solPoliceCheck(int solution_no, int user_no) {
		return solutionDao.solPoliceCheck(sqlSession, solution_no, user_no);
	}
	
	@Override
	public int cmtPoliceCheck(int sc_no, int user_no) {
		return solutionDao.cmtPoliceCheck(sqlSession, sc_no, user_no);
	}

	
}
