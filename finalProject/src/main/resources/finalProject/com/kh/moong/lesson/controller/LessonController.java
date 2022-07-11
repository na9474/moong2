package finalProject.com.kh.moong.lesson.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import finalProject.com.kh.moong.lesson.model.service.LessonService;

@Controller
public class LessonController {

	
	@Autowired
	private LessonService lessonService;
	//학생매칭관련
	@RequestMapping("match.ln")
	public String MathcingPage() {
		
		return "matching/matching";
	}
	
	//선생 과외등록관련
	
}
