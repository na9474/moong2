package com.kh.moong.matching.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.moong.matching.model.vo.Matching;
import com.kh.moong.matching.model.vo.Room;

public interface MatchingServiceNam {
	ArrayList<Room> roomList(Room r);

	ArrayList<Matching> adRoomList(Matching ma);

	int insertUrl(Room r);

	int updateUrlS(int groupNo);

	ArrayList<Room> aRoomList();

}
