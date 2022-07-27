package com.kh.moong.police.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.police.model.vo.Police;
import com.kh.moong.police.model.vo.PoliceCmt;

@Repository
public class PoliceDao {
	
	//게시글 신고하기
	public int addPolice(SqlSessionTemplate sqlSession, Police p) {
		return sqlSession.insert("policeMapper.addPolice",p);
	}
	
	//게시글 신고삭제
	public int deletePolice(SqlSessionTemplate sqlSession, int p_No) {
		return sqlSession.delete("policeMapper.deletePolice",p_No);
	}
	
	//게시글 전체 신고수
	public int policeListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("policeMapper.policeListCount");
	}
	
	//게시글 신고리스트
	public ArrayList<Police> policeList(SqlSessionTemplate sqlSession, PageInfo pi) {

	int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
	int limit = pi.getBoardLimit();
	
	RowBounds rowBounds = new RowBounds(offset,limit);
	
	return (ArrayList)sqlSession.selectList("policeMapper.policeList",null,rowBounds);
	}
	
	//댓글 신고하기
	public int addPoliceCmt(SqlSessionTemplate sqlSession, PoliceCmt pc) {
		return sqlSession.insert("policeCmtMapper.addPoliceCmt",pc);
	}
	
	//댓글 신고삭제
	public int deletePoliceCmt(SqlSessionTemplate sqlSession, int pc_No) {
		return sqlSession.delete("policeCmtMapper.deletePoliceCmt",pc_No);
	}
	
	//댓글 전체 신고수
	public int policeCmtListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("policeCmtMapper.policeCmtListCount");
	}
	
	//댓글 신고리스트
	public ArrayList<PoliceCmt> policeCmtList(SqlSessionTemplate sqlSession, PageInfo pi) {

	int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
	int limit = pi.getBoardLimit();
	
	RowBounds rowBounds = new RowBounds(offset,limit);
	
	return (ArrayList)sqlSession.selectList("policeCmtMapper.policeCmtList",null,rowBounds);
	}
	
}
