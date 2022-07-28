package com.kh.moong.matching.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Matching {
private int maNo;					//	MA_NO	NUMBER
private int userNo;					//	USER_NO	NUMBER
private int groupNo;
private String random;					//	RANDOM	VARCHAR2(1 BYTE)
private String gender;					//	GENDER	VARCHAR2(1 BYTE)
private String subject;					//	SUBJECT	VARCHAR2(30 BYTE)
private String area;					//	AREA	VARCHAR2(30 BYTE)
private int fee;					//	FEE	NUMBER
private String people;					//	PEOPLE	NUMBER
private String chief;					//	CHIEF	VARCHAR2(1 BYTE)
private String status;					//	STATUS	VARCHAR2(1 BYTE)
private String maDay;					//	MA_DAY	VARCHAR2(100 BYTE)		
private String sYear;
private String sGender;
private String alert;
private String alert2;
private String url;
private Date enrollDate;
private String sendurl;

}
