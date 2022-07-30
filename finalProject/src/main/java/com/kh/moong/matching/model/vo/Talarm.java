package com.kh.moong.matching.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Talarm {
	
		private int taNo;//	TA_NO NUMBER PRIMARY KEY,
		private int userNo;//    USER_NO NUMBER NOT NULL,
		private int groupNo;//    GROUP_NO NUMBER NOT NULL,
		private String alert;//    ALERT VARCHAR2(1) NOT NULL,
		private String alarm;//    ALARM VARCHAR2(1) NOT NULL
		private Date enrollDate;
		private String status;
}
