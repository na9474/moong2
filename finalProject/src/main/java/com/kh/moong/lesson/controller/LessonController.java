package com.kh.moong.lesson.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.moong.lesson.model.service.LessonService;
import com.kh.moong.lesson.model.vo.Lesson;
import com.kh.moong.matching.model.service.MatchingService;
import com.kh.moong.matching.model.vo.Matching;

@Controller
public class LessonController {

	@Autowired
	private LessonService ls;
	private MatchingService ms;
	
@RequestMapping("lesson.ls")
public ModelAndView LessonStart(int groupNo,int userNo,ModelAndView mv,HttpSession session) {
		

	
	ArrayList<Matching> mList  = ls.allUserNo(groupNo);
	
	
	Matching m = ls.MatchingChiefInfo(groupNo);
	
	Lesson l = new Lesson();
	l.setSubject(m.getSubject().substring(0, m.getSubject().length() - 1));
	l.setTeacherNo(userNo);
	
	
	int result =1;
	int uNo =0;
	for(int i=0; i<mList.size(); i++) {
		uNo= mList.get(i).getUserNo();
		l.setStudentNo(uNo);
		 result *= ls.insertLesson(l);
	 
}
		if(result>0) { //성공
			
			int result2= ls.deleteAlarmList(groupNo);
			int result3= ls.deleteMatching2(groupNo);
			session.setAttribute("alertMsg", "과외시작성공");
			mv.setViewName("redirect:/");
		}else {
			mv.addObject("errorMsg","오류오류 반복문돌리다 오류").setViewName("common/errorPage");
		}
	
	
	return mv;
}
}
