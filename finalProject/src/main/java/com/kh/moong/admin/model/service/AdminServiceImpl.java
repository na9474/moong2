package com.kh.moong.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.moong.admin.model.dao.AdminDao;
import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//전체 회원 수
	@Override
	public int selectMemberListCount() {
		return adminDao.selectMemberListCount(sqlSession);
	}

	//전체 회원 목록
	@Override
	public ArrayList<Member> memberList(PageInfo pi) {
		return adminDao.memberList(sqlSession,pi);
	}

	//가입 승인
	@Override
	public int joinApproval(int userNo) {
		return adminDao.joinApproval(sqlSession,userNo);
	}

	//가입 거절
	@Override
	public int joinRefusal(int userNo) {
		return adminDao.joinRefusal(sqlSession,userNo);
	}

	//student정보 삭제
	@Override
	public int deletStu(int userNo) {
		return adminDao.deleteStu(sqlSession,userNo);
	}

	//증명사진 삭제
	@Override
	public int deleteIp(int userNo) {
		return adminDao.deleteIp(sqlSession,userNo);
	}

	//성적표 삭제
	@Override
	public int deleteRc(int userNo) {
		return adminDao.deleteRc(sqlSession,userNo);
	}

	//Teacher 정보 삭제
	@Override
	public int deleteTea(int userNo) {
		return adminDao.deleteTea(sqlSession,userNo);
	}

	//재학증명서 삭제
	@Override
	public int deleteIc(int userNo) {
		return adminDao.deleteIc(sqlSession,userNo);
	}

}
