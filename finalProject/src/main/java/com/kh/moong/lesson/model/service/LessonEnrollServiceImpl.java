package com.kh.moong.lesson.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.moong.lesson.model.dao.LessonEnrollDao;
import com.kh.moong.lesson.model.vo.LessonEnroll;

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

}
