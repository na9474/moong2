package com.kh.moong.matching.model.vo;

import lombok.Data;

@Data
public class Room {
	private int rono;
	private int roomNo;
	private String roomUrl;
	private String status;
	
	private int userNo;
	private String subject;
}