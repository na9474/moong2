package com.kh.moong.police.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.moong.police.model.dao.PoliceDao;
import com.kh.moong.police.model.vo.Police;

@Service
public class PoliceServiceImpl implements PoliceService {
	
	@Autowired
	private PoliceDao policeDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int addPolice(Police p) {
		return policeDao.addPolice(sqlSession,p);
	}

	@Override
	public int deletePolice(int soltionNo) {
		return policeDao.deletePolice(sqlSession, solutionNo);
	}
	
	
}
