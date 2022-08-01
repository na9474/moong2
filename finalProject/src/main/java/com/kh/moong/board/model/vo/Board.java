package com.kh.moong.board.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Board {

private int boardNo;		//BOARD_NO	NUMBER
private int userNo;		//USER_NO	NUMBER
private String userId;
private int categoryNo;		//CATEGORY_NO	NUMBER
private String categoryName;	//CATEGORY_NAME	VARCHAR2(100 BYTE)
private String title;		//TITLE	VARCHAR2(4000 BYTE)
private String content;		//CONTENT	VARCHAR2(4000 BYTE)
private int count;		//COUNT	NUMBER
private int likeCount;		//LIKE_COUNT	NUMBER
private Date enrollDate;		//ENROLL_DATE	DATE
private String status;		//STATUS	VARCHAR2(1 BYTE)
private int bfNo;	//BF_NO	NUMBER
private String bfOriginName;	//BF_ORIGINNAME	VARCHAR2(100 BYTE)
private String bfSysName;	//BF_SYSNAME	VARCHAR2(100 BYTE)
}
