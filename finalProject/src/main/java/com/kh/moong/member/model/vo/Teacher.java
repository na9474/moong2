package com.kh.moong.member.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Teacher {
	
	private int userNo;
	private String selfIntroduction;
	private String schoolInfo;
	private int rating;
	
	
	private String gender;
	private String email;
	private Date birth;
}
