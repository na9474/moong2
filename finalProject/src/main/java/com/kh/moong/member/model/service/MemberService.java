package com.kh.moong.member.model.service;

import com.kh.moong.member.model.vo.Member;
import com.kh.moong.member.model.vo.Student;
import com.kh.moong.member.model.vo.Teacher;

public interface MemberService {
	
	Member loginMember(Member m);
	
	int insertMember(Member m);

	
	
	//int updateMember(Member m);
		
	//int deleteMember(String userId);
	
	// 아이디 중복 체크
//	int idCheck(String chkId);
	
	
	
	//로그인한 학생/선생정보 가져오기
	Student loginStudentInfo(int userNo);
	Teacher loginTeacherInfo(int userNo);
}
