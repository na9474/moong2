package com.kh.moong.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.moong.member.model.service.MemberServiceLee;
import com.kh.moong.member.model.vo.IdPicture;
import com.kh.moong.member.model.vo.Student;
import com.kh.moong.member.model.vo.Teacher;

@Controller
public class MemberContollerLee {

	@Autowired 
	private MemberServiceLee memberService;
	
	//마이페이지 메인 이동
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
			
			//에러페이지 
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
			
			//에러페이지
		}
		
		return "redirect:myPageMain.me";
	}
	
	//학생 마이페이지
	@RequestMapping("stuMyPage.me")
	public String stuMyPage() {

		return "member/stuMyPage";
	}
	
	//학생 마이패이지 수정
	@RequestMapping("stuUpdate.me")
	public String stuUpdate() {
		
//		int result = memberService.stuUpdate()
		
		return "member/stuUpdate";
	}
	
	//선생님 탈퇴하기
	@RequestMapping("teaDelete.me")
	public String teaDelete() {

		//세션에 담긴 로그인 정보 가져오기
//		String userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		int userNo = 1;
		
		int result = memberService.teaDelete(userNo);
		
		return "redirect:/";
	}
	
	//학생 탈퇴하기
	@RequestMapping("stuDelete.me")
	public String stuDelete() {
		
		//세션에 담긴 로그인 정보 가져오기
//		String userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		int userNo = 1;
		
		int result = memberService.stuDelete(userNo);
		
		
		return "redirect:/";
	}
	
	
	//성적 수정
	//학생 성적 수정 페이지 이동
	@RequestMapping("stuGradeUpdateForm.me")
	public String stuGradeUPdateForm() {
		
		return "member/stuGradeUpdateForm";
	}
	
	//학생 성적 수정
	@RequestMapping("stuGradeUpdate.me")
	public String stuGradeUPdate(Student stu,Model model) {
		
		int result = memberService.stuGradeUpdate(stu);
		
		return "member/stuGradeUpdateForm";
	}
	
	
	//선생님 마이페이지
	@RequestMapping("teaMyPage.me")
	public String teaMyPage() {

		return "member/teaMyPage";
	}

	//선생님 마이페이지 수정
	@RequestMapping("teaUpdate.me")
	public String teaUpdate() {

		return "member/teaUpdate";
	}
	
	
	//과외 목록
	@RequestMapping("lessonList.me")
	public String lessonList() {

		return "member/lessonList";
	}
	
	//마이페이지 공통 수정페이지 이동
	@RequestMapping("myPageUpdateForm.me")
	public String myPageUpdateForm() {

		return "member/myPageUpdateForm";
	}
	
	//마이페이지 공통 수정하기
	@RequestMapping("myPageUpdate.me")
	public String myPageUpdate(Student stu, IdPicture ip, MultipartFile idPicture, HttpSession session, Model model) {

		//학생인 경우 
		//증명사진 있는경우 
		if(!idPicture.getOriginalFilename().equals("")) { //증명사진 파일 없는 경우
			
			String changeName = saveFile(idPicture,session);
			
			ip.setIpOriginName(idPicture.getOriginalFilename());
			ip.setIpSysName("resources/iPUploadFiles"+changeName);
			ip.setUserNo(stu.getUserNo());
			
		}
			//개인정보 수정
			int result = memberService.myPageUpdate(stu);
			
			if(result>0) {
				session.setAttribute("alertMsg", "회원 정보 수정 성공");
				return "redirect:myPageMain.me";
			}else {
				System.out.println("수정 실패");
				return "member/myPageUpdate";
			}
		
		
		
	}
	
	//파일 명 처리 메소드
	public String saveFile(MultipartFile idPicture,HttpSession session) {

		String originName = idPicture.getOriginalFilename(); // dog.jpg 
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	
		int ranNum = (int)(Math.random() * 90000 + 10000); //5자리 랜덤값
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		String savePath = session.getServletContext().getRealPath("/resources/iPUploadFiles/");
		
		try {
			idPicture.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
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
	
	
	

		
	
	
}
