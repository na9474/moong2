package com.kh.moong.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.moong.member.model.service.MailSendService;
import com.kh.moong.member.model.service.MemberService;
import com.kh.moong.member.model.vo.Member;
import com.kh.moong.member.model.vo.Student;
import com.kh.moong.member.model.vo.Teacher;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	@Autowired
	private MailSendService mailService;
	
	@RequestMapping("login.me")
	public String login() {
		return "member/login";
	}
	

	@RequestMapping("enrollForm.me")
	public String enrollForm() {
		
		return "member/memberEnrollForm";
	}
	
	@RequestMapping("insert.me")
	public String insertMember(Member m
							  ,HttpSession session
							  ,Model model) {
		// 암호화 작업
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		m.setUserPwd(encPwd);
		
		int result = memberService.insertMember(m);
		
		if(result>0) {
			session.setAttribute("alertMsg", "회원가입에 성공하였습니다.");
			return "redirect:/";
		}else {
			model.addAttribute("errorMsg", "회원가입에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	
	@RequestMapping("loginMember.me")
	public String loginMember(Member m
								,HttpSession session
								,Model model) {

		Member loginUser = memberService.loginMember(m);
		
		// 관리자가 로그인했을 때(관리자 비번 암호화안돼있음 - 1234)
		if(loginUser.getUserNo() == 1) {
			session.setAttribute("loginUser", loginUser);
			return "redirect:/";
		}
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
		
			if(loginUser.getStudent().equals("Y")) {//로그인한 회원이 학생회원이면 학생정보 보냄
				
				Student student = memberService.loginStudentInfo(loginUser.getUserNo());
				session.setAttribute("s", student);
			}
				
			if(loginUser.getTeacher().equals("Y")) {//로그인한 회원이 선생회원이면 선생정보 보냄
				Teacher teacher = memberService.loginTeacherInfo(loginUser.getUserNo());
				session.setAttribute("t", teacher);
			}
			
			session.setAttribute("loginUser", loginUser);
			return "redirect:/";
		}else {
			session.setAttribute("alertMsg","아이디 또는 비밀번호가 일치하지 않습니다. 다시 확인해 주세요.");
			return "member/login";
		}
	}
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		
		session.removeAttribute("loginUser");
		
		return "redirect:/";
	}
	
	// 이메일 인증
		@RequestMapping("mailCheck")
		@ResponseBody
		public String mailCheck(String email) {
			return mailService.joinEmail(email);
		}
	
	// 아이디 중복 체크
	@RequestMapping("idCheck.me")
	@ResponseBody
	public String idCheck(String checkId) {
		
		int count = memberService.idCheck(checkId);
			
		return (count > 0) ? "NOPE" : "YEAH";
	}
	
	// 아이디 | 비밀번호 찾기 포워딩
	@RequestMapping("findIdPw.me")
	public String findIdPw() {
		return "member/memberIdPwFind";
	}

	// 아이디 찾기
	@RequestMapping(value="findId.me", method=RequestMethod.POST)
	public String selectFindId(Member m, Model model, HttpSession session) {
		Member id = memberService.selectFindId(m);
		
		if(id != null) {
			model.addAttribute("id", id);
			return "member/memberIdList";
		} else {
			session.setAttribute("alertMsg", "이름 또는 이메일을 다시 확인해주세요.");
			return "redirect:findIdPw.me";
		}
	}
	
	// 비밀번호 찾기
	@RequestMapping(value="findPw.me", method=RequestMethod.POST)
	public String findPw(Member m, Model model, HttpSession session) {
		if(memberService.findPwdCheck(m) == 0) {
			session.setAttribute("alertMsg", "아이디 또는 이메일을 다시 확인해주세요.");
			return "redirect:findIdPw.me";
		} else {
			mailService.findPwd(m.getUserId(), m.getEmail());
			model.addAttribute("mEmail", m.getEmail());
			return "member/memberFindPw";
		}
	}
	
	// 비밀번호 찾기 포워딩
	@RequestMapping("findPwView.me")
	public String findPwView() {
		return "member/memberFindPw";
	}
	


}