package com.kh.moong.chat.model.vo;

import lombok.Data;

@Data
public class RoomJoin {
	private String joinId;  //	채팅 참여자ID
	private int userNo;  //	유저 번호
	private int roomNo;  //	채팅방 번호
}
