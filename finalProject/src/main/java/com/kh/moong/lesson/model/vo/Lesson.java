package com.kh.moong.lesson.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Lesson {
private int lno;//	L_NO	NUMBER
private int studentNo;//	STUDENT_NO	NUMBER
private int teacherNo;//	TEACHER_NO	NUMBER
private String subject;//	SUBJECT	VARCHAR2(30 BYTE)
private Date startDate;//	START_DATE	DATE
private Date endDate;//	END_DATE	DATE
private String status;//	STATUS	VARCHAR2(1 BYTE)

}
