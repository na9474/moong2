package com.kh.moong.myBoard.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.common.template.Pagination;
import com.kh.moong.member.model.vo.Member;
import com.kh.moong.myBoard.model.service.MyBoardService;
import com.kh.moong.myBoard.model.vo.Board;
import com.kh.moong.solution.model.vo.Solution;

@Controller
public class MyBoardController {

	@Autowired
	private MyBoardService myBoardService;
	
	//작성 게시글
	//작성 게시글 목록
	//자유게시판
	@RequestMapping("myBoardListView.me")
	public String myBoardListView(
								HttpSession session,
								@RequestParam(value="cpage",defaultValue="1") int currentPage,
								Model model	
								) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		//모든 게시판 글 불러오기
		int listCount = myBoardService.selectBoardListCount(userNo);

		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<Board> blist = myBoardService.selectBoardList(pi,userNo);

		model.addAttribute("blist",blist);
		model.addAttribute("pi",pi);

		
		
		return "member/myBoardListView";
	}
	
	//문제풀이 게시판
	@RequestMapping("mySolutionListView.me")
	public String mySolutionListView(
									HttpSession session,
									@RequestParam(value="cpage",defaultValue="1") int currentPage,
									Model model	
									) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();

		int listCount = myBoardService.selectSolutionListCount(userNo);
	
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
	
		ArrayList<Solution> slist = myBoardService.selectSolutionList(pi,userNo);
	
		model.addAttribute("slist",slist);
		model.addAttribute("pi",pi);

		return "member/mySolutionListView";

	}
	
	
	
	//작성 게시글 상세보기
	
	
	//좋아요 게시글
	//좋아요 게시글 목록
	//일반 게시판
	@RequestMapping("likeBoardListView.me")
	public String likeBoardListView(
									HttpSession session,
									@RequestParam(value="cpage",defaultValue="1") int currentPage,
									Model model	
									) {

		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();

		int listCount = myBoardService.selectLikeBoardListCount(userNo);
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<Board> blist = myBoardService.selectLikeBoardList(pi,userNo);

		model.addAttribute("blist",blist);
		model.addAttribute("pi",pi);

		return "member/likeBoardListView";
	}
	
	//문제풀이 게시판
	@RequestMapping("likeSolutionListView.me")
	public String likeSolutionListView(
										HttpSession session,
										@RequestParam(value="cpage",defaultValue="1") int currentPage,
										Model model
										) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();

		int listCount = myBoardService.selectLikeSolutionListCount(userNo);
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<Solution> slist = myBoardService.selectLikeSolutionList(pi,userNo);

		model.addAttribute("slist",slist);
		model.addAttribute("pi",pi);

		
		return "member/likeSolutionListView";
	}
	
	
	
	
	
	
	
	
	

}
