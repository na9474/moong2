package com.kh.moong.chat.model.vo;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter  // DTO (데이터 전달 용도로만 사용)
public class Chat {
	private int chatNo; //	채팅 번호
	private int roomNo; //	채팅방 번호
	private int userNo; //	유저 번호
	private String text; //	채팅 내용
	private String chatOriginName; //  본래 첨부파일명
	private String chatSysName;//	수정 첨부파일명
	private Timestamp time; //	채팅 시간
}