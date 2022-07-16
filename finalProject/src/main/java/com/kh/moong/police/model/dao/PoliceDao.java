package com.kh.moong.police.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.police.model.vo.Police;

@Repository
public class PoliceDao {
	
	//게시글 신고하기
	public int addPolice(SqlSessionTemplate sqlSession, Police p) {
		return sqlSession.insert("policeMapper.addPolice",p);
	}
	
	//신고삭제
	public int deletePolice(SqlSessionTemplate sqlSession, int solutionNo) {
		return sqlSession.update("policeMapper.deletePolice",solutionNo);
	}
	
}
