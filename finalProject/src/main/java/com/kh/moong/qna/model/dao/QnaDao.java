package com.kh.moong.qna.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.qna.model.vo.QnaAnswer;
import com.kh.moong.qna.model.vo.QnaFile;
import com.kh.moong.qna.model.vo.QnaQuestion;
import com.kh.moong.qna.model.vo.QnaType;

@Repository
public class QnaDao {

	public int selectQnaListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("qnaMapper.selectQnaListCount",userNo);
	}

	public ArrayList<QnaQuestion> selectList(SqlSessionTemplate sqlSession, PageInfo pi, int userNo) {
	
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);

		return (ArrayList)sqlSession.selectList("qnaMapper.selectList",userNo,rowBounds);
	}

	public int qnaInsert(SqlSessionTemplate sqlSession, QnaQuestion qq) {
		return sqlSession.insert("qnaMapper.qnaInsert", qq);
		
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int qnaNo) {
		return sqlSession.selectOne("qnaMapper.increaseCount",qnaNo);
	}

	public QnaQuestion selectQuestion(SqlSessionTemplate sqlSession, int qnaNo) {
		return sqlSession.selectOne("qnaMapper.selectQuestion", qnaNo);
	}

	public int deleteQna(SqlSessionTemplate sqlSession, int qnaNo) {
		return sqlSession.update("qnaMapper.deleteQna", qnaNo);
	}

	public int updateQna(SqlSessionTemplate sqlSession, QnaQuestion qq) {
		return sqlSession.update("qnaMapper.updateQna", qq);
	}

	public ArrayList<QnaAnswer> selectAnswerList(SqlSessionTemplate sqlSession, int qnaNo) {
		return (ArrayList)sqlSession.selectList("qnaMapper.selectAnswerList", qnaNo);
	}

	public int insertAnswer(SqlSessionTemplate sqlSession, QnaAnswer qa) {
		return sqlSession.insert("qnaMapper.insertAnswer", qa);
	}

	public ArrayList<QnaType> selectQnaType(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("qnaMapper.selectQnaType");
	}

	//첨부파일 이름 db저장
	public int insertQf(SqlSessionTemplate sqlSession, QnaFile qf) {
		return sqlSession.insert("qnaMapper.insertQf", qf);
	}

	//첨부파일의 qnaNo 넣어주기
	public int updateQfQnaNo(SqlSessionTemplate sqlSession, QnaQuestion qq) {
		return sqlSession.update("qnaMapper.updateQfQnaNo", qq);
	}

	//댓글 개수
	public ArrayList<QnaAnswer> qaCount(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("qnaMapper.qaCount");
	}



}
