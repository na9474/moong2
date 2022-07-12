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

}
