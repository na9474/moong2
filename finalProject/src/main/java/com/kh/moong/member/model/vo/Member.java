package com.kh.moong.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Member {
	
	private int userNo;
	private String student;
	private String teacher;
	private String userId;
	private String userPwd;
	private String userName;
	private String gender;
	private String email;
	private Date birth;
	private Date enrollDate;
	private Date modifyDate;
	private String status;
}
