package com.kh.moong.solution.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.moong.solution.model.dao.SolutionFilesDao;
import com.kh.moong.solution.model.vo.SolutionFiles;

@Service
public class SolutionFilesServiceImpl implements SolutionFilesService {
	
	@Autowired
	private SolutionFilesDao solutionFilesDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertSolutionFiles(SolutionFiles sf) {

		return solutionFilesDao.insertSolutionFiles(sqlSession, sf);
	}
	
}
