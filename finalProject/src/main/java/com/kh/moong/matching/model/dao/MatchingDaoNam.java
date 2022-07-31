package com.kh.moong.matching.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.moong.matching.model.vo.Matching;
import com.kh.moong.matching.model.vo.Room;

@Repository
public class MatchingDaoNam {
	public ArrayList<Room> roomList(SqlSessionTemplate sqlSession, Room r) {
		return (ArrayList)sqlSession.selectList("RoomMapper.roomList", r);
	}

	public ArrayList<Matching> adRoomList(SqlSessionTemplate sqlSession, Matching ma) {
		return (ArrayList)sqlSession.selectList("MatchingMapper.adRoomList", ma);
	}

	public int insertUrl(SqlSessionTemplate sqlSession, Room r) {
		System.out.println(r);
		return sqlSession.insert("RoomMapper.insertUrl", r);
	}

	public int updateUrlS(SqlSessionTemplate sqlSession, int groupNo) {
		return sqlSession.update("MatchingMapper.updateUrlS",groupNo);
	}

	public ArrayList<Room> aRoomList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("RoomMapper.aRoomList");
	}
	
//	public int deleteUrl(SqlSessionTemplate sqlSession, Room r) {
//		return sqlSession.update("RoomMapper.deleteUrl", r);
//	}
//
//	public int modifyUrl(SqlSessionTemplate sqlSession, Room r) {
//		System.out.println(r);
//		return sqlSession.update("RoomMapper.modifyUrl", r);
//	}
}
