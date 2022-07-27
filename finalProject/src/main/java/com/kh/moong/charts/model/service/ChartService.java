package com.kh.moong.charts.model.service;

import java.util.List;

import com.kh.moong.charts.model.vo.Chart;

public interface ChartService {

	int allMemCount();	
	
	int allTeaCount();
	
	int allStuCount();
	
	int matchCount();
	
	int matchComCount();
	
	List<String> teaGenderLabel();
	List<Integer> teaGenderCounts();
	
	List<String> stuGenderLabel();
	List<Integer> stuGenderCounts();
	
	List<String> monthMemLabel();
	List<Integer> monthMemCounts();
	
	List<String> monthMatchLabel();
	List<Integer> monthMatchCounts();
	
	List<String> koGradeLabel();
	List<Integer> koGradeCounts();
	
	List<String> engGradeLabel();
	List<Integer> engGradeCounts();

	List<String> mathGradeLabel();
	List<Integer> mathGradeCounts();
	
	List<String> subjectTeacherLabel();
	List<Integer> subjectTeacherCounts();
	
	List<String> styleTeacherLabel();
	List<Integer> styleTeacherCounts();

}
