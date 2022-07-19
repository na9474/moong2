package com.kh.moong.police.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class PoliceCmt {
		
		private int pc_No;
		private int userNo;
		private String reason;
		private Date createDate;
		private int scNo;
		private String reporter;
		private String writer;
}
