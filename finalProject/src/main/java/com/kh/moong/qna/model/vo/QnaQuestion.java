package com.kh.moong.qna.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class QnaQuestion {

	private int qnaNo;		
	private int userNo;		
	private int typeNo;		
	private String title;		
	private String questionContent;		
	private Date questionDate;		
	private String questionStatus;	
	
	private String typeName;
	private int qaNo;
	private String qfSysName;
	private String userName;
	private int rownum;
}
