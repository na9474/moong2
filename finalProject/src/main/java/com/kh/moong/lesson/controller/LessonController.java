package com.kh.moong.lesson.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LessonController {
	
		
		
		@RequestMapping("match.ln")
		public ModelAndView MatchingView(ModelAndView mv) {
			mv.setViewName("matching/matchingView");
			return mv;
		}
	}

