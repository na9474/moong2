package com.kh.moong.solution.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class SolutionCmt {
		private int scNo;
		private int userNo;
		private String solutionCmtContents;
		private String createDate;
		private String status;
		private int solutionNo;
		private String userId;
		
		private int scfNo;
		private String scfOriginName;
		private String scfSysName;

}
