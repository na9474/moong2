package com.kh.moong.member.model.service;

import com.kh.moong.member.model.vo.IdCard;
import com.kh.moong.member.model.vo.IdPicture;
import com.kh.moong.member.model.vo.Member;
import com.kh.moong.member.model.vo.ReportCard;
import com.kh.moong.member.model.vo.Student;
import com.kh.moong.member.model.vo.Teacher;

public interface MemberServiceLee {

	//선생님 등록 하기
	int teaEnroll(Teacher tea);

	//학생 등록 하기
	int stuEnroll(Student stu);

	//idPicture 넣기
	int insertIdP(IdPicture idP);
	
	//성적표 넣기
	int insertRc(ReportCard rc);

	//학생으로 등록
	int memberStudent(int userNo);

	//학생 성적 수정
	int stuGradeUpdate(Student stu);

	//회원정보 수정 
	//증명사진 등록
//	int insertIdPicture(String originalFilename, String changeName, Student stu);

	//회원정보 수정 - 학생
	int myPageUpdate(Student stu);

	//선생님 탈퇴
	int teaDelete(int userNo);

	//학생 탈퇴
	int stuDelete(int userNo);

	//학생 마이페이지 정보
	Student stuMyPage(int userNo);

	//증명 사진 가져오기
	IdPicture selectIp(int userNo);

	//학생 개인 정보 수정
	int stuUpdateForm(Member m);

	//로그인 정보 가져오기
	Member loginMember(Member m);

	//기존 증명사진 삭제
	int deleteIp(int userNo);

	//성적표 가져오기
	ReportCard selectRc(int userNo);

	//기존 성적표 삭제
	int deleteRc(int userNo);

	//재학증명서 등록
	int insertIc(IdCard ic);

	//선생닝으로 등록
	int memberTeacher(int userNo);

	//선생님 마이페이지 정보 
	Teacher teaMyPage(int userNo);

	//재학증명서 가져오기
	IdCard selectIc(int userNo);

	//재학증명서 삭제
	int deleteIc(int userNo);

	//선생님 정보 수정
	int teaUpdate(Teacher tea);

	//비밀번호 변경
	int updatePwd(Member m);

	//Member에 담긴 회원 정보
	Member selectMember(int userNo);

	//member의 modifyDate, approval 수정
	int updateMember(int userNo);



	
	
}
