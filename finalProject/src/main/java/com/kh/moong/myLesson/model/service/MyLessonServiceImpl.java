package com.kh.moong.myLesson.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.moong.member.model.vo.Member;
import com.kh.moong.myLesson.model.dao.MyLessonDao;
import com.kh.moong.myLesson.model.vo.Lesson;

@Service
public class MyLessonServiceImpl implements MyLessonService {

	@Autowired 
	private MyLessonDao myLessonDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Lesson> lessonList(Member loginUser) {
		return myLessonDao.lessonList(sqlSession,loginUser);
	}

	//레슨 종료
	@Override
	public int updateLessonEnd(int lNo) {
		return myLessonDao.updateLessonEnd(sqlSession,lNo);
	}
	


}
