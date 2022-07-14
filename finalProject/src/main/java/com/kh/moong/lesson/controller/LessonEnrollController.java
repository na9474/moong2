package com.kh.moong.lesson.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.moong.lesson.model.service.LessonEnrollService;
import com.kh.moong.lesson.model.vo.LessonEnroll;

@Controller
public class LessonEnrollController {
	
	@Autowired
	private LessonEnrollService ls;
		
		//과외등록 리스트 뽑기
		@RequestMapping("list.le")
		public String LessonList(int userNo,Model model) {
			
			ArrayList<LessonEnroll> list = ls.selectList(userNo);
			
			model.addAttribute("list",list);
			return "lesson/lessonEnrollList";
		}
		
		//과외등록 페이지로 이동
		@RequestMapping("enrollFrom.le")
		public String lessonEnrollForm() {
			
			return "lesson/lessonEnrollForm";
		}
		
		
		//과외등록
		@RequestMapping("insert.le")
		public ModelAndView lessonInsert(LessonEnroll le,ModelAndView mv,HttpSession session) {
			
			//똑같은 과목으로 등록된 과외가 있는지 확인
			int result  = ls.lessonInsertCheck(le);
					 System.out.println(result);
				
				if(result>0) { //똑같은 과목으로 생성된 과외가 있음(과외등록불가능)
					session.setAttribute("alertMsg", "등록된 같은 과목이 있습니다 ");
					mv.setViewName("lesson/lessonEnrollForm");
				}else { //똑같은 과목으로 생성된 과외가 없음(과외등록가능) 
					int result2 = ls.lessonInsert(le);
					if(result2>0) { //과외등록 성공
						session.setAttribute("alertMsg", "과외등록성공");
						mv.setViewName("redirect:list.le?userNo="+le.getUserNo());
					}else {	//과외등록 실패
						mv.addObject("errorMsg","과외등록실패").setViewName("common/errorPage");
					}
				}
			
			return mv;
		}
		
}


