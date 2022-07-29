package com.kh.moong.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.moong.member.captcha.CaptchaUtil;
import com.kh.moong.member.model.service.MemberServiceLee;
import com.kh.moong.member.model.vo.IdCard;
import com.kh.moong.member.model.vo.IdPicture;
import com.kh.moong.member.model.vo.Member;
import com.kh.moong.member.model.vo.ReportCard;
import com.kh.moong.member.model.vo.Student;
import com.kh.moong.member.model.vo.Teacher;

@Controller

public class MemberContollerLee {

	@Autowired 
	private MemberServiceLee memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	//마이페이지 메인 이동
	@RequestMapping("myPageMain.me")
	public String myPageMain(Member m,HttpSession session, Model model) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		java.sql.Date birth = ((Member)session.getAttribute("loginUser")).getBirth();
		int age = getAge(birth);
		model.addAttribute("age",age);

		if(loginUser.getApproval().equals("N") && (loginUser.getStudent().equals("Y") || loginUser.getTeacher().equals("Y"))) {
			
			session.setAttribute("alertMsg", "회원가입 승인 대기 중입니다.");

			return "member/myPageMain";
		}
		if(loginUser.getApproval().equals("D")) {
			
			session.setAttribute("alertMsg", "회원가입 거절되었습니다. 정보를 다시 입력해주세요.");
			
			return "member/myPageMain";
		}
		
		

