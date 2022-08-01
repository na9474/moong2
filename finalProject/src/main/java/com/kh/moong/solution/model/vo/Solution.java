package com.kh.moong.solution.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Solution {
		
		private int solutionNo;
		private String subject;
		private String tag;
		private int userNo;
		private String title;
		private String solutionContents;
		private int count;	
		private Date createDate;
		private String status;
		private String userId;
		
		private String sfSysName;
}
