package com.kh.moong.admin.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.moong.admin.model.service.AdminService;
import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.common.template.Pagination;
import com.kh.moong.member.model.service.MemberServiceLee;
import com.kh.moong.member.model.vo.IdCard;
import com.kh.moong.member.model.vo.IdPicture;
import com.kh.moong.member.model.vo.Member;
import com.kh.moong.member.model.vo.ReportCard;
import com.kh.moong.member.model.vo.Student;
import com.kh.moong.member.model.vo.Teacher;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@Autowired 
	private MemberServiceLee memberService;
	
	
	//회원 목록
	@RequestMapping("memberList.ad")
	public String memberList(
			@RequestParam(value="cpage",defaultValue="1") int currentPage,
			Model model,HttpSession session
			
							) {
		
		//전체 회원 수 
		//admin 한명 제외
		int listCount = adminService.selectMemberListCount()-1;
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		
		//회원 목록 가져오기
		ArrayList<Member> list = adminService.memberList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "admin/memberList";
		
		
	}
	
	//회원 상세보기
	//학생
	@RequestMapping("aStu.ad")
	public String aStuDetail(Model model,
			@RequestParam(value="uNo", defaultValue="0") int userNo
			
			) {
		
		//member정보
		//student정보
		//증명사진 정보
		//성적표 정보
		
		Member m = memberService.selectMember(userNo);

		Student stu = memberService.stuMyPage(userNo);
		
		IdPicture ip = memberService.selectIp(userNo);
		
		ReportCard rc = memberService.selectRc(userNo);

		int age = getAge(m.getBirth());
		 
		
		model.addAttribute("m",m);
		model.addAttribute("stu", stu);
		model.addAttribute("ip", ip);
		model.addAttribute("rc", rc);
		model.addAttribute("age", age);
		
		
		return "admin/memberDetailView";
	}
	
	//선생님
	@RequestMapping("aTea.ad")
	public String aTeaDetail(Model model,
			@RequestParam(value="uNo", defaultValue="0") int userNo
			
			) {
		
		Member m = memberService.selectMember(userNo);

		Teacher tea = memberService.teaMyPage(userNo);
		
		IdPicture ip = memberService.selectIp(userNo);
		
		IdCard ic = memberService.selectIc(userNo);

		int age = getAge(m.getBirth());
		 
		model.addAttribute("m",m);
		model.addAttribute("tea", tea);
		model.addAttribute("ip", ip);
		model.addAttribute("ic",ic);
		model.addAttribute("age", age);
		
		
		return "admin/memberDetailView";
	}
	
	
	
	//가입 승인
	@RequestMapping("joinApproval.ad")
	public String joinApproval(
			@RequestParam(value="uNo",defaultValue="0") int userNo,
			Model model,HttpSession session
			) {
		
		int result = adminService.joinApproval(userNo);
		
		if(result>0) {
			//가입 승인 성공
			session.setAttribute("alertMsg", "회원가입 승인");
			
			return "redirect:/memberList.ad";
			
		}else {
			session.setAttribute("alertMsg", "승인 실패");
			
			return "redirect:/memberList.ad";
		}
	}
	
	//가입 거절
	@RequestMapping("joinRefusal.ad")
	public String joinRefusal(
			@RequestParam(value="uNo",defaultValue="0") int userNo,
			Model model,HttpSession session
			) {
		
		int result = adminService.joinRefusal(userNo);

		//userNo 의 Member정보 가져오고 ->  학생정보 / 선생님 정보 가져온다
		Member m = memberService.selectMember(userNo);
		
		if(m.getStudent().equals("Y")) {
			//학생이라면 userNo의 학생 정보 , 증명사진, 성적표 삭제
			int result2 = adminService.deletStu(userNo);
			
			//증명사진 정보 가져와서 저장된 파일도 삭제해주기
			//증명사진 파일 삭제
			IdPicture ip = memberService.selectIp(userNo);

			new File(session.getServletContext().getRealPath(ip.getIpSysName())).delete();
			
			int result3 = adminService.deleteIp(userNo);
			
			//성적표 파일 삭제
			ReportCard rc = memberService.selectRc(userNo);
			
			new File(session.getServletContext().getRealPath(rc.getRcSysName())).delete();
			
			int result4 = adminService.deleteRc(userNo);
			
			if(result2*result3*result4>0) {
				session.setAttribute("alertMsg", "기존 학생 정보 삭제");
				
			}
		
		}else {
			//선생님 이라면 userNo의 선생님 정보, 증명사진, 재학증명서 삭제
			int result5 = adminService.deleteTea(userNo);
			
			//증명사진 정보 가져와서 저장된 파일도 삭제해주기
			//증명사진 파일 삭제
			IdPicture ip = memberService.selectIp(userNo);
			
			new File(session.getServletContext().getRealPath(ip.getIpSysName())).delete();

			int result6 = adminService.deleteIp(userNo);

			//재학증명서 파일 삭제
			IdCard ic = memberService.selectIc(userNo);
			
			new File(session.getServletContext().getRealPath(ic.getIcSysName())).delete();
			
			int result7 = adminService.deleteIc(userNo);
			
			if(result5*result5*result7>0) {
				session.setAttribute("alertMsg", "기존 선생님 정보 삭제");

			}
		
		}
		
		
		if(result>0) {
			session.setAttribute("alertMsg", "회원가입 거절 되었습니다. ");
		
			return "redirect:/memberList.ad";
		}else {
			session.setAttribute("alertMsg", "거절 실패");
			
			return "redirect:/memberList.ad";
		}
		
		
	}
	
	
	
	
	
	
	
	
	
	
	//나이 게산 메소드
	public int getAge(java.sql.Date birth) {
		
		//현재 년도 구하기
		Calendar now = Calendar.getInstance(); //년월일시분초
		Integer currentYear = now.get(Calendar.YEAR);
		
		//태어난년도를 위한 세팅
		SimpleDateFormat format = new SimpleDateFormat("yyyy");
		String stringBirthYear = format.format(birth); //년도만받기
		
		//태어난 년도
		Integer birthYear = Integer.parseInt(stringBirthYear);
		
		 // 현재 년도 - 태어난 년도 => 나이 (만나이X)		 
		return (currentYear - birthYear +1);
	}
	
	
}
