package com.kh.moong.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.moong.board.model.service.BoardService;
import com.kh.moong.board.model.vo.Board;
import com.kh.moong.board.model.vo.BoardLike;
import com.kh.moong.board.model.vo.BoardReply;
import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.common.template.Pagination;
import com.kh.moong.member.model.vo.Member;
import com.kh.moong.solution.model.vo.Solution;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("list.bo")
	public String selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model, String search_cat, String keyword) {
		
		int listCount = boardService.selectListCount();
		
		int pageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Board> list = boardService.selectList(pi, search_cat, keyword);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "board/boardListView";
	}
	
	@RequestMapping("enrollForm.bo")
	public String boardEnrollForm() {
		
		return "board/boardEnrollForm";
	}
	
	@RequestMapping("insert.bo")
	public String insertBoard(
							Board b
							,MultipartFile upfile
							,HttpSession session
							,Model model) {
		
		
		if(!upfile.getOriginalFilename().equals("")) {//파일이 있을 때

			
			
		
			
			String bfSysName = saveFile(upfile,session);
			
			b.setBfOriginName(upfile.getOriginalFilename());
			b.setBfSysName("resources/uploadFiles/"+bfSysName);
		}
			
			int result = boardService.insertBoard(b);
	 		
			if(result>0) {
				
				session.setAttribute("alertMsg", "게시글을 작성하셨습니다.");
				return "redirect:list.bo";
				
			}else { //실패
				model.addAttribute("errorMsg", "게시글 작성 실패");
				return "common/errorPage";
			}
			
		}
		
	@RequestMapping("detail.bo")
	public ModelAndView selectBoard(int bno,ModelAndView mv, HttpServletRequest request) {
		
		//조회수 증가 
		int result = boardService.increaseCount(bno);
		
		int loginNo = 0;
		if(request.getSession().getAttribute("loginUser") !=null) {
			loginNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
		}
		
		int likeYn = boardService.boardLikeCheck(bno, loginNo);
		
		if(result > 0) { //성공적으로 조회수가 증가되었다면
			
			//상세보기할 정보를 select로 조회 해오기
			Board b = boardService.selectBoard(bno);
			
			int likeCount = boardService.boardLikeCount(bno);
			
			//메소드 체이닝 (단 view정보가 뒤에 와야함)
			mv.addObject("likeYn",likeYn);
			mv.addObject("b",b);
			mv.addObject("loginNo", loginNo);
			mv.addObject("likeCount", likeCount).setViewName("board/boardDetailView");
			
		}else {
			
			mv.addObject("errorMsg","게시글 조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	public String saveFile(MultipartFile upfile,HttpSession session) {
		
		//1.원본파일명 뽑기
		String originName = upfile.getOriginalFilename(); // "dog.jpg" 
		//2.시간 형식을 문자열로 뽑아오기
		//년월일시분초
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		//3.뒤에 붙을 5자리 랜덤값 뽑기
		int ranNum = (int)(Math.random() * 90000 + 10000); //5자리 랜덤값
		
		//4.원본 파일명으로부터 확장자명 뽑기
		//.jpg
		String ext = originName.substring(originName.lastIndexOf("."));
		
		//5.다 이어붙이기
		String bfSysName = currentTime+ranNum+ext;
		
		//6.업로드 하고자하는 물리적인 위치 알아내기(경로)
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		//7. 경로와 수정파일명을 합쳐서 업로드하기
		try {
			upfile.transferTo(new File(savePath+bfSysName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return bfSysName;
		
	}

	@RequestMapping("insert.ph")
	public String insertPhtoBoard(
	   						   Board b
							  ,MultipartFile[] upfiles
							  ,HttpSession session
							  ,Model model
							  ) {
		
		System.out.println("리스트"+upfiles);
		
		for(MultipartFile m : upfiles) {
		System.out.println(m.getOriginalFilename());
		}
		String[] bfSysNames = new String[upfiles.length];
		
		for(int i=0; i<upfiles.length; i++) {
		if(!upfiles[i].getOriginalFilename().equals("")) {		
			
		String bfSysName = saveFile(upfiles[i],session);
		bfSysNames[i] = "resources/uploadFiles/"+bfSysName;
		
		}		
		
	}
		System.out.println(Arrays.toString(bfSysNames));

		return null;
	}
	
	//삭제하기
	@RequestMapping("delete.bo")
	public ModelAndView deleteBoard(ModelAndView mv, 
									int bno, 
									String filePath, 
									HttpSession session) {
		
		int result = boardService.deleteBoard(bno);
		
		if(result>0) { //게시글 삭제 성공
			//첨부파일이 있었을 경우 - 파일 삭제 (new File(실제경로).delete()) 
			if(!filePath.equals("")) {
				String realPath = session.getServletContext().getRealPath(filePath);
				new File(realPath).delete();
			}
			session.setAttribute("alertMsg", "게시글 삭제 성공");
			mv.setViewName("redirect:list.bo");
		}else {//게시글 삭제 실패 
			mv.addObject("errorMsg", "게시글 삭제 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("updateForm.bo")
	public String updateForm(int bno,Model model) {
		
		Board b = boardService.selectBoard(bno);
		
		model.addAttribute("b", b);
		
		return "board/boardUpdateForm";
	}
	
	//수정하기
	@RequestMapping("update.bo")
	public ModelAndView updateBoard(ModelAndView mv,
									MultipartFile upfile,
									Board b,
									HttpSession session) {
		
		if(!upfile.getOriginalFilename().equals("")) { //새로운 첨부파일
			if(!b.getBfOriginName().equals("")) { //기존에 첨부파일이 있는 경우
				new File(session.getServletContext().getRealPath(b.getBfSysName())).delete();
			}
			
			String bfSysName = saveFile(upfile,session);
			
			b.setBfOriginName(upfile.getOriginalFilename());
			b.setBfSysName("resources/uploadFiles/"+bfSysName);
		}
		
		int result = boardService.updateBoard(b);
		
		if(result>0) {
			session.setAttribute("alertMsg", "게시글 수정 성공");
			mv.setViewName("redirect:detail.bo?bno="+b.getBoardNo());
		}else {
			mv.addObject("errorMsg","게시글 수정 실패").setViewName("common/errorPage");
		}
		
		return mv;
		
	}
	
	//좋아요
	@RequestMapping("like.bo")
	public String boardLikeInsert(int boardNo, HttpServletRequest request) {
		
		BoardLike bl = new BoardLike();
		int loginNo = 0;
		if(request.getSession().getAttribute("loginUser") !=null) {
			loginNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
		}
		
		bl.setBoardNo(boardNo);
		bl.setUserNo(loginNo);
		
		int result = boardService.boardLikeInsert(bl);
		
		if(result>0) {
			System.out.println("추천 성공");
		}else {
			System.out.println("추천 실패");
		}
		
		return "redirect:detail.bo?bno="+boardNo;
	}
	
	//좋아요 취소
	@RequestMapping("likeDelete.bo")
	public String boardLikeDelete(int boardNo, HttpServletRequest request) {
		
		BoardLike bl = new BoardLike();
		int loginNo = 0;
		if(request.getSession().getAttribute("loginUser") !=null) {
			loginNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
		}
		
		bl.setBoardNo(boardNo);
		bl.setUserNo(loginNo);
		
		int result = boardService.boardLikeDelete(bl);
		
		if(result>0) {
			System.out.println("추천 취소");
		}else {
			System.out.println("실패");
		}
		
		return "redirect:detail.bo?bno="+boardNo;
	}
	
	//댓글 조회
	@RequestMapping(value="rlist.bo", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String replyList(int bno) {
		
		ArrayList<BoardReply> list = boardService.replyList(bno);
		
		return new Gson().toJson(list);
		
	}
	
	//댓글 작성
	@RequestMapping(value="rWrite.bo", produces="html/text; charset=UTF-8")
	@ResponseBody
	public String insertReply(BoardReply br, HttpServletRequest request) {
		
		int loginNo = 0;
		if(request.getSession().getAttribute("loginUser") !=null) {
			loginNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
		}
		
		br.setUserNo(loginNo);
		
		int result = boardService.insertReply(br);
		
		String ans = "";
		
		if(result>0) {
			ans="Y";
		}else {
			ans="N";
		}
		return ans;
	}
	
	//댓글 삭제
	@RequestMapping("rDelete.bo")
	public ModelAndView deleteReply(ModelAndView mv,
									int rNo,
									int boardNo,
									String filePath,
									HttpSession session) {
		
		int result = boardService.deleteReply(rNo);
		
		System.out.println(rNo);
		if(result>0) {
			session.setAttribute("alertMsg", "댓글 삭제 성공");
			mv.setViewName("redirect:detail.bo?bno="+boardNo);
		}else {
			mv.addObject("errorMsg", "댓글 삭제 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	
	
}
	
	
	
	
	
	
	

