package com.kh.moong.lesson.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.moong.lesson.model.dao.LessonDao;
import com.kh.moong.lesson.model.vo.Lesson;
import com.kh.moong.matching.model.vo.Matching;

@Service
public class LessonServiceImpl implements LessonService{

	@Autowired
	private LessonDao ld;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public ArrayList<Matching> allUserNo(int groupNo) {
		
		return ld.allUserNo(sqlSession,groupNo);
	}


	@Override
	public Matching MatchingChiefInfo(int groupNo) {
		
		return ld.MatchingChiefInfo(sqlSession,groupNo);
	}


	@Override
	public int insertLesson(Lesson l) {
		
		return ld.insertLesson(sqlSession,l);
	}


	@Override
	public int deleteAlarmList(int groupNo) {
		
		return ld.deleteAlarmList(sqlSession,groupNo);
	}


	@Override
	public int deleteMatching2(int groupNo) {
		
		return ld.deleteMatching2(sqlSession,groupNo);
	}

}
