package com.kh.moong.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.moong.member.model.vo.IdCard;
import com.kh.moong.member.model.vo.IdPicture;
import com.kh.moong.member.model.vo.Member;
import com.kh.moong.member.model.vo.ReportCard;
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

	//학생으로 등록
	public int memberStudent(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("memberMapperLee.memberStudent", userNo);
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

	//idPicture 넣기
	public int insertIdP(SqlSessionTemplate sqlSession, IdPicture idP) {
		return sqlSession.insert("memberMapperLee.insertIdP", idP);
	}

	//성적표 넣기
	public int insertRc(SqlSessionTemplate sqlSession, ReportCard rc) {
		return sqlSession.insert("memberMapperLee.insertRc", rc);
	}

	//학생 마이페이지
	public Student stuMyPage(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("memberMapperLee.stuMyPage", userNo);
	}
	
	//증명 사진 가져오기
	public IdPicture selectIp(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("memberMapperLee.selectIp", userNo);
	}

	//학생 개인 정보 수정
	public int stuUpdateForm(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapperLee.stuUpdateForm", m);
	}

	//로그인 정보 가져오기
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapperLee.loginMember", m);
	}

	//증명사진 삭제하기
	public int deleteIp(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("memberMapperLee.deleteIp",userNo);
	}

	//성적표 가져오기
	public ReportCard selectRc(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("memberMapperLee.selectRc", userNo);
	}

	//기존 성젹표 삭제
	public int deleteRc(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("memberMapperLee.deleteRc",userNo);
	}

	//재학증명서 등록
	public int insertIc(SqlSessionTemplate sqlSession, IdCard ic) {
		return sqlSession.insert("memberMapperLee.insertIc",ic);
	}

	//선생님으로 등록
	public int memberTeacher(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("memberMapperLee.memberTeacher",userNo);
	}

	//선생님 마이페이지 정보
	public Teacher teaMyPage(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("memberMapperLee.teaMyPage", userNo);
	}
	
	//재학증명서 가져오기
	public IdCard selectIc(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("memberMapperLee.selectIc", userNo);
	}
	
	//재학증명서 삭제
	public int deleteIc(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("memberMapperLee.deleteIc", userNo);
	}

	//선생님 정보 수정
	public int teaUpate(SqlSessionTemplate sqlSession, Teacher tea) {
		return sqlSession.update("memberMapperLee.teaUpdate",tea);
	}
	
	//비밀번호 변경
	public int updatePwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapperLee.updatePwd", m);
	}

	//Member에 담긴 회원 정보
	public Member selectMember(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("memberMapperLee.selectMember", userNo);
	}
	
	//member의 modifyDate, approval 수정
	public int updateMember(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("memberMapperLee.updateMember", userNo);
	}

	
	

}
