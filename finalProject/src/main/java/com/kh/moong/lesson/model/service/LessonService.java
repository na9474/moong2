package com.kh.moong.lesson.model.service;

import java.util.ArrayList;

import com.kh.moong.lesson.model.vo.Lesson;
import com.kh.moong.matching.model.vo.Matching;

public interface LessonService {

	ArrayList<Matching> allUserNo(int groupNo);

	Matching MatchingChiefInfo(int groupNo);

	int insertLesson(Lesson l);

	int deleteAlarmList(int groupNo);

	
	int deleteMatching2(int groupNo);

}
