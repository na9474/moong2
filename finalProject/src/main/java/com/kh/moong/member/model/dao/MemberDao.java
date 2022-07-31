package com.kh.moong.member.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.moong.member.model.vo.Member;
import com.kh.moong.member.model.vo.Student;
import com.kh.moong.member.model.vo.Teacher;

@Repository
public class MemberDao {
	
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember",m);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember",m);
	}

	

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember",m);
	}


	public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("memberMapper.deleteMember",userId);
	}

	// 아이디 유효성 검사
	public int idCheck(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.idOk",userId);
	}
	
	// 아이디 찾기
	public Member selectFindId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.selectFindId", m);
	}
	
	// 비밀번호 찾기(일치하는 데이터 있는지 확인)
	public int findPwdCheck(SqlSessionTemplate sqlSession, Member m) {
		System.out.println(m);
		return sqlSession.selectOne("memberMapper.findPwdCheck", m);
	}
	
	// 비밀번호 찾기(임시비밀번호로 변경)
	public int findPwd(SqlSessionTemplate sqlSession, String userId, String email, String userPwd) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("email", email);
		map.put("userPwd", userPwd);
		return sqlSession.update("memberMapper.findPwd", map);
	}
	
	
	
	
	//로그인한 선생/학생정보 조회
	public Student loginStudentInfo(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("memberMapper.loginStudentInfo",userNo);
	}
	public Teacher loginTeacherInfo(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("memberMapper.loginTeacherInfo",userNo);
	}
	
}
