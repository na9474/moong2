package com.kh.moong.matching.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.moong.matching.model.service.MatchingService;

@Controller
public class MatchingController {

	@Autowired
	private MatchingService matchingService;
	
	@RequestMapping("enroll.ma")
	public String MatchingEnroll() {
		
		return "matching/matchingEnroll";
	}
	
}
