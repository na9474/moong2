package com.kh.moong.solution.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.common.template.Pagination;
import com.kh.moong.member.model.vo.Member;
import com.kh.moong.solution.model.service.SolutionService;
import com.kh.moong.solution.model.vo.Solution;
import com.kh.moong.solution.model.vo.SolutionCmt;
import com.kh.moong.solution.model.vo.SolutionCmtFiles;
import com.kh.moong.solution.model.vo.SolutionHeart;

@Controller
public class SolutionController {
	
	@Autowired
	private SolutionService solutionService;
	
	@RequestMapping("list.so")
	public String listAll(
					@RequestParam(value="cpage",defaultValue="1") int currentPage,
					Model model,
					String search_cat,
					String keyword,
					String subject,
					String tag
							) {
		
		int listCount = solutionService.selectListCount();
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Solution> list = solutionService.listAll(pi, search_cat, keyword, subject, tag);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "solution/solutionList";
	}
	
	//게시글 작성폼으로 이동
	@RequestMapping("writeForm.so")
	public String insertSolution() {
		
		return "solution/solutionWrite";
	}
	
	//게시글 작성
	@RequestMapping("write.so")
	public String insertSolution(Solution s) {
		
		int userNo=1;
		s.setUserNo(userNo);
		
		int result = solutionService.insertSolution(s);
		
		if(result>0) {
			
			return "redirect:list.so";
			
		}else { //실패
			
			System.out.println("글작성 실패");
		}
		
		return "solution/solutionWrite";
	}
	

	
	//게시글 상세페이지
	@RequestMapping("detail.so")
	public ModelAndView selectSolution(int sno, ModelAndView mv, HttpServletRequest request) {
		
		int result = solutionService.increaseCount(sno);
				
		int loginNo = 0;
		if(request.getSession().getAttribute("loginUser") !=null) {
			loginNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
		}
		int heartYn = solutionService.sHeartCheck(sno, loginNo);
		
		if(result > 0) { 
			
			Solution s = solutionService.selectSolution(sno);
			int heartCount = solutionService.sHeartCount(sno);
			
			//메소드 체이닝 (단 view정보가 뒤에 와야함)
			mv.addObject("s",s);
			mv.addObject("heartYn", heartYn);
			mv.addObject("loginNo", loginNo);
			mv.addObject("heartCount",heartCount).setViewName("solution/solutionDetail");

		}else {
			mv.addObject("errorMsg","게시글 조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	//게시글 삭제
	@RequestMapping("delete.so")
	public ModelAndView deleteSolution(ModelAndView mv,
									int sno,
									String filePath,
									HttpSession session) {
		
		int result = solutionService.deleteSolution(sno);
		
		if(result>0) { 
			if(!filePath.equals("")) {
				String realPath = session.getServletContext().getRealPath(filePath);
				new File(realPath).delete();
			}
			session.setAttribute("alertMsg", "게시글 삭제 성공");
			mv.setViewName("redirect:list.so");
		}else {
			mv.addObject("errorMsg", "게시글 삭제 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	//댓글 리스트 조회
	@RequestMapping(value="cmtList.so",produces="application/json; charset=UTF-8")
	@ResponseBody
	public String cmtListAll(int sno) {
		
		ArrayList<SolutionCmt> list = solutionService.cmtListAll(sno);
		
		return new Gson().toJson(list); 
	}
	//현재 넘어온 첨부파일 자체를 서버 폴더에 저장시키는 역할
	public String saveFile(MultipartFile upfile,HttpSession session) {
		
		//1.원본파일명 뽑기
		String originName = upfile.getOriginalFilename(); // "dog.jpg" 
		//2.시간 형식을 문자열로 뽑아오기
		//년월일시분초
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		//3.뒤에 붙을 5자리 랜덤값 뽑기
		int ranNum = (int)(Math.random() * 90000 + 10000); //5자리 랜덤값
		
		//4.원본 파일명으로부터 확장자명 뽑기
		//.jpg
		String ext = originName.substring(originName.lastIndexOf("."));
		
		//5.다 이어붙이기
		String changeName = currentTime+ranNum+ext;
//		System.out.println(originName);
//		System.out.println(changeName);
		
		//6.업로드 하고자하는 물리적인 위치 알아내기(경로)
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		//7. 경로와 수정파일명을 합쳐서 업로드하기
		try {
			upfile.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;	
	}
	
	//댓글작성
	@RequestMapping("cmtInsert.so")
	public String insertCmt(SolutionCmt sc, MultipartFile file, SolutionCmtFiles scf, RedirectAttributes re, HttpServletRequest request, HttpSession session) {
		
		int loginNo = 0;
		if(request.getSession().getAttribute("loginUser") !=null) {
			loginNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
		}
		
		
		
		if(!file.getOriginalFilename().equals("") || !file.isEmpty()) {
			
			String changeName = saveFile(file,session);
			int scNo = solutionService.getScNo();
			
			scf.setScfOriginName(file.getOriginalFilename());
			scf.setScfSysName("resources/uploadFiles/"+changeName);
			scf.setScNo(scNo);
			int result1 = solutionService.insertSolCmtFiles(scf);
			if(result1>0) {
				System.out.println("파일 첨부 성공");
			}
		}else {
			System.out.println("파일 첨부 안함");
		}
        
		
		sc.setUserNo(loginNo);

		int result2 = solutionService.insertCmt(sc);
		
		String ans="";

		re.addAttribute("sno", sc.getSolutionNo());
		
		if(result2 > 0) {
			System.out.println("댓글 저장 성공");
			return "redirect:detail.so";
		}else {
			System.out.println("댓글 저장 실패");
			return "redirect:detail.so";
		}

	}
	
	//댓글삭제
	@RequestMapping("cmtDelete.so")
	public ModelAndView deleteCmt(ModelAndView mv,
									int scNo,
									int solutionNo,
									String filePath,
									HttpSession session) {
		
		int result = solutionService.deleteCmt(scNo);
		
		if(result>0) { 
//			if(!filePath.equals("")) {
//				String realPath = session.getServletContext().getRealPath(filePath);
//				new File(realPath).delete();
//			}
			session.setAttribute("alertMsg", "댓글 삭제 성공");
			
			mv.setViewName("redirect:detail.so?sno="+solutionNo);
		}else {
			mv.addObject("errorMsg", "댓글 삭제 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	//추천하기
	@RequestMapping("heart.so")
	public String sHeartInsert(int solutionNo, HttpServletRequest request) {

		SolutionHeart sh = new SolutionHeart();
		int loginNo = 0;
		if(request.getSession().getAttribute("loginUser") !=null) {
			loginNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
		}
		
		sh.setSolution_no(solutionNo);
		sh.setUser_no(loginNo);
	
		int result = solutionService.sHeartInsert(sh);
		
		if(result>0) {
			System.out.println("추천 성공");
		}else { 
			System.out.println("추천 실패");
		}
		return "redirect:detail.so?sno="+solutionNo;
	}
	
	//추천취소
	@RequestMapping("heartDelete.so")
	public String sHeartDelete(int solutionNo, HttpServletRequest request) {
		
		SolutionHeart sh = new SolutionHeart();
		int loginNo = 0;
		if(request.getSession().getAttribute("loginUser") !=null) {
			loginNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
		}
		
		sh.setSolution_no(solutionNo);
		sh.setUser_no(loginNo);

		int result = solutionService.sHeartDelete(sh);
		
		if(result>0) { 
			System.out.println("추천 취소");
		}else {
			System.out.println("추천 취소 실패");
		}
		return "redirect:detail.so?sno="+solutionNo;
	}
	
	@RequestMapping(value="/uploadImage", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
		
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/uploadFiles/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "resources/uploadFiles/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
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
