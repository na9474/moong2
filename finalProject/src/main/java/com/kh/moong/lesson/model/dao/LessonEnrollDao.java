package com.kh.moong.lesson.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.moong.lesson.model.vo.LessonEnroll;

@Repository
public class LessonEnrollDao {

	public ArrayList<LessonEnroll> selectList(SqlSessionTemplate sqlSession,int userNo) {
		
		return (ArrayList)sqlSession.selectList("lessonEnrollMapper.selectList",userNo);
	}

	public int lessonInsertCheck(SqlSessionTemplate sqlSession, LessonEnroll le) {
		
		
		return  sqlSession.selectOne("lessonEnrollMapper.lessonInsertCheck",le);
	}

	public int lessonInsert(SqlSessionTemplate sqlSession, LessonEnroll le) {
		
		return sqlSession.insert("lessonEnrollMapper.lessonInsert",le);
	}

	public LessonEnroll selectLesson(SqlSessionTemplate sqlSession, int leNo) {
		
		return sqlSession.selectOne("lessonEnrollMapper.selectLesson",leNo);
	}


	

}
