package com.kh.moong.solution.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.moong.solution.model.vo.SolutionFiles;

@Repository
public class SolutionFilesDao {
	

	public int insertSolutionFiles(SqlSessionTemplate sqlSession, SolutionFiles sf) {
		return sqlSession.insert("solutionFilesMapper.insertSolutionFiles",sf);
	}

	
	
}
