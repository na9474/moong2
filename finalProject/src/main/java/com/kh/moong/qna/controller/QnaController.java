package com.kh.moong.qna.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.common.template.Pagination;
import com.kh.moong.member.model.vo.Member;
import com.kh.moong.qna.model.service.QnaService;
import com.kh.moong.qna.model.vo.QnaAnswer;
import com.kh.moong.qna.model.vo.QnaFile;
import com.kh.moong.qna.model.vo.QnaQuestion;
import com.kh.moong.qna.model.vo.QnaType;

@Controller
public class QnaController {

	
	@Autowired
	private QnaService qnaService;


	//QnA
	//QnA 목록
	@RequestMapping("qnaListView.qu")
	public String qnaListView(
			@RequestParam(value="cpage",defaultValue="1") int currentPage,
			Model model,HttpSession session
							) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		//전체 게시글 수
		int listCount = qnaService.selectQnaListCount(userNo);

		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<QnaQuestion> list = qnaService.selectList(pi,userNo);
		
		//댓글 개수 가져오기
		ArrayList<QnaAnswer> alist = qnaService.qaCount();
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		model.addAttribute("alist",alist);
		
		return "qna/qnaListView";
	}
	
	//QnA 작성 페이지 이동
	@RequestMapping("qnaEnrollForm.qu")
	public String qnaEnrollForm(Model model) {

		//카테고리 가져오기
		ArrayList<QnaType> list = qnaService.selectQnaType();
		
		model.addAttribute("list",list);
		
		return "qna/qnaEnrollForm";
	}
	
	//QnA 작성하기
	@RequestMapping("qnaInsert.qu")
	public String qnaInsert(QnaQuestion qq, Model model,HttpSession session, String qfSysName) {

		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		System.out.println(qfSysName);
		qq.setUserNo(userNo);
		
		int result = qnaService.qnaInsert(qq);
		
		//첨부파일 있는 경우
		if(qfSysName != null) {
			qq.setQfSysName(qfSysName);
			
			//작성된 게시글의 qnaNo가져오기
			
			//afSysName과 동일한 파일 찾아서 qnaNo에 값 넣아준다(update)
			int result2 = qnaService.updateQfQnaNo(qq);

			session.setAttribute("alertMsg","QnA가 작성되었습니다.");
			return "redirect:/qnaListView.qu";
			
		}else {
			
			if(result>0) {
				//작성 성공
				session.setAttribute("alertMsg","QnA가 작성되었습니다.");
				return "redirect:/qnaListView.qu";
			}
		}
		
			
		
		
		return "redirect:/";
	}
	
	
	//QnA 이미지 업로드
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile
											,QnaFile qf
											,HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/qnaUploadFiles/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명

		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/moong/resources/qnaUploadFiles/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
			jsonObject.addProperty("qfSysName", savedFileName);
			
			qf.setQfOriginName(originalFileName);
			qf.setQfSysName(savedFileName);
			
			//qf를 db에 저장시켜준다
			//나중에 작성 버튼 클릭 시 sysName가지고 가서 해당 사진의 참조 qna번호 업데이트 시켜줄것
			int result = qnaService.insertQf(qf);
//			System.out.println(result);
			
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
	
	
	//QnA 자세히 보기
	@RequestMapping("qnaDetailView.qu")
	public String qnaDetailView(int qnaNo, Model model) {
		
		
		//상세보기
		QnaQuestion qq = qnaService.selectQuestion(qnaNo);
		
		model.addAttribute("qq",qq);
		
		return "qna/qnaDetailView";
	
	}
	
	//수정하기
	//작성 내용 불러오기
	@RequestMapping("qnaUpdateForm.qu")
	public String qnaUpdateForm(Model model, int qnaNo) {
		
		//카테고리 불러오기
		ArrayList<QnaType> list = qnaService.selectQnaType();
		
		//작성 내용
		QnaQuestion qq = qnaService.selectQuestion(qnaNo);
		
		model.addAttribute("qq",qq);
		model.addAttribute("list",list);
		
		return "qna/qnaUpdateForm";
		
	}
	
	//수정하기
	@RequestMapping("qnaUpdate.qu")
	public String qnaUpdate(Model model, int qnaNo, QnaQuestion qq, HttpSession session) {

		//수정하기
		qq.setQnaNo(qnaNo);
		int result = qnaService.updateQna(qq);

		if(result>0) {
			session.setAttribute("alertMsg", "수정 되었습니다");
			
			return "redirect:/qnaListView.qu";
		}
		return "redirect:/";
		
	}
	
	
	//삭제하기
	@RequestMapping("qnaDelete.qu")
	public String qnaDelete(Model model, int qnaNo, HttpSession session) {
		
		int result = qnaService.deleteQna(qnaNo);
		
		if(result>0) {
			session.setAttribute("alertMsg", "삭제 되었습니다");
			
			return "redirect:/qnaListView.qu";
		}
		return "redirect:/";
		
	}
	
	//댓글
	//댓글 조회
	@ResponseBody
	@RequestMapping(value="rlist.qu",produces="application/json; charset=UTF-8")
	public String selectAnswerList(int qnaNo) {
		
		ArrayList<QnaAnswer> list = qnaService.selectAnswerList(qnaNo);

		return new Gson().toJson(list);
	}
	
	//댓글 작성
	@ResponseBody
	@RequestMapping(value="rinsert.qu",produces="html/text; charset=UTF-8")
	public String insertReply (QnaAnswer qa) {

		int result = qnaService.insertAnswer(qa);

		String ans = "";
		
		if(result>0) { //성공
			ans="Y";
		}else {//실패
			ans="N";
		}
		return ans;
	}

}
