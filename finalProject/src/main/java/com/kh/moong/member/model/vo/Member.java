package com.kh.moong.member.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
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
