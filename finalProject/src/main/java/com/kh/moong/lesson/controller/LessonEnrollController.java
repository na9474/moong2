package com.kh.moong.lesson.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.moong.lesson.model.service.LessonEnrollService;
import com.kh.moong.lesson.model.vo.LessonEnroll;

@Controller
public class LessonEnrollController {
	
	@Autowired
	private LessonEnrollService lessonEnrollSerive;
		
	
		
		@RequestMapping("list.ln")
		public String LessonList(int userNo,Model model) {
			
			ArrayList<LessonEnroll> list = lessonEnrollSerive.selectList(userNo);
			
			model.addAttribute("list",list);
			return "lesson/lessonEnrollList";
		}
		
		
}


