package com.kh.moong.matching.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.moong.matching.model.dao.MatchingDaoNam;
import com.kh.moong.matching.model.vo.Matching;
import com.kh.moong.matching.model.vo.Room;

@Service
public class MatchingServiceImplNam implements MatchingServiceNam {
	@Autowired
	private MatchingDaoNam mdn;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Room> roomList(Room r) {
		return mdn.roomList(sqlSession, r);
	}

	@Override
	public ArrayList<Matching> adRoomList(Matching ma) {
		return mdn.adRoomList(sqlSession, ma);
	}

	@Override
	public int insertUrl(Room r) {
		return mdn.insertUrl(sqlSession, r);
	}

	@Override
	public int updateUrlS(int groupNo) {
		return mdn.updateUrlS(sqlSession, groupNo);
	}

	@Override
	public ArrayList<Room> aRoomList() {
		return mdn.aRoomList(sqlSession);
	}
	
//	@Override
//	public int deleteUrl(Room r) {
//		return mdn.deleteUrl(sqlSession, r);
//	}
//
//	@Override
//	public int modifyUrl(Room r) {
//		return mdn.modifyUrl(sqlSession, r);
//	}

}
