package com.kh.moong.charts.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.moong.charts.model.service.ChartService;

@Controller
public class ChartController {
	
	@Autowired
	private ChartService chartService;
	
	@RequestMapping("chart.ch")
	public String dashForm(Model m) {
		
	    int allMemCount = chartService.allMemCount();
	    int allTeaCount = chartService.allTeaCount();
	    int allStuCount = chartService.allStuCount();
	    int matchCount = chartService.matchCount();
	    int matchComCount = chartService.matchComCount();
	    
	    List<String> teaGenderLabel = chartService.teaGenderLabel();
	    List<Integer> teaGenderCounts = chartService.teaGenderCounts();

	    List<String> stuGenderLabel = chartService.stuGenderLabel();
	    List<Integer> stuGenderCounts = chartService.stuGenderCounts();
	    
	    List<String> monthMemLabel = chartService.monthMemLabel();
	    List<Integer> monthMemCounts = chartService.monthMemCounts();
	    
	    List<String> monthMatchLabel = chartService.monthMatchLabel();
	    List<Integer> monthMatchCounts = chartService.monthMatchCounts();
	    
	    List<String> koGradeLabel = chartService.koGradeLabel();
	    List<Integer> koGradeCounts = chartService.koGradeCounts();
	    
	    List<String> engGradeLabel = chartService.engGradeLabel();
	    List<Integer> engGradeCounts = chartService.engGradeCounts();
	    
	    List<String> mathGradeLabel = chartService.mathGradeLabel();
	    List<Integer> mathGradeCounts = chartService.mathGradeCounts();
	    
	    List<String> subjectTeacherLabel = chartService.subjectTeacherLabel();
	    List<Integer> subjectTeacherCounts = chartService.subjectTeacherCounts();
	    
	    List<String> styleTeacherLabel = chartService.styleTeacherLabel();
	    List<Integer> styleTeacherCounts = chartService.styleTeacherCounts();
	    
	    m.addAttribute("allMemCount", allMemCount);
	    m.addAttribute("allTeaCount", allTeaCount);
	    m.addAttribute("allStuCount", allStuCount);
	    m.addAttribute("matchCount", matchCount);
	    m.addAttribute("matchComCount", matchComCount);
	    m.addAttribute("teaGenderLabel", teaGenderLabel);
	    m.addAttribute("teaGenderCounts", teaGenderCounts);
	    m.addAttribute("stuGenderLabel", stuGenderLabel);
	    m.addAttribute("stuGenderCounts", stuGenderCounts);
	    m.addAttribute("monthMemLabel", monthMemLabel);
	    m.addAttribute("monthMemCounts", monthMemCounts);
	    m.addAttribute("monthMatchLabel", monthMatchLabel);
	    m.addAttribute("monthMatchCounts", monthMatchCounts);
	    m.addAttribute("koGradeLabel", koGradeLabel);
	    m.addAttribute("koGradeCounts", koGradeCounts);
	    m.addAttribute("engGradeLabel", engGradeLabel);
	    m.addAttribute("engGradeCounts", engGradeCounts);
	    m.addAttribute("mathGradeLabel", mathGradeLabel);
	    m.addAttribute("mathGradeCounts", mathGradeCounts);
	    m.addAttribute("subjectTeacherLabel", subjectTeacherLabel);
	    m.addAttribute("subjectTeacherCounts", subjectTeacherCounts);
	    m.addAttribute("styleTeacherLabel", styleTeacherLabel);
	    m.addAttribute("styleTeacherCounts", styleTeacherCounts);
	    
	    return "admin/Chart";

	}
}
