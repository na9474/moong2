package com.kh.moong.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.moong.member.model.vo.Member;

@Repository
public class MemberDao {
	
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember",m);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember",m);
	}

//	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
//		return sqlSession.update("memberMapper.updateMember",m);
//	}


//	public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
//		return sqlSession.update("memberMapper.deleteMember",userId);
//	}

	// 아이디 유효성 검사
//	public int idCheck(SqlSessionTemplate sqlSession, String userId) {
//		return sqlSession.selectOne("memberMapper.idOk",userId);
//	}
	
	// 아이디 찾기
//	public String selectFindId(SqlSessionTemplate sqlSession, String userName, String email) {
//		return sqlSession.selectOne("memberMapper.selectFindId", userName, email);
//	}
	
}
