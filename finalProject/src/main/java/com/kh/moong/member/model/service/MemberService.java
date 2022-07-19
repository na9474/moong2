package com.kh.moong.member.model.service;

import com.kh.moong.member.model.vo.Member;

public interface MemberService {
	
	Member loginMember(Member m);
	
	int insertMember(Member m);

	//int updateMember(Member m);
		
	//int deleteMember(String userId);
	
	// 아이디 중복 체크
//	int idCheck(String chkId);
	
	// 아이디 찾기
//	Member selectFindId(Member m);
	
}
