package com.kh.moong.myLesson.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.moong.member.model.vo.Member;
import com.kh.moong.myLesson.model.vo.Lesson;

@Repository
public class MyLessonDao {

	public ArrayList<Lesson> lessonList(SqlSessionTemplate sqlSession, Member loginUser) {
		return (ArrayList)sqlSession.selectList("myLessonMapper.lessonList", loginUser);
	}

	//레슨 종료
	public int updateLessonEnd(SqlSessionTemplate sqlSession, int lNo) {
		return sqlSession.update("myLessonMapper.updateLessonEnd",lNo);
	}



}
