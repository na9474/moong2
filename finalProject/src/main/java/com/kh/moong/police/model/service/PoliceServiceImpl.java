package com.kh.moong.police.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.police.model.dao.PoliceDao;
import com.kh.moong.police.model.vo.Police;
import com.kh.moong.police.model.vo.PoliceCmt;

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
	public int deletePolice(int p_No) {
		return policeDao.deletePolice(sqlSession, p_No);
	}
	
	@Override
	public int policeListCount() {
		return policeDao.policeListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Police> policeList(PageInfo pi) {
		return policeDao.policeList(sqlSession, pi);
	}
	
	@Override
	public int addPoliceCmt(PoliceCmt pc) {
		return policeDao.addPoliceCmt(sqlSession,pc);
	}
	
	@Override
	public int deletePoliceCmt(int pc_No) {
		return policeDao.deletePoliceCmt(sqlSession, pc_No);
	}
	
	@Override
	public int policeCmtListCount() {
		return policeDao.policeCmtListCount(sqlSession);
	}
	
	@Override
	public ArrayList<PoliceCmt> policeCmtList(PageInfo pi) {
		return policeDao.policeCmtList(sqlSession, pi);
	}
	
	
	
}
