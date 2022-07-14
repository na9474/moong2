package com.kh.moong.chat.model.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter  // DTO (데이터 전달 용도로만 사용)
public class Room {
	private int roomNo;  //	채팅방 번호
	private String status;  //	채팅방 상태(나가기 버튼)
}