package com.kh.moong.qna.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.qna.model.vo.QnaAnswer;
import com.kh.moong.qna.model.vo.QnaQuestion;

@Repository
public class QnaDao {

	public int selectQnaListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("qnaMapper.selectQnaListCount");
	}

	public ArrayList<QnaQuestion> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
	
		int offset = (pi.getCurrentPage()-1*pi.getBoardLimit());
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);

		return (ArrayList)sqlSession.selectList("qnaMapper.selectList",null,rowBounds);
	}

	public int insertQna(SqlSessionTemplate sqlSession, QnaQuestion qq) {
		return 0;
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int qnaNo) {
		return 0;
	}

	public QnaQuestion selectQuestion(SqlSessionTemplate sqlSession, int qnaNo) {
		return null;
	}

	public int deleteQna(SqlSessionTemplate sqlSession, int qnaNo) {
		return 0;
	}

	public int updateQna(SqlSessionTemplate sqlSession, QnaQuestion qq) {
		return 0;
	}

	public ArrayList<QnaAnswer> selectAnswerList(SqlSessionTemplate sqlSession, int qnaNo) {
		return null;
	}

	public int selectAnswer(SqlSessionTemplate sqlSession, QnaAnswer qa) {
		return 0;
	}



}
