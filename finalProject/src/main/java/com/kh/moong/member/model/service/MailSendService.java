package com.kh.moong.member.model.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.kh.moong.member.model.dao.MemberDao;

@Component // bean 자동 등록
public class MailSendService {
   @Autowired
   private JavaMailSenderImpl mailSender;
   @Autowired
   private MemberDao memberDao;
   @Autowired
   private SqlSessionTemplate sqlSession;
   @Autowired
   private BCryptPasswordEncoder bcryptPasswordEncoder;
   
   private int authNum; // 난수 발생
   
   public void makeRandomNumber() {
      // 난수의 범위: 111111 ~ 999999 (총 6자리 난수)
      Random r = new Random();
      int checkNum = r.nextInt(888888) + 111111;
      System.out.println("인증번호 : " + checkNum);
      authNum = checkNum;
   }
   
   //이메일 양식
   public String joinEmail(String email) {
      makeRandomNumber();
      String setFrom = "moonglesson@gmail.com";
      String toMail = email;
      String title = "[뭉과외] 회원가입 인증번호입니다.";
      String content = "안녕하세요. 뭉과외입니다.<br>아래의 인증번호를 인증번호 확인란에 입력해주세요.<br><br>"
                    + "인증번호는 <b>" + authNum + "</b>입니다.<br><br>";
      mailSend(setFrom, toMail, title, content);
      return Integer.toString(authNum);
   }
   
   // 비밀번호 찾기 이메일 양식
      public void findPwd(String userId, String email) {
         makeRandomNumber();
         String enPwd = Integer.toString(authNum); // 임시 비밀번호
         String userPwd = bcryptPasswordEncoder.encode(enPwd); // 임시 비밀번호 암호화
         memberDao.findPwd(sqlSession, userId, email, userPwd);
         
         String setFrom = "moonglesson@gmail.com";
         String toMail = email;
         String title = "[뭉과외] 임시 비밀번호가 발급되었습니다.";
         String content = userId+" 님의 임시 비밀번호가 발급되었습니다."
                      + "<br><br>임시 비밀번호: <b>"+enPwd+"</b>"
                      + "<br><br>임시 비밀번호로 로그인 후 비밀번호를 변경해주세요.";
         mailSend(setFrom, toMail, title, content);
      }
   
   //이메일 전송
   public void mailSend(String setFrom, String toMail, String title, String content) { 
      // Spring에서 제공하는 메일 API
      MimeMessage message = mailSender.createMimeMessage();
      try {
         MimeMessageHelper helper = new MimeMessageHelper(message,true,"UTF-8");
         helper.setFrom(setFrom);
         helper.setTo(toMail);
         helper.setSubject(title);
         helper.setText(content,true);
         mailSender.send(message);
      } catch (MessagingException e) {
         e.printStackTrace();
      }
   }
   
   
}
