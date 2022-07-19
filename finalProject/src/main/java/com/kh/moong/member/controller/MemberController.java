package com.kh.moong.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.moong.member.model.service.MailSendService;
import com.kh.moong.member.model.service.MemberService;
import com.kh.moong.member.model.vo.Member;

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
//		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
//		m.setUserPwd(encPwd);
		
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
//		System.out.println(m);
		Member loginUser = memberService.loginMember(m);
//		System.out.println(loginUser);
		if(loginUser == null) {
			model.addAttribute("errorMsg", "로그인에 실패하였습니다.");
			return "common/errorPage";
		}else {
			session.setAttribute("loginUser", loginUser);
			return "redirect:/";
		}
		
	}
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		
		session.removeAttribute("loginUser");
		
		return "redirect:/";
	}
	
	
	// 아이디 중복 체크
//	@RequestMapping("idCheck.me")
//	@ResponseBody
//	public String idCheck(String checkId) {
//		
//		int count = memberService.idCheck(checkId);
//			
//		return (count > 0) ? "NOPE" : "YEAH";
//	}
	
	// 아이디 | 비밀번호 찾기 포워딩
	@RequestMapping("findIdPw.me")
	public String findIdPw() {
		return "member/memberIdPwFind";
	}
	
	// 아이디 찾기
//	@RequestMapping(value="findId.me", method=RequestMethod.POST)
//	@ResponseBody
//	public String findId(Member m, Model model) {
//		Member id = memberService.selectFindId(m);
//		
//		return id;
//	}
	
	// 이메일 인증
//	@RequestMapping("mailCheck")
//	@ResponseBody
//	public String mailCheck(String email) {
//		System.out.println("인증 이메일: "+email);
//		
//		return mailService.joinEmail(email);
//	}
}