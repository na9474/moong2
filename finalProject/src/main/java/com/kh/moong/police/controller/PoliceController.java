package com.kh.moong.police.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.common.template.Pagination;
import com.kh.moong.member.model.vo.Member;
import com.kh.moong.police.model.service.PoliceService;
import com.kh.moong.police.model.vo.Police;
import com.kh.moong.police.model.vo.PoliceCmt;
import com.kh.moong.solution.model.service.SolutionService;
import com.kh.moong.solution.model.vo.SolutionCmt;

@Controller
public class PoliceController {
	
	@Autowired
	private PoliceService policeService;
	
	@Autowired
	private SolutionService solutionService;
	
	
	//게시글 신고하기
	@RequestMapping("report.so")
	public String addPolice(Police p, int solutionNo, HttpServletRequest request) {

		int loginNo = 0;
		if(request.getSession().getAttribute("loginUser") !=null) {
			loginNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
		}

		p.setSolutionNo(solutionNo);
		p.setUserNo(loginNo);
		
		int result = policeService.addPolice(p);
		
		if(result>0) {
			System.out.println("신고 성공");
		}else {			
			System.out.println("신고 실패");
		}
		
		return "redirect:detail.so?sno="+solutionNo;
	}
	
	//게시글 신고리스트
	@RequestMapping("list.po")
	public String policeList(
					@RequestParam(value="cpage",defaultValue="1") int currentPage,
					Model model
							) {
		
		int listCount = policeService.policeListCount();
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Police> list = policeService.policeList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "admin/police";
	}
	
	//게시글 신고삭제
	@RequestMapping("delete.po")
	public String deletePolice(int p_No) {
		
		int result = policeService.deletePolice(p_No);
		
		if(result>0) { 
			System.out.println("삭제 성공");
		}else {
			System.out.println("삭제 실패");
		}
		return "redirect:list.po";
	}
	
	//댓글 신고하기
	@RequestMapping("cmtReport.so")
	public String addPoliceCmt(HttpServletRequest request, int scNo, PoliceCmt pc, int solutionNo) {
		
		int loginNo = 0;
		if(request.getSession().getAttribute("loginUser") !=null) {
			loginNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
		}
		
		pc.setUserNo(loginNo);
		pc.setScNo(scNo);
		
		int result = policeService.addPoliceCmt(pc);
		
		if(result>0) {
			System.out.println("신고 성공");
		}else {			
			System.out.println("신고 실패");
		}
		
		return "redirect:detail.so?sno="+solutionNo;
	}
	
	//댓글 신고삭제
	@RequestMapping("cmtDelete.po")
	public String deletePoliceCmt(int pc_No) {
		
		int result = policeService.deletePoliceCmt(pc_No);
		
		if(result>0) { 
			System.out.println("삭제 성공");
		}else {
			System.out.println("삭제 실패");
		}
		return "redirect:cmtList.po";
	}
	
	//댓글 신고리스트
	@RequestMapping("cmtList.po")
	public String policeCmtList(
					@RequestParam(value="cpage",defaultValue="1") int currentPage,
					Model model) {
		
		int listCount = policeService.policeCmtListCount();
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<PoliceCmt> list = policeService.policeCmtList(pi);

		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);

		return "admin/policeCmt";
	}
	
	// ajax  이름은 cmtCon.po
	@RequestMapping(value="cmtCon.po",produces="application/json; charset=utf8")
	@ResponseBody
	public String policeCmtCon(int scNo) {
		
		JsonObject jsonObject = new JsonObject();
		SolutionCmt cmtCon = solutionService.cmtSelctSn(scNo);
		
//		jsonObject.addProperty("scNo", cmtCon.getScNo());
//		jsonObject.addProperty("userNo", cmtCon.getUserNo());
//		jsonObject.addProperty("userId", cmtCon.getUserId());
//		jsonObject.addProperty("solutionCmtContents", cmtCon.getSolutionCmtContents());
//		jsonObject.addProperty("createDate", cmtCon.getCreateDate());
//		jsonObject.addProperty("solutonNo", cmtCon.getSolutionNo());
//		
//		String cmtData = jsonObject.toString();
		return new Gson().toJson(cmtCon);
		
		
	}

}