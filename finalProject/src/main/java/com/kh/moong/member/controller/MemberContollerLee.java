package com.kh.moong.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.moong.member.model.service.MemberServiceLee;
import com.kh.moong.member.model.vo.Student;
import com.kh.moong.member.model.vo.Teacher;

@Controller
public class MemberContollerLee {

	@Autowired 
	private MemberServiceLee memberService;
	
	//마이페이지 메인으로 이동
	@RequestMapping("myPageMain.me")
	public String myPageMain() {

		return "member/myPageMain";
	}
	
	//학생 등록 페이지
		@RequestMapping("stuEnrollForm.me")
		public String stuEnrollForm() {

			return "member/stuEnrollForm";
		}
		
		//선생님 등록 페이지
		@RequestMapping("teaEnrollForm.me")
		public String teaEnrollForm() {

			return "member/teaEnrollForm";
		}
		
		//선생님 등록 하기
		@RequestMapping("teaEnroll.me")
		public String teaEnroll(Teacher tea, HttpSession session, Model model) {

			int result = memberService.teaEnroll(tea);
			
			if(result>0) {//성공
				
				session.setAttribute("alertMsg","선생님으로 등록되었습니다.");
				
				return "redirect:myPageMain.me";
			}else {//실패
				model.addAttribute("errorMsg","선생님 등록 실패");
				
				//에러페이지 보여주기
			}
			
			return "redirect:myPageMain.me";
		}
		
		//학생 등록 하기
		@RequestMapping("stuEnroll.me")
		public String stuEnroll(Student stu, HttpSession session, Model model) {

			int result = memberService.stuEnroll(stu);
			
			if(result>0) {//성공
				
				session.setAttribute("alertMsg", "학생으로 등록되었습니다.");
				
				return "redirect:myPageMain.me";
			}else {//실패
				model.addAttribute("errorMsg","학생 등록 실패");
				
				//에러 페이지 보여주기
			}
			
			return "redirect:myPageMain.me";
		}
		
		//학생 마이페이지
		@RequestMapping("stuMyPage.me")
		public String stuMyPage() {

			return "member/stuMyPage";
		}
		
		
		//선생님 마이페이지
		@RequestMapping("teaMyPage.me")
		public String teaMyPage() {

			return "member/teaMyPage";
		}
		
		//과외목록
		@RequestMapping("lessonList.me")
		public String lessonList() {

			return "member/lessonList";
		}
		
		
		
		
		//작성 게시글
		//작성 게시글 목록
		@RequestMapping("myBoardListView.me")
		public String myBoardListView() {

			return "member/myBoardListView";
		}
		
		//작성 게시글 상세보기
		
		
		//좋아요 게시글
		//좋아요 게시글 목록
		@RequestMapping("likeBoardListView.me")
		public String likeBoardListView() {

			return "member/likeBoardListView";
		}
		
		//좋아요 게시글 상세보기
		
		
		
		//학생 성적 수정
		@RequestMapping("stuGradeUpdate.me")
		public String stuGradeUpdate() {

			return "member/stuGradeUpdate";
		}
		
	
	
}
