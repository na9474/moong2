package com.kh.moong.police.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Police {
		
		private int pNo;
		private int userNo;
		private String reason;
		private Date createDate;
		private int solutionNo;
}
