package com.kh.moong.qna.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.qna.model.dao.QnaDao;
import com.kh.moong.qna.model.vo.QnaAnswer;
import com.kh.moong.qna.model.vo.QnaQuestion;
import com.kh.moong.qna.model.vo.QnaType;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDao qnaDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectQnaListCount() {
		return qnaDao.selectQnaListCount(sqlSession);
	}

	@Override
	public ArrayList<QnaQuestion> selectList(PageInfo pi) {
		return qnaDao.selectList(sqlSession,pi);
	}

	@Override
	public int qnaInsert(QnaQuestion qq) {
		return qnaDao.qnaInsert(sqlSession,qq);
	}

	@Override
	public int increaseCount(int qnaNo) {
		return qnaDao.increaseCount(sqlSession,qnaNo);
	}

	@Override
	public QnaQuestion selectQuestion(int qnaNo) {
		return qnaDao.selectQuestion(sqlSession,qnaNo);
	}

	@Override
	public int deleteQna(int qnaNo) {
		return qnaDao.deleteQna(sqlSession,qnaNo);
	}

	@Override
	public int updateQna(QnaQuestion qq) {
		return qnaDao.updateQna(sqlSession,qq);
	}

	@Override
	public ArrayList<QnaAnswer> selectAnswerList(int qnaNo) {
		return qnaDao.selectAnswerList(sqlSession,qnaNo);
	}

	@Override
	public int insertAnswer(QnaAnswer qa) {
		return qnaDao.selectAnswer(sqlSession,qa);
	}

	@Override
	public ArrayList<QnaType> selectQnaType() {
		return qnaDao.selectQnaType(sqlSession);
	}

}
