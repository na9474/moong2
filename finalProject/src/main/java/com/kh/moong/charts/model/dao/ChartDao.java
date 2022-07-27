package com.kh.moong.charts.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.moong.charts.model.vo.Chart;

@Repository
public class ChartDao {

	//회원수
	public int allMemCount(SqlSessionTemplate sqlSession) {
		   return sqlSession.selectOne("chartMapper.allMemCount");
	}	
	
	//선생수
	public int allTeaCount(SqlSessionTemplate sqlSession) {
		   return sqlSession.selectOne("chartMapper.allTeaCount");
	}
	
	//학생수
	public int allStuCount(SqlSessionTemplate sqlSession) {
		   return sqlSession.selectOne("chartMapper.allStuCount");
	}
	
	//선생 성별
	public List<Chart> teaGender(SqlSessionTemplate sqlSession){
			return sqlSession.selectList("chartMapper.teaGender");
	}
	
	//학생 성별
	public List<Chart> stuGender(SqlSessionTemplate sqlSession){
			return sqlSession.selectList("chartMapper.stuGender");
	}
	
	//월별 가입자수
	public List<Chart> monthMem(SqlSessionTemplate sqlSession){
			return sqlSession.selectList("chartMapper.monthMem");
	}
	
	//매칭수
	public int matchCount(SqlSessionTemplate sqlSession) {
		   return sqlSession.selectOne("chartMapper.matchCount");
	}

	//매칭완료수
	public int matchComCount(SqlSessionTemplate sqlSession) {
		   return sqlSession.selectOne("chartMapper.matchComCount");
	}
	
	//월별 가입자수
	public List<Chart> monthMatch(SqlSessionTemplate sqlSession){
			return sqlSession.selectList("chartMapper.monthMatch");
	}
	
	//국어등급
	public List<Chart> koGrade(SqlSessionTemplate sqlSession){
			return sqlSession.selectList("chartMapper.koGrade");
	}
	
	//영어등급
	public List<Chart> engGrade(SqlSessionTemplate sqlSession){
			return sqlSession.selectList("chartMapper.engGrade");
	}
	
	//수학등급
	public List<Chart> mathGrade(SqlSessionTemplate sqlSession){
			return sqlSession.selectList("chartMapper.mathGrade");
	}
	
	//과목별 선생수
	public List<Chart> subjectTeacher(SqlSessionTemplate sqlSession){
			return sqlSession.selectList("chartMapper.subjectTeacher");
	}
	
	//선생 과외스타일
	public List<Chart> styleTeacher(SqlSessionTemplate sqlSession){
			return sqlSession.selectList("chartMapper.styleTeacher");
	}


}
