package com.kh.moong.qna.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class QnaQuestion {

	private int qnaNo;		
	private int userNo;		
	private int typeNo;		
	private String title;		
	private String questionContent;		
	private Date questionDate;		
	private String questionStatus;	
	
}
