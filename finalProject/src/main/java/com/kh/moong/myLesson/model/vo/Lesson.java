package com.kh.moong.myLesson.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Lesson {
	
	private int leNo;
	private int studentNo;
	private int teacherNo;
	private String subject;
	private Date startDate;
	private Date endDate;
	private String status;
	
	private String userName;
}
