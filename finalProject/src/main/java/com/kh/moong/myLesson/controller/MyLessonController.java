package com.kh.moong.myLesson.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	//레슨 종료
	@RequestMapping("lessonEnd.me")
	public String lessonEnd(Model model, 
					@RequestParam(value="no",defaultValue="0") int lNo,
					HttpSession session
							) {
		int result = myLessonService.updateLessonEnd(lNo);
		
		if(result>0) {
			session.setAttribute("alertMsg", "레슨이 종료 되었습니다");
			
			return "redirect:/lessonList.me";
		}else {
			session.setAttribute("alertMsg", "레슨 종료 실패");
			
			return "redirect:/";
		}
		
		
	}
}
