package com.kh.moong.myLesson.model.service;

import java.util.ArrayList;

import com.kh.moong.member.model.vo.Member;
import com.kh.moong.myLesson.model.vo.Lesson;

public interface MyLessonService {

	ArrayList<Lesson> lessonList(Member loginUser);

	//레슨 종료
	int updateLessonEnd(int lNo);



}
