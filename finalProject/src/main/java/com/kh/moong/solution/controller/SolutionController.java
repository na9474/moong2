package com.kh.moong.solution.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
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
import com.kh.moong.police.model.service.PoliceService;
import com.kh.moong.police.model.vo.Police;
import com.kh.moong.solution.model.service.SolutionService;
import com.kh.moong.solution.model.vo.Solution;
import com.kh.moong.solution.model.vo.SolutionCmt;
import com.kh.moong.solution.model.vo.SolutionCmtFiles;
import com.kh.moong.solution.model.vo.SolutionFiles;
import com.kh.moong.solution.model.vo.SolutionHeart;

@Controller
public class SolutionController {
	
	@Autowired
	private SolutionService solutionService;
	
	@Autowired
	private PoliceService policeService;
	
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
		
//		ArrayList<String> tags= solutionService.selectTags();
//		int rRange = tags.size();
//		int rnum1 = (int)(Math.random()*rRange);
//		int rnum2 = (int)(Math.random()*rRange);
//		if(rnum1==rnum2) {
//			if(rnum1<rRange) {
//				rnum2++;
//			}else {
//				rnum2--;
//			}
//		}
//		
//		ArrayList<String> rTags = new ArrayList<String>();
//		rTags.add(tags.get(rnum1));
//		rTags.add(tags.get(rnum2));
		
		ArrayList<String> tagList = solutionService.selectTag();
		
		String tags = "";
		
		try {
			
			for(String s : tagList) {
				 tags+= s;
			}
			
//			//앞부분에 필요없는 문자를 지우고 공백을 없애줌
//			tags = tags.replaceAll("\\s", "");
					
			//#을 구분자로 배열에 담아서 구분함
			String[] tagArr =tags.split("#");
			
			//구분한 배열을 리스트로 담고 해쉬셋으로 바꿔주고 다시 리스트에 담아주면 중복이 제거됨
			List<String> tagList1 =Arrays.asList(tagArr); 
			HashSet<String> tagList2 = new HashSet<String>(tagList1);
			List<String> tagList3 = new ArrayList<String>(tagList2);
			
			//셔플을 이용해서 섞어줌
			Collections.shuffle(tagList3);
			//다시배열에 담아주고 메인페이지로 보내줌
			//String[] tagArr2= tagList3.toArray(new String[0]);
			
			ArrayList<String> tagOut = new ArrayList<String>();
			tagOut.add(tagList3.get(0));
			tagOut.add(tagList3.get(1));
			tagOut.add(tagList3.get(2));
			model.addAttribute("tagOut", tagOut);
			
			//만약 인덱스에 담긴값이  null값이라면 index out of bounds가 
			//발생하기 때문에 빈배열에 "no registered tags"태그가 없습니다 문구를 담아서 반환	
		}catch (Exception e) {			
			String[] tagArr;
			tagArr = new String[1];
			tagArr[0] ="no registered tags";
			model.addAttribute("tagOut", tagArr);
		}
		
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
	public String insertSolution(Solution s, HttpSession session, String sfSysName) {
		
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		s.setUserNo(userNo);
		
		int result = solutionService.insertSolution(s);
		
		if(sfSysName != null) {
			
			int result2 = solutionService.updateSolutionNo(s);

			session.setAttribute("alertMsg","게시물이 작성되었습니다.");
			
			return "redirect:list.so";
			
		}else {
			
			if(result>0) {
				session.setAttribute("alertMsg","게시물이 작성되었습니다.");
				
				return "redirect:list.so";
			}
		}
		
		return "redirect:/";
	}
		

	//게시글 상세페이지
	@RequestMapping("detail.so")
	public ModelAndView selectSolution(int sno, ModelAndView mv, HttpServletRequest request) {
		
		int result = solutionService.increaseCount(sno);
				
		int loginNo = 0;
		String loginId = null;
		if(request.getSession().getAttribute("loginUser") !=null) {
			loginNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
			loginId = ((Member) request.getSession().getAttribute("loginUser")).getUserId();
		}
		int heartYn = solutionService.sHeartCheck(sno, loginNo);
		int solPoliceYn = solutionService.solPoliceCheck(sno, loginNo);
		
		if(result > 0) { 
			
			Solution s = solutionService.selectSolution(sno);
			
			ArrayList<Solution> ts = solutionService.teacherSolution(s.getSubject());
			
			Solution s2 = new Solution();
			s2.setSubject(s.getSubject());
			s2.setUserNo(s.getUserNo());
			ArrayList<Solution> ss = solutionService.studentSolution(s2);
			
			int heartCount = solutionService.sHeartCount(sno);
			
			mv.addObject("ts",ts);
			mv.addObject("ss",ss);
			mv.addObject("s",s);
			mv.addObject("heartYn", heartYn);
			mv.addObject("solPoliceYn", solPoliceYn);
			mv.addObject("loginNo", loginNo);
			mv.addObject("loginId", loginId);
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
		int result2 = solutionService.solDeletePolice(sno);
		 
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
		}
		
		sc.setUserNo(loginNo);

		int result2 = solutionService.insertCmt(sc);
		
		String ans="";

		re.addAttribute("sno", sc.getSolutionNo());
		
		if(result2 > 0) {
			return "redirect:detail.so";
		}else {
			return "redirect:detail.so";
		}

	}
	
	//댓글삭제
	@RequestMapping("cmtDelete.so")
	public ModelAndView deleteCmt(ModelAndView mv,
									int scNo,
									int solutionNo,
									HttpSession session) {
		
		int result = solutionService.deleteCmt(scNo);
		int result2 = solutionService.cmtDeletePolice(scNo);
		
		if(result>0) { 
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
		
		return "redirect:detail.so?sno="+solutionNo;
	}
	
	//섬머노트 이미지 업로드
	@RequestMapping(value="/uploadFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadFile(@RequestParam("file") MultipartFile multipartFile
											,SolutionFiles sf
											,HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/solUploadFiles/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명

		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/moong/resources/solUploadFiles/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
			jsonObject.addProperty("sfSysName", savedFileName);
			
			sf.setSfOriginName(originalFileName);
			sf.setSfSysName(savedFileName);
			
			int result = solutionService.insertSolutionFiles(sf);
			
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
	
	//게시글 수정하기페이지
	@RequestMapping("modifyForm.so")
	public ModelAndView solutionModify(int sno, ModelAndView mv, HttpServletRequest request) {
		
		int result = solutionService.increaseCount(sno);
				
		int loginNo = 0;
		if(request.getSession().getAttribute("loginUser") !=null) {
			loginNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
		}
		
		if(result > 0) { 
			
			Solution s = solutionService.selectSolution(sno);
			
			mv.addObject("s",s);
			mv.addObject("loginNo", loginNo).setViewName("solution/solutionModify");

		}else {
			mv.addObject("errorMsg","게시글 조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	//수정하기
	@RequestMapping("modify.so")
	public String updateSolution(int solutionNo, Solution s, HttpSession session) {

		s.setSolutionNo(solutionNo);
		int result = solutionService.updateSolution(s);

		if(result>0) {
			session.setAttribute("alertMsg", "수정 되었습니다");
			
			return "redirect:/list.so";
		}
		
	return "redirect:/";
	}
	
}
