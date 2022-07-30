package com.kh.moong.lesson.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class LessonReview {
	private int reNo;//	RENO	NUMBER
	private int refLeno;//	REF_LENO	NUMBER
	private int reUno;//	RE_UNO	NUMBER
	private String reUname;//    RE_UNAME VARCHAR2(30)
	private String reText;//	RE_TEXT	VARCHAR2(2000 BYTE)
	private Date createDate;//	CREATE_DATE	DATE
	private String status;//	STATUS	VARCHAR2(1 BYTE)
	
	private int studentNo;
	private int teacherNo;
}