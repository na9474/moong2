package com.kh.moong.chat.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.moong.chat.model.dao.ChatDao;
import com.kh.moong.chat.model.vo.Room;

@Service
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private ChatDao chatDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;


	
	
}