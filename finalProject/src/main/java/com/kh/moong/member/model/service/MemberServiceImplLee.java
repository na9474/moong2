package com.kh.moong.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.moong.member.model.dao.MemberDaoLee;
import com.kh.moong.member.model.vo.Student;
import com.kh.moong.member.model.vo.Teacher;

@Service
public class MemberServiceImplLee implements MemberServiceLee {

	@Autowired
	private MemberDaoLee memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//선생님 등록 하기
	@Override
	public int teaEnroll(Teacher tea) {
		return memberDao.teaEnroll(sqlSession,tea);
	}
	
	//학생 등록 하기
	@Override
	public int stuEnroll(Student stu) {
		return memberDao.stuEnroll(sqlSession,stu);
	}

	//학생 성적 수정
	@Override
	public int stuGradeUpdate(Student stu) {
		return memberDao.stuGradeUpdate(sqlSession,stu);
	}

	//학생 증명사진 등록
//	@Override
//	public int insertIdPicture(String originalFilename, String changeName, Student stu) {
//		return memberDao.insertIdPicture(sqlSession,stu,originalFilename,changeName);
//	}

	//학생 정보 수정
	@Override
	public int myPageUpdate(Student stu) {
		return memberDao.myPageUpdate(sqlSession,stu);
	}

	//선생님 탈퇴
	@Override
	public int teaDelete(int userNo) {
		return memberDao.teaDelete(sqlSession,userNo);
	}
	
	//학생 탈퇴
	@Override
	public int stuDelete(int userNo) {
		return memberDao.stuDelete(sqlSession,userNo);
	}


	
}
