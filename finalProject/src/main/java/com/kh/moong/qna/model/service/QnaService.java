package com.kh.moong.qna.model.service;

import java.util.ArrayList;

import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.qna.model.vo.QnaAnswer;
import com.kh.moong.qna.model.vo.QnaFile;
import com.kh.moong.qna.model.vo.QnaQuestion;
import com.kh.moong.qna.model.vo.QnaType;

public interface QnaService {

	//QnA 전체 게시글 수
	int selectQnaListCount(int userNo);

	//QnA 목록 조회
	ArrayList<QnaQuestion> selectList(PageInfo pi, int userNo);

	//QnA 작성
	//QnaType 가져오기
	ArrayList<QnaType> selectQnaType();
	
	//QnA 작성
	int qnaInsert(QnaQuestion qq);
	
	//QnA 상세조회
	//조회수 증가
	int increaseCount(int qnaNo);
	
	//QnA 상세보기
	QnaQuestion selectQuestion(int qnaNo);
	
	//QnA 삭제
	int deleteQna(int qnaNo);
	
	//QnA 수정
	int updateQna(QnaQuestion qq);
	
	//댓글 리스트 조회
	ArrayList<QnaAnswer> selectAnswerList(int qnaNo);

	//댓글 작성
	int insertAnswer(QnaAnswer qa);

	//첨부파일 이름 db저장
	int insertQf(QnaFile qf);

	//첨부파일의 qnaNo 넣어주기
	int updateQfQnaNo(QnaQuestion qq);

	//댓글 개수
	ArrayList<QnaAnswer> qaCount();


}
