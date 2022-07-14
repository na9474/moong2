package com.kh.moong.qna.model.service;

import java.util.ArrayList;

import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.qna.model.vo.QnaAnswer;
import com.kh.moong.qna.model.vo.QnaQuestion;

public interface QnaService {

	//전체 QnA 게시글 수 조회
	int selectQnaListCount();

	//QnA 리스트 조회
	ArrayList<QnaQuestion> selectList(PageInfo pi);

	//QnA 작성하기
	int insertQna(QnaQuestion qq);
	
	//QnA 상세조회
	//조회수 증가
	int increaseCount(int qnaNo);
	
	//상세조회
	QnaQuestion selectQuestion(int qnaNo);
	
	//QnA 삭제
	int deleteQna(int qnaNo);
	
	//QnA 수정
	int updateQna(QnaQuestion qq);
	
	//답변 리스트 조회
	ArrayList<QnaAnswer> selectAnswerList(int qnaNo);

	//답변 작성 - 관리자만 가능
	int insertAnswer(QnaAnswer qa);
}
