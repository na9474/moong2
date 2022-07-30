package com.kh.moong.lesson.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.lesson.model.vo.Lesson;
import com.kh.moong.lesson.model.vo.LessonEnroll;
import com.kh.moong.lesson.model.vo.LessonReview;
import com.kh.moong.lesson.model.vo.Search;

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

	public int deleteLesson(SqlSessionTemplate sqlSession, int leNo) {
		
		return sqlSession.update("lessonEnrollMapper.deleteLesson",leNo);
	}

	public int updateLesson(SqlSessionTemplate sqlSession, LessonEnroll le) {
		
		return sqlSession.update("lessonEnrollMapper.updateLesson",le);
	}

	public ArrayList selectDistrictsList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("lessonEnrollMapper.selectDistrictsList");
	}

	
	public ArrayList selectSearchAllLesson(SqlSessionTemplate sqlSession, PageInfo pi, Search s) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
	return (ArrayList)sqlSession.selectList("lessonEnrollMapper.selectSearchAllLesson",s,rowBounds);
		
	}

	

	
	
	
	public int insertReview(SqlSessionTemplate sqlSession, LessonReview lr) {
		return sqlSession.insert("lessonEnrollMapper.insertReview", lr);
	}

	public ArrayList<LessonReview> reviewList(SqlSessionTemplate sqlSession, int leNo) {
		return (ArrayList)sqlSession.selectList("lessonEnrollMapper.reviewList", leNo);
	}

	public int countStudent(SqlSessionTemplate sqlSession, Lesson les) {
		return sqlSession.selectOne("lessonEnrollMapper.countStudent", les);
	}

	public LessonReview isWriteReview(SqlSessionTemplate sqlSession, LessonReview lr) {
		return sqlSession.selectOne("lessonEnrollMapper.isWriteReview", lr);
	}

	public int modiReview(SqlSessionTemplate sqlSession, LessonReview lr) {
		return sqlSession.update("lessonEnrollMapper.modiReview", lr);
	}

}
