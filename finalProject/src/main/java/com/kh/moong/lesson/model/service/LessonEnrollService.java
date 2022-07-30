package com.kh.moong.lesson.model.service;

import java.util.ArrayList;

import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.lesson.model.vo.Districts;
import com.kh.moong.lesson.model.vo.Lesson;
import com.kh.moong.lesson.model.vo.LessonEnroll;
import com.kh.moong.lesson.model.vo.LessonReview;
import com.kh.moong.lesson.model.vo.Search;

public interface LessonEnrollService {

	ArrayList<LessonEnroll> selectList(int userNo);

	int lessonInsertCheck(LessonEnroll le);

	int lessonInsert(LessonEnroll le);

	LessonEnroll selectLesson(int leNo);

	ArrayList<LessonEnroll> selectAllLesson(PageInfo pi);

	int selectAllLessonCount();

	int deleteLesson(int leNo);

	int updateLesson(LessonEnroll le);

	ArrayList<Districts> selectDistrictsList();

	

	ArrayList<LessonEnroll> selectSearchAllLesson(PageInfo pi, Search s);

	

	
	int insertReview(LessonReview lr);

	ArrayList<LessonReview> reviewList(int leNo);

	int countStudent(Lesson les);

	LessonReview isWriteReview(LessonReview lr);

	int modiReview(LessonReview lr);
	

}
