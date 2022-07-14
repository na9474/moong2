package com.kh.moong.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.moong.chat.model.service.ChatService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@RequiredArgsConstructor
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	// 포워딩
	@RequestMapping("msgList.ms")
	public String messageGroup() {
		return "chat/chat";
	}
	
	// 채팅방 리스트

	
	// 채팅방 
	
	
	// 채팅방 선택
	
	
	// 메세지 DB 저장
	
	
	// 메세지 내용 List
	
	
	// 메세지 신고
//	@RequestMapping("report.ms")
//	public String messageReport() {
//		
//		return null;
//	}
}