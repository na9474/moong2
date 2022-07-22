package com.kh.moong.lesson.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.moong.common.model.vo.PageInfo;
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

	public ArrayList<LessonEnroll> selectAllLesson(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("lessonEnrollMapper.selectAllLesson",null,rowBounds);
	}

	public int selectAllLessonCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("lessonEnrollMapper.selectAllLessonCount");
	}

	


	

}
