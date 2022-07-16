package com.kh.moong.police.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.common.template.Pagination;
import com.kh.moong.police.model.service.PoliceService;
import com.kh.moong.police.model.vo.Police;
import com.kh.moong.solution.model.vo.Solution;
import com.kh.moong.solution.model.vo.SolutionCmt;
import com.kh.moong.solution.model.vo.SolutionHeart;

@Controller
public class PoliceController {
	
	@Autowired
	private PoliceService policeService;
	
	@RequestMapping("list.po")
	public String listAll() {
	
		return "admin/admin";
	}
	
	//게시글 신고하기
	@RequestMapping("report.so")
	public String addPolice(int solutionNo) {
		
		Police p = new Police();
		int userNo=1;
		p.setUserNo(userNo);
		String reason="신고완료";
		p.setReason(reason);
		p.setSolutionNo(solutionNo);
		
		int result = policeService.addPolice(p);
		
		if(result>0) {
			System.out.println("신고 성공");
		}else {			
			System.out.println("신고 실패");
		}
		
		return "redirect:detail.so?sno="+solutionNo;
	}
	
	

}
