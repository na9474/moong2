package com.kh.moong.lesson.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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
import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.common.template.Pagination;
import com.kh.moong.lesson.model.service.LessonEnrollService;
import com.kh.moong.lesson.model.vo.Districts;
import com.kh.moong.lesson.model.vo.Lesson;
import com.kh.moong.lesson.model.vo.LessonEnroll;
import com.kh.moong.lesson.model.vo.LessonReview;
import com.kh.moong.lesson.model.vo.Search;
import com.kh.moong.matching.model.service.MatchingService;

@Controller
public class LessonEnrollController {
	
	@Autowired
	private LessonEnrollService ls;
	
	@Autowired
	private MatchingService ms;
		//첨부파일
	
	
	public String saveFile(MultipartFile upfile,HttpSession session) {
		
		
		String originName =upfile.getOriginalFilename(); 
			
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		
		int ranNum =(int)(Math.random() * 90000 +10000); //5자리 랜덤값
		
		
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		
		String changeName = currentTime+ranNum+ext;
		
		
		
		String savePath = session.getServletContext().getRealPath("/resources/lesson_video/");
		
		try {
			upfile.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	
	
	
		//선생님 개인
	
		//과외등록 리스트 뽑기
		@RequestMapping("list.le")
		public String LessonList(int userNo,Model model) {
			
			ArrayList<LessonEnroll> list = ls.selectList(userNo);
			
			model.addAttribute("list",list);
			return "lesson/lessonEnrollList";
		}
		
		//과외등록 페이지로 이동
		@RequestMapping("enrollFrom.le")
		public ModelAndView lessonEnrollForm(ModelAndView mv) {
			
			ArrayList<Districts> d = ls.selectDistrictsList();
			
			mv.addObject("d",d).setViewName("lesson/lessonEnrollForm");
			
			return mv;
		}
		
		
		//과외등록
		@RequestMapping("insert.le")
		public ModelAndView lessonInsert(LessonEnroll le,ModelAndView mv,HttpSession session,MultipartFile upfile) {
			
			//똑같은 과목으로 등록된 과외가 있는지 확인
			int result  = ls.lessonInsertCheck(le);
					 
					 
				if(result>0) { //똑같은 과목으로 생성된 과외가 있음(과외등록불가능)
					session.setAttribute("alertMsg", "이미 등록된 같은 과목이 있습니다 ");
					mv.setViewName("lesson/lessonEnrollForm");
				}else { //똑같은 과목으로 생성된 과외가 없음(과외등록가능) 
					
						
						
						String changeName = saveFile(upfile,session);
						
						le.setLeOriginname(upfile.getOriginalFilename());
						le.setLeChangename("resources/lesson_video/"+changeName);
						
					
					int result2 = ls.lessonInsert(le);
					
					if(result2>0) { //과외등록 성공
						session.setAttribute("alertMsg", "과외등록성공");
						mv.setViewName("redirect:list.le?userNo="+le.getUserNo());
					}else {	//과외등록 실패
						mv.addObject("errorMsg","과외등록실패").setViewName("common/errorPage");
					}
				}
			
				
			return mv;
		}
		
		
		
		//등록된 선생님 전체 리스트 조회 
		@RequestMapping("tlist.le")
		public ModelAndView teacherList(
				@RequestParam(value = "cpage", defaultValue = "1") int currentPage/* ,int userNo */, ModelAndView mv) {
			
			
			
//			if(userNo != 0) { //학생회원
//				
//				//등록된 매칭중에 매칭상태가 C인 매칭이 있는지 과목,학년,지역,요금은 평균치
//				int result = ms.tlistCheck(userNo);
//				
//				if(result>0) { //해당학생이 매칭이 완료되서 선생님을 찾고 있음
//					
//					//해당학생의 매칭이 완료된 과외정보를 불러옴 
//					Matching matching = ms.selectcomparison(userNo);
//								
//				}else { // 학생이 매칭을 등록하지 않았거나 매칭이 완료되지 않음 
//					int listCount = ls.selectAllLessonCount();
//					
//					
//					int pageLimit = 10;
//					int boardLimit = 20;
//					
//					PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
//					
//					
//					ArrayList<LessonEnroll> list = ls.selectAllLesson(pi);
//					
//					mv.setViewName("lesson/teacherLessonList");
//					mv.addObject("pi",pi);
//					mv.addObject("list",list);
//				}
//				
//				
//			}else { //userNo가 0이면 학생회원이 아님
				
				
				int listCount = ls.selectAllLessonCount();
				
				
				int pageLimit = 10;
				int boardLimit = 20;
				
				PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
				
				
				ArrayList<LessonEnroll> list = ls.selectAllLesson(pi);
				
				mv.setViewName("lesson/teacherLessonList");
				mv.addObject("pi",pi);
				mv.addObject("list",list);
				
				
//			}
			
			
			
			return mv;
		}
		
		
		//모든 선생님 과외정보 페이지 공통
		//등록한 과외정부 세부보기
				@RequestMapping("detail.le")
				public ModelAndView selectLesson(int leNo,ModelAndView mv) {
					
					LessonEnroll l = ls.selectLesson(leNo);
					
					//조회성공
					if(l.getLeNo()>0) {
						mv.addObject("l",l).setViewName("lesson/lessonDetail");
					//조회실패
					}else {
						mv.addObject("errorMsg","조회실패").setViewName("common/errorPage");
					}
					
					return mv;
				}
				
				
	//등록한 과외정보 수정 페이지 이동
				@RequestMapping("updateForm.le")
				public ModelAndView lessonEnrollUpdateForm(int leNo,ModelAndView mv) {
					
					LessonEnroll l = ls.selectLesson(leNo);
					ArrayList<Districts> d = ls.selectDistrictsList();
					
					mv.addObject("l",l).addObject("d",d).setViewName("lesson/lessonUpdateForm");
					return mv;
				}
				
				
	//등록한 과외정보 삭제
				@RequestMapping("delete.le")
				public ModelAndView lessonEnrollDelete(int leNo,int userNo,ModelAndView mv,HttpSession session) {
					
					int result = ls.deleteLesson(leNo);
					
					if(result>0) {
						session.setAttribute("alertMsg", "선택한 과외등록이 삭제되었습니다.");
						mv.setViewName("redirect:list.le?userNo="+userNo);
					}else {
						mv.addObject("errorMsg","삭제실패").setViewName("common/errorPage");
					}
					return mv;
				}
				
	//등록한 과외정보 수정
			@RequestMapping("update.le")
			public ModelAndView lessonUpdate(LessonEnroll le,ModelAndView mv,HttpSession session,MultipartFile upfile){
				
				int check  = ls.lessonInsertCheck(le);
				
				if(check>0) {
					session.setAttribute("alertMsg", "같은과목으로 등록된 과외가 있습니다.");	
					mv.setViewName("redirect:updateForm.le?leNo="+le.getLeNo());
				}else {
				
				if(!upfile.getOriginalFilename().contentEquals("")) {

					
					if(le.getLeOriginname().equals("")) {
						
						new File(session.getServletContext().getRealPath(le.getLeChangename())).delete();
					}
					
					
					String changeName = saveFile(upfile,session);
					le.setLeChangename("resources/lesson_video/"+changeName);
					
					le.setLeOriginname(upfile.getOriginalFilename());
					
					
				}
				
				int result = ls.updateLesson(le);

				if(result>0) {
					session.setAttribute("alertMsg", "과외등록정보 수정 성공");	
					mv.setViewName("redirect:detail.le?leNo="+le.getLeNo());
				}else {
					mv.addObject("errorMsg","수정 실패").setViewName("common/errorPage");
				}
				}
				
				return mv;
			}
			
			
			@RequestMapping("search.le")
			public ModelAndView SearchLessonEnroll(@RequestParam(value = "cpage", defaultValue = "1") int currentPage,Search s,ModelAndView mv) {
				
				
				
				int listCount = ls.selectAllLessonCount();
				
				
				int pageLimit = 10;
				int boardLimit = 20;
				
				PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
				
				
				ArrayList<LessonEnroll> list = ls.selectSearchAllLesson(pi,s);
				
				
				
				
				mv.setViewName("lesson/teacherLessonList");
				mv.addObject("sText",s.getSearchText());
				mv.addObject("pi",pi);
				mv.addObject("list",list);
				
				
				return mv;
			}
			
			
			
			
			// 후기 쓰기(한 번 작성하면 재작성X)
			@RequestMapping(value="revinsert.rv", produces="application/json; charset=UTF-8")
			@ResponseBody
			public String insertReview(LessonReview lr) {
				LessonReview wr = ls.isWriteReview(lr);
				String rv = "";
				
				if(wr == null) {
					int result = ls.insertReview(lr);
					
					if(result > 0) {
						rv = "Y";
					} else {
						rv = "N";
					}
					return new Gson().toJson(rv);
					
				} else {
					rv = "nn";
					
					return new Gson().toJson(rv);
				}
			}
			
			// 후기 목록
			@RequestMapping(value="revlist.rv", produces="application/json; charset=UTF-8")
			@ResponseBody
			public String reviewList(int refLeNo) {
				
				ArrayList<LessonReview> rvList = ls.reviewList(refLeNo);

				return new Gson().toJson(rvList);
			}
			
			// 해당 선생님의 과외학생인지
			@RequestMapping(value="revCount.rv", produces="application/json; charset=UTF-8")
			@ResponseBody
			public String countStudent(Lesson les) {
				int stuCount = ls.countStudent(les);
				return new Gson().toJson(stuCount);
			}
			
			// 후기 수정
			@RequestMapping(value="modifyRev.rv", produces="application/json; charset=UTF-8")
			@ResponseBody
			public String modiReview(LessonReview lr) {
				int result = ls.modiReview(lr);
				
				String modiRv = "";
				
				if(result > 0) {
					modiRv = "Y";
				} else {
					modiRv = "N";
				}
				return new Gson().toJson(modiRv);
			}
}


