package com.kh.moong.member.model.service;

import com.kh.moong.member.model.vo.Student;
import com.kh.moong.member.model.vo.Teacher;

public interface MemberServiceLee {

	//선생님 등록 하기
	int teaEnroll(Teacher tea);

	//학생 등록 하기
	int stuEnroll(Student stu);

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
	
	
}
