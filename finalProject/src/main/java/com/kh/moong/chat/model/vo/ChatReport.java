package com.kh.moong.chat.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ChatReport {
	private int crNo;//	CR_NO	NUMBER
	private int userNo;//	USER_NO	NUMBER
	private String reason;//	REASON	VARCHAR2(100 BYTE)
	private Date reportDate;//	REPORT_DATE	DATE
	private int chatNo;//	CHAT_NO	NUMBER
}
