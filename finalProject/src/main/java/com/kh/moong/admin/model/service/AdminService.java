package com.kh.moong.admin.model.service;

import java.util.ArrayList;

import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.member.model.vo.Member;

public interface AdminService {

	//전체 회원 수
	int selectMemberListCount();
	
	//전체 회원 목록
	ArrayList<Member> memberList(PageInfo pi);

	//가입 승인
	int joinApproval(int userNo);

	//가입 거절
	int joinRefusal(int userNo);

	//학생 정보 삭제
	//student 삭제
	int deletStu(int userNo);

	//증명사진 삭제
	int deleteIp(int userNo);

	//성적표 삭제
	int deleteRc(int userNo);

	//Teacher 삭제
	int deleteTea(int userNo);

	//재학증명서 삭제
	int deleteIc(int userNo);

}
