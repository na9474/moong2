package com.kh.moong.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.moong.member.model.dao.MemberDaoLee;
import com.kh.moong.member.model.vo.IdCard;
import com.kh.moong.member.model.vo.IdPicture;
import com.kh.moong.member.model.vo.Member;
import com.kh.moong.member.model.vo.ReportCard;
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

	//idPicture 넣기
	@Override
	public int insertIdP(IdPicture idP) {
		return memberDao.insertIdP(sqlSession,idP);
	}
	
	//성적표 넣기
	@Override
	public int insertRc(ReportCard rc) {
		return memberDao.insertRc(sqlSession,rc);
	}
	
	//학생으로 등록
	@Override
	public int memberStudent(int userNo) {
		return memberDao.memberStudent(sqlSession,userNo);
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

	//학생 마이페이지 정보
	@Override
	public Student stuMyPage(int userNo) {
		return memberDao.stuMyPage(sqlSession,userNo);
	}

	//증명 사진 가져오기
	@Override
	public IdPicture selectIp(int userNo) {
		return memberDao.selectIp(sqlSession,userNo);
	}

	//학생 개인 정보 수정
	@Override
	public int stuUpdateForm(Member m) {
		return memberDao.stuUpdateForm(sqlSession,m);
	}

	//로그인 정보 가져오기
	@Override
	public Member loginMember(Member m) {
		return memberDao.loginMember(sqlSession,m);
	}

	//기존 증명사진 삭제
	@Override
	public int deleteIp(int userNo) {
		return memberDao.deleteIp(sqlSession,userNo);
	}

	//성적표 가져오기
	@Override
	public ReportCard selectRc(int userNo) {
		return memberDao.selectRc(sqlSession,userNo);
	}

	//기존 성적표 삭제
	@Override
	public int deleteRc(int userNo) {
		return memberDao.deleteRc(sqlSession,userNo);
	}

	//재학증명서 등록
	@Override
	public int insertIc(IdCard ic) {
		return memberDao.insertIc(sqlSession,ic);
	}

	//선생님으로 등록
	@Override
	public int memberTeacher(int userNo) {
		return memberDao.memberTeacher(sqlSession,userNo);
	}

	//선생님 마이페이지 정보
	@Override
	public Teacher teaMyPage(int userNo) {
		return memberDao.teaMyPage(sqlSession,userNo);
	}

	//재학증명서 가져오기
	@Override
	public IdCard selectIc(int userNo) {
		return memberDao.selectIc(sqlSession,userNo);
	}

	//재학증명서 삭제
	@Override
	public int deleteIc(int userNo) {
		return memberDao.deleteIc(sqlSession,userNo);
	}

	//선생님 정보 수정
	@Override
	public int teaUpdate(Teacher tea) {
		return memberDao.teaUpate(sqlSession,tea);
	}

	//비밀번호 변경
	@Override
	public int updatePwd(Member m) {
		return memberDao.updatePwd(sqlSession,m);
	}

	//Member에 담긴 회원 정보
	@Override
	public Member selectMember(int userNo) {
		return memberDao.selectMember(sqlSession, userNo);
	}

	//member의 modifyDate, approval 수정
	@Override
	public int updateMember(int userNo) {
		return memberDao.updateMember(sqlSession,userNo);
	}





	
}
