package com.kh.moong.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.moong.member.model.vo.Student;
import com.kh.moong.member.model.vo.Teacher;

@Repository
public class MemberDaoLee {

	//선생님 등록하기
	public int teaEnroll(SqlSessionTemplate sqlSession, Teacher tea) {
		return sqlSession.insert("memberMapperLee.teaEnroll",tea);
	}

	//학생 등록하기
	public int stuEnroll(SqlSessionTemplate sqlSession, Student stu) {
		return sqlSession.insert("memberMapperLee.stuEnroll",stu);
	}

	//학생 성적 수정
	public int stuGradeUpdate(SqlSessionTemplate sqlSession, Student stu) {
		return sqlSession.update("memberMapperLee.stuGradeUpdate",stu);
	}

	//학생 증명사진 등록


	//학생 정보 수정
	public int myPageUpdate(SqlSessionTemplate sqlSession, Student stu) {
		return sqlSession.update("memberMapperLee.myPageUpdate", stu);
	}

	//선생님 탈퇴
	public int teaDelete(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("memberMapperLee.teaDelete",userNo);
	}

	//학생 탈퇴
	public int stuDelete(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("memberMapperLee.stuDelete",userNo);
	}

}
