package com.kh.moong.myLesson.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.moong.member.model.vo.Member;
import com.kh.moong.myLesson.model.service.MyLessonService;
import com.kh.moong.myLesson.model.vo.Lesson;

@Controller
public class MyLessonController {

	@Autowired MyLessonService myLessonService;
	
	@RequestMapping("lessonList.me")
	public String lessonList(HttpSession session, Model model) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		ArrayList<Lesson> list = myLessonService.lessonList(loginUser);
		
		model.addAttribute("list",list);
		
		return "member/lessonList";
		
	}
}
