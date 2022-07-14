package com.kh.moong.lesson.model.vo;

import lombok.Data;

@Data
public class LessonEnroll {
private int leNo;				//	LE_NO	NUMBER
private String userNo;				//	USER_NO	NUMBER
private String subject; 		//	SUBJECT	VARCHAR2(30 BYTE)
private String fee;				//	FEE	NUMBER
private String leStyle;			//	LE_STYLE	VARCHAR2(4000 BYTE)
private int tyear;
private String area;       		//	AREA	VARCHAR2(4000 BYTE)
private String career;			//	CAREER	VARCHAR2(100 BYTE)
private String leDay;			//	LE_DAY	VARCHAR2(100 BYTE)
private String teachingStyle;	//	TEACHINGSTYLE	VARCHAR2(1 BYTE)
private String leOriginname;
private String leChangename;
private String status;			//	STATUS	VARCHAR2(1 BYTE)
}
