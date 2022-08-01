package com.kh.moong.board.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
	public class BoardReply {

		private int rNo;	//	R_NO	NUMBER
		private int boardNo;	//	BOARD_NO	NUMBER
		private String userId;	//	USER_ID	VARCHAR2(200 BYTE)
		private String content;	//	CONTENT	VARCHAR2(4000 BYTE)
		private String brDate;	//	TO_CHAR(DATE)
		private String status;	//	STATUS	VARCHAR2(1 BYTE)	
		private int  userNo; 	//  USER_NO		NUMBER

}
