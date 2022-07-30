package com.kh.moong.lesson.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.lesson.model.dao.LessonEnrollDao;
import com.kh.moong.lesson.model.vo.Lesson;
import com.kh.moong.lesson.model.vo.LessonEnroll;
import com.kh.moong.lesson.model.vo.LessonReview;
import com.kh.moong.lesson.model.vo.Search;

@Service
public class LessonEnrollServiceImpl implements LessonEnrollService{
	
	@Autowired
	private LessonEnrollDao lessonEnrollDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<LessonEnroll> selectList(int userNo) {
		
		return lessonEnrollDao.selectList(sqlSession,userNo);
	}

	@Override
	public int lessonInsertCheck(LessonEnroll le) {
		
		return lessonEnrollDao.lessonInsertCheck(sqlSession,le);
	}

	@Override
	public int lessonInsert(LessonEnroll le) {
		
		return lessonEnrollDao.lessonInsert(sqlSession, le);
	}

	@Override
	public LessonEnroll selectLesson(int leNo) {
		
		return lessonEnrollDao.selectLesson(sqlSession,leNo);
	}

	@Override
	public int selectAllLessonCount() {
		
		return lessonEnrollDao.selectAllLessonCount(sqlSession);
	}
	
	
	@Override
	public ArrayList<LessonEnroll> selectAllLesson(PageInfo pi) {
		
		return lessonEnrollDao.selectAllLesson(sqlSession,pi);
	}

	@Override
	public int deleteLesson(int leNo) {
		
		return lessonEnrollDao.deleteLesson(sqlSession,leNo);
	}

	@Override
	public int updateLesson(LessonEnroll le) {
		
		return lessonEnrollDao.updateLesson(sqlSession,le);
	}

	@Override
	public ArrayList selectDistrictsList() {
		
		return lessonEnrollDao.selectDistrictsList(sqlSession);
	}

	@Override
	public ArrayList<LessonEnroll> selectSearchAllLesson(PageInfo pi,Search s) {
		
		return lessonEnrollDao.selectSearchAllLesson(sqlSession,pi,s);
	}

	



	@Override
	public int insertReview(LessonReview lr) {
		return lessonEnrollDao.insertReview(sqlSession, lr);
	}

	@Override
	public ArrayList<LessonReview> reviewList(int leNo) {
		return lessonEnrollDao.reviewList(sqlSession, leNo);
	}
	
	@Override
	public int countStudent(Lesson les) {
		return lessonEnrollDao.countStudent(sqlSession, les);
	}

	@Override
	public LessonReview isWriteReview(LessonReview lr) {
		return lessonEnrollDao.isWriteReview(sqlSession, lr);
	}

	@Override
	public int modiReview(LessonReview lr) {
		return lessonEnrollDao.modiReview(sqlSession, lr);
	}
}
