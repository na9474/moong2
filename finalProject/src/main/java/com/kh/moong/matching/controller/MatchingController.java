package com.kh.moong.matching.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.moong.matching.model.service.MatchingService;
import com.kh.moong.matching.model.vo.Matching;

@Controller
public class MatchingController {

	@Autowired
	private MatchingService ms;
	
	@RequestMapping("enroll.ma")
	public String MatchingEnroll() {
		
		return "matching/matchingEnroll";
	}
	
	@RequestMapping("insert.ma")
	public String insertMatching(Matching m) {
		
		//동일한 조건으로 등록한 사람이 있는지 확인 
		int check = ms.checkMatching(m);
		
		if(check == 0) {
			//등록한 사람이 없음 -> 새로운 매칭조건 생성
			
		}else {
			//등록한 사람이 있음 -> 같은 매칭조건으로 들어감
			
		
				
		}
			
		
		
		return null;
	}
	
}