		return "member/myPageMain";
	}
	
	//학생 등록 페이지
	@RequestMapping("stuEnrollForm.me")
	public String stuEnrollForm(HttpSession session, Model model) {

		java.sql.Date birth = ((Member)session.getAttribute("loginUser")).getBirth();
		int age = getAge(birth);
		model.addAttribute("age",age);
		
		return "member/stuEnrollForm";
	}
	
	//선생님 등록 페이지
	@RequestMapping("teaEnrollForm.me")
	public String teaEnrollForm(HttpSession session, Model model) {

		java.sql.Date birth = ((Member)session.getAttribute("loginUser")).getBirth();
		int age = getAge(birth);
		model.addAttribute("age",age);
		
		return "member/teaEnrollForm";
	}
	
	//선생님 등록 하기
	@RequestMapping("teaEnroll.me")
	public String teaEnroll(@RequestParam MultipartFile idPicture, @RequestParam MultipartFile idCard, int userNo
								, IdPicture idP, IdCard ic
								, Teacher tea
								, HttpSession session, Model model) {

		//파일명 변환
		String changeName1 = saveFile(idPicture,session);
		String changeName2 = saveFile(idCard,session);
		
		//각 사진에 원본명 담아주기
		idP.setIpOriginName(idPicture.getOriginalFilename());
		ic.setIcOriginName(idCard.getOriginalFilename());
		idP.setUserNo(userNo);
		ic.setUserNo(userNo);
		
		tea.setUserNo(userNo);
		
		//경로 + 변환한 파일명 sysName에 담아주기
		idP.setIpSysName("resources/iPUploadFiles/"+changeName1);
		ic.setIcSysName("resources/iPUploadFiles/"+changeName2);
		
		
		//idPicture db 처리
		int result1 = memberService.insertIdP(idP);

		if(result1>0) {
//			//재학증명서 db처리
			int result2 = memberService.insertIc(ic);

			if(result2>0) {
				//선생님으로 등록하기
				int result3 = memberService.teaEnroll(tea);
					if(result3>0) {
						//member테이블의 teacher컬럼 수정
						int result4 = memberService.memberTeacher(userNo);

						//로그아웃 시켜서 세션 비워주기
						session.setAttribute("alertMsg", "회원정보가 변경되었습니다. 재로그인해주세요");

						session.removeAttribute("loginUser");
						
						return "redirect:/";
					}
			}
		}
		
		return "redirect:/";
	}
	
	//학생 등록 하기
	@RequestMapping("stuEnroll.me")
	public String stuEnroll(@RequestParam MultipartFile idPicture, @RequestParam MultipartFile reportCard, int userNo
							, IdPicture idP, ReportCard rc
							, Student stu
							, HttpSession session, Model model) {

		
		
		//파일명 변환
		String changeName1 = saveFile(idPicture,session);
		String changeName2 = saveFile(reportCard,session);
		
		//각 사진에 원본명 담아주기
		idP.setIpOriginName(idPicture.getOriginalFilename());
		rc.setRcOriginName(reportCard.getOriginalFilename());
		idP.setUserNo(userNo);
		rc.setUserNo(userNo);
		
		stu.setUserNo(userNo);
		
		//경로 + 변환한 파일명 sysName에 담아주기
		idP.setIpSysName("resources/iPUploadFiles/"+changeName1);
		rc.setRcSysName("resources/iPUploadFiles/"+changeName2);
		
		
		//idPicture db 처리
		int result1 = memberService.insertIdP(idP);

		if(result1>0) {
//			//성적표 db처리
			int result2 = memberService.insertRc(rc);

			if(result2>0) {
				int result3 = memberService.stuEnroll(stu);
					if(result3>0) {
						//member테이블의 student 수정
						int result4 = memberService.memberStudent(userNo);

						//로그아웃 시켜서 세션 비워주기
						session.setAttribute("alertMsg", "회원정보가 변경되었습니다. 재로그인해주세요");

						session.removeAttribute("loginUser");
						
						return "redirect:/";
					}
			}
		}
		
		
		return "redirect:/";
	}
	
	//선생님 마이페이지
	@RequestMapping("teaMyPage.me")
	public String teaMyPage(HttpSession session, Model model) {
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		java.sql.Date birth = ((Member)session.getAttribute("loginUser")).getBirth();
		//선생님 정보
		Teacher tea = memberService.teaMyPage(userNo);
		
		int age = getAge(birth);
		
		//증명사진
		IdPicture ip = memberService.selectIp(userNo);

		//재학증명서
		IdCard ic = memberService.selectIc(userNo);
		
		model.addAttribute("teacher",tea);
		model.addAttribute("idPicture",ip);
		model.addAttribute("idCard",ic);
		model.addAttribute("age",age);
		
		return "member/teaMyPage";
		
		
	}
	
	//선생님 마이페이지 수정
	//수정 페이지로 이동
	@RequestMapping("teaUpdate.me")
	public String teaUpdate(HttpSession session, Model model) {
	
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();

		java.sql.Date birth = ((Member)session.getAttribute("loginUser")).getBirth();
		int age = getAge(birth);
		model.addAttribute("age",age);
		
		Teacher tea = memberService.teaMyPage(userNo);
		IdPicture ip = memberService.selectIp(userNo);
		IdCard ic = memberService.selectIc(userNo);
		
		model.addAttribute("teacher",tea);
		model.addAttribute("idPicture",ip);
		model.addAttribute("idCard",ic);

		return "member/teaMyPageUpdate";
		
	}
	
	//선생님 마이페이지 수정하기
	@RequestMapping("teaUpdateForm.me")
	public String teaUpdateForm(Member m, Teacher tea,
								@RequestParam MultipartFile idPicture, @RequestParam MultipartFile idCard,
								IdPicture idP, IdCard ic,
								HttpSession session, Model model) {
	
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();

		//email 수정
		int result = memberService.stuUpdateForm(m);
		
		//teacher정보 수정 - 자기소개, 출신학교
		int result5 = memberService.teaUpdate(tea);
		
		if(result*result5>0) {
		
		//증명사진 수정
		 if(!idPicture.getOriginalFilename().equals("")) {
			 
			 //기존 증명사진 삭제
			 int result1 = memberService.deleteIp(userNo);
			 
			 //새 증명사진 넣기
			 String changeName1 = saveFile(idPicture,session);

			 idP.setIpOriginName(idPicture.getOriginalFilename());
			 idP.setIpSysName("resources/iPUploadFiles/"+changeName1);
			
			 int result2 = memberService.insertIdP(idP);
			 
			 if(result1*result2>0) {
				 //성공
				 if(!idCard.getOriginalFilename().equals("")) { 
					 //재학증명서가 수정된 경우
					 
					 //기존 재학증명서 삭제 
					 int result3 = memberService.deleteIc(userNo);
					 
					 //새 재학증명서 넣기
					String changeName2 = saveFile(idCard,session);
					 
					 ic.setIcOriginName(idCard.getOriginalFilename());
					 ic.setIcSysName("resources/iPUploadFiles/"+changeName2);
					 
					int result4 = memberService.insertIc(ic);
					
					if(result3*result4>0) {
						//성공 시 
						Member loginUser = memberService.loginMember(m);
						
						session.setAttribute("loginUser", loginUser);
						session.setAttribute("alertMsg", "회원정보가 수정되었습니다.");
						
						Teacher teacher = memberService.teaMyPage(userNo);
						model.addAttribute("teacher",teacher);
	
						return "redirect:/teaMyPage.me";
					}else {
						model.addAttribute("alertMsg","수정 실패1");
						
						return "redirect:/";
					}
					
				 }else {
					 //재학증명서 수정 X
					 	Member loginUser = memberService.loginMember(m);
						
						session.setAttribute("loginUser", loginUser);
						session.setAttribute("alertMsg", "회원정보가 수정되었습니다.");
						
						Teacher teacher = memberService.teaMyPage(userNo);
						model.addAttribute("teacher",teacher);
	
						return "redirect:/teaMyPage.me";
					 
				 }
				 
				 
			 }else {
				 //실패 
				 model.addAttribute("alertMsg","수정 실패2");
				 
			 }
			 
			 
		 }else { //증명사진 수정 X 인경우
			 if(!idCard.getOriginalFilename().equals("")) { 
				 //재학증명서가 수정된 경우
				 
				 //기존 재학증명서 삭제 
				 int result3 = memberService.deleteIc(userNo);
				 
				 //새 재학증명서 넣기
				String changeName2 = saveFile(idCard,session);
				 
				 ic.setIcOriginName(idCard.getOriginalFilename());
				 ic.setIcSysName("resources/iPUploadFiles/"+changeName2);
				 
				int result4 = memberService.insertIc(ic);

				 if(result3*result4>0) {
					 //성공
					 Member loginUser = memberService.loginMember(m);
						
						session.setAttribute("loginUser", loginUser);
						session.setAttribute("alertMsg", "회원정보가 수정되었습니다.");
						
						Teacher teacher = memberService.teaMyPage(userNo);
						model.addAttribute("teacher",teacher);
	
						return "redirect:/teaMyPage.me";
				 }else {
					 model.addAttribute("alertMsg","수정 실패3");
				 }
				
				
			 }else {
				 //재학증명서 수정 X
				 //증명사진, 재학증명서 둘다 수정 X
				 
				 return "redirect:/teaMyPage.me";
			 }
			 
		 }

	
		}
		return "redirect:/";
	}
		

	
	//학생 마이페이지
	@RequestMapping("stuMyPage.me")
	public String stuMyPage(HttpSession session, Model model
							) {

		//학생 마이페이지에 띄워줄 정보 가져오기
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		java.sql.Date birth = ((Member)session.getAttribute("loginUser")).getBirth();
		int age = getAge(birth);
		model.addAttribute("age",age);
		
		Student stu = memberService.stuMyPage(userNo);
		
		//증명사진 가져오기
		//idPocture테이블의 변경된 이름 값 가져올것
		IdPicture ip = memberService.selectIp(userNo);
		
		model.addAttribute("idPicture",ip);
		model.addAttribute("student",stu);
		
		return "member/stuMyPage";
	}
	
	//학생 마이패이지 수정
	//수정 페이지로 이동
	@RequestMapping("stuUpdate.me")
	public String stuUpdate(HttpSession session, Model model) {
		
		//정보 가지고 이동한다
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();

		java.sql.Date birth = ((Member)session.getAttribute("loginUser")).getBirth();
		int age = getAge(birth);
		model.addAttribute("age",age);
		
		Student stu = memberService.stuMyPage(userNo);
		IdPicture ip = memberService.selectIp(userNo);
		
		model.addAttribute("student",stu);
		model.addAttribute("idPicture",ip);

		return "member/stuMyPageUpdate";
	}
	
	//학생 마이페이지 수정하기
	@RequestMapping("stuUpdateForm.me")
	public String stuUpdateForm(Member m, @RequestParam MultipartFile idPicture,
								IdPicture idP,
								HttpSession session, Model model) {

		//증명사진과 이메일 수정 가능
		//이메일 수정 - 학생 개인 정보 수정
		int result = memberService.stuUpdateForm(m);

		if(result>0) {
			//수정된 정보 다시 가져와서 세션에 담아준다

			int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();

			//증명사진 업데이트
			if(!idPicture.getOriginalFilename().equals("")) {
				//기존 증명사진 삭제
				int result2 = memberService.deleteIp(userNo);

				//새 증명사진 넣기
				String changeName1 = saveFile(idPicture,session);

				idP.setIpOriginName(idPicture.getOriginalFilename());
				idP.setIpSysName("resources/iPUploadFiles/"+changeName1);

				int result3 = memberService.insertIdP(idP);

				if(result2*result3 > 0) {
					
					Member loginUser = memberService.loginMember(m);
					
					session.setAttribute("loginUser", loginUser);
					session.setAttribute("alertMsg", "회원정보가 수정되었습니다.");
					
					Student stu = memberService.stuMyPage(userNo);
					model.addAttribute("student",stu);

					
					return "member/stuMyPage";
				}
				
			}else {
				Member loginUser = memberService.loginMember(m);

				IdPicture ip = memberService.selectIp(userNo);
				
				session.setAttribute("loginUser", loginUser);
				session.setAttribute("alertMsg", "회원정보가 수정되었습니다.");
				
				
				Student stu = memberService.stuMyPage(userNo);

				model.addAttribute("student",stu);
				model.addAttribute("idPicture",ip);
				
				return "member/stuMyPage";
			}
		
		}
			return "redirect:/";
		
		
	}
	
	//선생님 탈퇴하기
	@RequestMapping("teaDelete.me")
	public String teaDelete(HttpSession session, Model model) {

		//세션에 담긴 로그인 정보 가져오기
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		int result = memberService.teaDelete(userNo);
		
		if(result>0) {
			
			session.setAttribute("alertMsg", "탈퇴되었습니다.");

			session.removeAttribute("loginUser");
		}
		
		
		return "redirect:/";
	}
	
	//학생 탈퇴하기
	@RequestMapping("stuDelete.me")
	public String stuDelete(HttpSession session, Model model) {
		
		//세션에 담긴 로그인 정보 가져오기
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		int result = memberService.stuDelete(userNo);
		
		if(result>0) {
			
			session.setAttribute("alertMsg", "탈퇴되었습니다.");

			session.removeAttribute("loginUser");
		}
		
		return "redirect:/";
	}
	
	
	//성적 수정
	//학생 성적 수정 페이지 이동
	@RequestMapping("stuGrade.me")
	public String stuGradeUPdateForm(HttpSession session, Model model) {
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();

		//기존 성적 가져요기
		Student stu = memberService.stuMyPage(userNo);
		
		//성적표 사진 이름 가져오기
		ReportCard rc = memberService.selectRc(userNo);
		
		model.addAttribute("student",stu);
		model.addAttribute("reportCard",rc);

		return "member/stuGradeUpdate";
	}
	
	//학생 성적 수정
	@RequestMapping("stuGradeUpdateForm.me")
	public String stuGradeUPdate(HttpSession session, Model model) {
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();

		//기존 성적 가져요기
		Student stu = memberService.stuMyPage(userNo);
		
		
		model.addAttribute("student",stu);
		
		
		return "member/stuGradeUpdateForm";
	}
	
	//학생 성적 수정하기
	@RequestMapping("stuGradeUpdate.me")
	public String stuGradeUpdate(HttpSession session, Model model,
								@RequestParam MultipartFile reportCard, Student stu,
								ReportCard rc
									) {
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();

		//성적 수정 하기
		int result = memberService.stuGradeUpdate(stu);
		
		//member의 modifyDate, approval 수정하기
		int result4 = memberService.updateMember(userNo);
		
		if(result>0) {
			model.addAttribute("student",stu);
		}
		//성적표 등록
		//기존의 성적표 삭제
		if(!reportCard.getOriginalFilename().equals("")) {
			//기존 증명사진 삭제
			int result2 = memberService.deleteRc(userNo);

			//새 증명사진 넣기
			String changeName = saveFile(reportCard,session);

			rc.setRcOriginName(reportCard.getOriginalFilename());
			rc.setRcSysName("resources/iPUploadFiles/"+changeName);
			rc.setUserNo(userNo);
			
			int result3 = memberService.insertRc(rc);
			
			if(result2*result3>0) {
				//수정된 성적표 가져오기
				ReportCard reportCard2 = memberService.selectRc(userNo);
				
				model.addAttribute("reportCard",reportCard2);
		
				session.setAttribute("alertMsg", "회원 정보가 변경되어 로그아웃 됩니다.");
				
				return "redirect:/";
			}
		
		}
		return "member/stuGradeUpdate";
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
	
	
	//비밀번호 변경
	@RequestMapping("pwUpdateForm.me")
	public String pwUpdateForm() {
		
		return "member/pwUpdateForm";
	}
	
	//비밀번호 변경 처리
	@RequestMapping("pwUpdate.me")
	public String pwUpdate(Member m, String updatePwd, String ckUpdatePwd,
							String answer,
							HttpSession session, HttpServletRequest request,
							Model model
							) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		m.setUserNo(userNo);

		//캡차 이미지의 숫자
		String getAnswer = (String) request.getSession().getAttribute("captcha");

		//입력한 비번
		String ckPwd = m.getUserPwd();
		
		//변경 비밀번호 암호화
		String encPwd = bcryptPasswordEncoder.encode(ckPwd);
		

		//session의 비번 가져와서 비교
		String userPwd = ((Member)session.getAttribute("loginUser")).getUserPwd();
		
		if(getAnswer.equals(answer)) {
			
			if(bcryptPasswordEncoder.matches(ckPwd,userPwd)) {
				//비밀번호 update
				m.setUserPwd(encPwd);
				int result = memberService.updatePwd(m);
				
				if(result>0) {
					
					session.setAttribute("alertMsg", "비밀번호가 변경되었습니다. 다시 로그인 해주세요.");
					session.removeAttribute("loginUser");
					return "redirect:/";
				}
			}else {
				session.setAttribute("alertMsg", "현재 비밀번호가 일치하지 않습니다.");
				return "member/pwUpdateForm";
			}
			
			
		}else {
			session.setAttribute("alertMsg", "잘못된 자동입력 방지문자입니다. 다시 입력해 주세요.");
			return "member/pwUpdateForm";
		}
		
		
		return "redirect:/";
		
	
	}
	
	
	//비밀번호 변경 캡차
	@RequestMapping(value = "captchaImg.do")
    public void cpatchaImg(HttpServletRequest request, HttpServletResponse response) throws Exception{
        new CaptchaUtil().captchaImg(request, response);
    }
    @RequestMapping(value = "captchaAudio.do")
    public void cpatchaAudio(HttpServletRequest request, HttpServletResponse response) throws Exception{
        new CaptchaUtil().captchaAudio(request, response);
    }

	
	
	//파일 명 처리 메소드
	public String saveFile(MultipartFile file,HttpSession session) {

		String originName = file.getOriginalFilename(); // dog.jpg 
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	
		int ranNum = (int)(Math.random() * 90000 + 10000); //5자리 랜덤값
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		String savePath = session.getServletContext().getRealPath("/resources/iPUploadFiles/");
		
		try {
			file.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
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
