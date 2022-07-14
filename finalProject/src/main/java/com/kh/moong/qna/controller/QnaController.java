package com.kh.moong.qna.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.common.template.Pagination;
import com.kh.moong.qna.model.service.QnaService;
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
			Model model
							) {
		
		//전체 게시글 수
		int listCount = qnaService.selectQnaListCount();
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<QnaQuestion> list = qnaService.selectList(pi);
	
		
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		
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
	public String qnaInsert(QnaQuestion qq, Model model) {

//		System.out.println(qq);
		
		int result = qnaService.qnaInsert(qq);
		
		return "qna/qnaEnrollForm";
	}
	
	
	//QnA 이미지 업로드
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/fileupload/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/summernote/resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}

}
