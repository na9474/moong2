package com.kh.moong.lesson.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.moong.lesson.model.vo.Lesson;
import com.kh.moong.matching.model.vo.Matching;

@Repository
public class LessonDao {

	public ArrayList<Matching> allUserNo(SqlSessionTemplate sqlSession, int groupNo) {
		
		return (ArrayList)sqlSession.selectList("MatchingMapper.allUserNo",groupNo);
	}

	public Matching MatchingChiefInfo(SqlSessionTemplate sqlSession, int groupNo) {
		
		return sqlSession.selectOne("MatchingMapper.MatchingChiefInfo",groupNo);
	}

	public int insertLesson(SqlSessionTemplate sqlSession, Lesson l) {
		
		return sqlSession.insert("lessonMapper.insertLesson",l);
	}

	public int deleteAlarmList(SqlSessionTemplate sqlSession, int groupNo) {
		
		return sqlSession.update("MatchingMapper.deleteAlarmList",groupNo);
	}

	public int deleteMatching2(SqlSessionTemplate sqlSession,int groupNo) {
		
		return sqlSession.update("MatchingMapper.deleteMatching2",groupNo);
	}

}
