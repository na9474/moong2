package com.kh.moong.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.member.model.vo.Member;

@Repository
public class AdminDao {

	//전체 회원 수
	public int selectMemberListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectMemberListCount");
	}

	//전체 회원 목록
	public ArrayList<Member> memberList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.memberList", null, rowBounds);
	}

	//가입 승인
	public int joinApproval(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("adminMapper.joinApproval", userNo);
	}
	
	//가입 거정
	public int joinRefusal(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("adminMapper.joinRefusal",userNo);
	}

	//student정보 삭제
	public int deleteStu(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.delete("adminMapper.deleteStu", userNo);
	}

	//증명사진 삭제
	public int deleteIp(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.delete("adminMapper.deleteIp",userNo);
	}

	//성적표 삭제
	public int deleteRc(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.delete("adminMapper.deleteRc",userNo);
	}

	//Teacher정보 삭제
	public int deleteTea(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.delete("adminMapper.deleteTea",userNo);
	}

	//재학증명서 삭제
	public int deleteIc(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.delete("adminMapper.deleteIc",userNo);
	}

}
