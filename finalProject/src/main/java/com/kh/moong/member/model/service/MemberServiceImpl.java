package com.kh.moong.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.moong.member.model.dao.MemberDao;
import com.kh.moong.member.model.vo.Member;
import com.kh.moong.member.model.vo.Student;
import com.kh.moong.member.model.vo.Teacher;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member loginMember(Member m) {
		
		Member loginUser = memberDao.loginMember(sqlSession, m);
		
		return loginUser;
	}
	
	@Override
	public int insertMember(Member m) {
		
		int result = memberDao.insertMember(sqlSession, m);
		
		return result;
	}

	
	// 아이디 유효성 검사
//	@Override
//	public int idCheck(String userId) {
//		
//		return memberDao.idCheck(sqlSession,userId);
//	}
	
	
	
	
	//로그인한 학생/선생정보 가져오기 
	@Override
	public Student loginStudentInfo(int userNo) {
		return memberDao.loginStudentInfo(sqlSession,userNo);
	}
	@Override
	public Teacher loginTeacherInfo(int userNo) {
		return memberDao.loginTeacherInfo(sqlSession,userNo);
	}
}
