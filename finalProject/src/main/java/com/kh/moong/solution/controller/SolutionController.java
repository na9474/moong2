package com.kh.moong.solution.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.kh.moong.member.model.vo.Member;
import com.kh.moong.solution.model.service.SolutionService;
import com.kh.moong.solution.model.vo.Solution;
import com.kh.moong.solution.model.vo.SolutionCmt;
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
	
	
//	@RequestMapping("uploadSummernoteImageFile")
//	public String insertSolutionFiles(SolutionFiles sf
//									  ,MultipartFile upfile
//									  ,HttpSession session
//									  ,Model model
//									  ) {
//		
//		if(!upfile.getOriginalFilename().equals("")) {
//		
//		String sfSysName = saveFile(upfile,session);
//		
//		sf.setSfOriginName(upfile.getOriginalFilename());
//		sf.setSfSysName("resources/uploadFiles/"+sfSysName);
//	}
//		
//		int result = solutionService.insertSolutionFiles(sf);
//	
//		if(result>0) {
//			
//			session.setAttribute("alertMsg", "게시글을 작성하셨습니다.");
//			return "redirect:list.bo";
//			
//		}else { //실패
//			model.addAttribute("errorMsg", "게시글 작성 실패");
//			return "common/errorPage";
//		}
//	}
//
//	public String saveFile(MultipartFile upfile,HttpSession session) {
//		
//		String sfOriginName = upfile.getOriginalFilename();
//		
//		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
//		
//		int ranNum = (int)(Math.random() * 90000 + 10000);
//		
//		String ext = sfOriginName.substring(sfOriginName.lastIndexOf("."));
//		
//		String sfSysName = currentTime+ranNum+ext;
//	
//		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
//		
//		try {
//			upfile.transferTo(new File(savePath+sfSysName));
//		} catch (IllegalStateException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//		return sfSysName;
//	}
	
	//게시글 상세페이지
	@RequestMapping("detail.so")
	public ModelAndView selectSolution(int sno, ModelAndView mv, HttpServletRequest request) {
		int result = solutionService.increaseCount(sno);
				
		int loginNo = 0;
		if(request.getSession().getAttribute("loginUser") !=null) {
			loginNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
		}
		int heartYn = solutionService.sHeartCheck(sno, loginNo);
		
		if(heartYn>0) {
			heartYn=1;
		}else {
			heartYn=0;
		}
		
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
	
	//댓글작성
	@RequestMapping(value="cmtInsert.so",produces="html/text; charset=UTF-8")
	@ResponseBody
	public String insertCmt(SolutionCmt sc, HttpServletRequest request) {
		
		int loginNo = 0;
		if(request.getSession().getAttribute("loginUser") !=null) {
			loginNo = ((Member) request.getSession().getAttribute("loginUser")).getUserNo();
		}
		
		sc.setUserNo(loginNo);

		int result = solutionService.insertCmt(sc);
		
		String ans="";
		
		if(result>0) { //성공
			ans="Y";
		}else {//실패 
			ans="N";
		}
		return ans;
	}
	
//	//댓글 파일첨부
//	private String path="C:\\resources\\uploadFiles";
//	
//	@RequestMapping("result")
//    public String insertSolCmtFiles(@RequestParam("file1") MultipartFile multi,HttpServletRequest request,HttpServletResponse response, Model model)
//    {
//        String url = null;
//        
//        try {
// 
//            String uploadpath = path;
//            String scfOriginName = multi.getOriginalFilename();
//            String scfSysName = scfOriginName.substring(scfOriginName.lastIndexOf("."),scfOriginName.length());
//            long size = multi.getSize();
//            String saveFileName = genSaveFileName(scfSysName);
//            
//            System.out.println("uploadpath : " + uploadpath);
//            
//            System.out.println("sfOriginName : " + scfOriginName);
//            System.out.println("extensionName : " + scfSysName);
//            System.out.println("size : " + size);
//            System.out.println("saveFileName : " + saveFileName);
//            
//            if(!multi.isEmpty())
//            {
//                File file = new File(uploadpath, multi.getOriginalFilename());
//                multi.transferTo(file);
//                
//                model.addAttribute("filename", multi.getOriginalFilename());
//                model.addAttribute("uploadPath", file.getAbsolutePath());
//                
//                return "filelist";
//            }
//        }catch(Exception e)
//        {
//            System.out.println(e);
//        }
//        return "redirect:form";
//    }
//	
//    // 현재 시간을 기준으로 파일 이름 생성
//    private String genSaveFileName(String sfSysName) {
//        String fileName = "";
//        
//        Calendar calendar = Calendar.getInstance();
//        fileName += calendar.get(Calendar.YEAR);
//        fileName += calendar.get(Calendar.MONTH);
//        fileName += calendar.get(Calendar.DATE);
//        fileName += calendar.get(Calendar.HOUR);
//        fileName += calendar.get(Calendar.MINUTE);
//        fileName += calendar.get(Calendar.SECOND);
//        fileName += calendar.get(Calendar.MILLISECOND);
//        fileName += sfSysName;
//        
//        return fileName;
//    }
	
	
	
	
	
	
	
	//댓글삭제
	@RequestMapping("cmtDelete.so")
	public ModelAndView deleteCmt(ModelAndView mv,
									int scNo,
									int solutionNo,
									String filePath,
									HttpSession session) {
		
		System.out.println("cmtDelete 컨트롤러");
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
	@RequestMapping(value="heart.so",produces="html/text; charset=UTF-8")
	@ResponseBody
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
	@RequestMapping(value="heartDelete.so",produces="html/text; charset=UTF-8")
	@ResponseBody
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
	

}
