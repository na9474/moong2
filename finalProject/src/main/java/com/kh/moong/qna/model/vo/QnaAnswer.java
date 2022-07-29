package com.kh.moong.qna.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class QnaAnswer {

	private int qnaNo;
	private String answerContent;
	private Date answerDate;
	private String answerStatus;
	
	private int qaCount;
}
