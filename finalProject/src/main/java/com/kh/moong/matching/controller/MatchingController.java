package com.kh.moong.matching.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.moong.matching.model.service.MatchingService;
import com.kh.moong.matching.model.service.MatchingServiceNam;
import com.kh.moong.matching.model.vo.Matching;
import com.kh.moong.matching.model.vo.Room;
import com.kh.moong.matching.model.vo.Talarm;

@Controller
public class MatchingController {

	@Autowired
	private MatchingService ms;
	
	@Autowired
	private MatchingServiceNam msn;

	//매칭페이지이동
	@RequestMapping("enroll.ma")
	public String MatchingEnroll() {

		return "matching/matchingEnroll";
	}

	//매칭등록
	@RequestMapping("insert.ma")
	public ModelAndView insertMatching(Matching m, ModelAndView mv, HttpSession session) {
		
		// 같은 과목으로 등록된 매칭이 있는지 확인 o
		int checkSubject = ms.checkSubject(m);

		if (checkSubject > 0) { // 같은 과목으로 등록된 매칭이 있음
			
			session.setAttribute("alertMsg", "같은 과목으로 등록된 과외가 있습니다.");
			mv.setViewName("redirect:enroll.ma");
			
		} else { // 같은 과목으로 등록된 매칭이 없음
			// 날짜 배열 순서대로온거 ,제거
			 String maDay = m.getMaDay().replaceAll(",", "");
			 m.setMaDay(maDay);
			 
			if (m.getRandom().equals("N")) {// 매칭이 랜덤이 아니라면 매칭 등록하고 바로 과외선생님과연결
			
				int result = ms.insertMatching(m);
				if(result>0) {//매칭등록 성공
					
					session.setAttribute("alertMsg", "등록이 완료되었습니다.");
					mv.setViewName("redirect:alarm.ma?uNo="+m.getUserNo());
				}else {//매칭등록 실패
					mv.addObject("errorMsg","신규매칭등록실패").setViewName("common/errorPage");
				}
				
			} else { // 매칭이 랜덤이라면

				// 동일한 조건으로 등록한 사람이 있는지 확인
				
				// 1.매칭페이지에서 등록한 조건비교
				
				int check = ms.checkMatching(m);
				// ->동일한 조건의 GROUP_NO를 가져옴
					
				if (check == 0) {
					// 등록한 사람이 없음 -> 새로운 매칭조건 생성
					int result2 = ms.insertMatching(m);
					
					if (result2 > 0) { //신규매칭등록성공
						
						session.setAttribute("alertMsg", "신규 매칭이 등록되었습니다.");
						mv.setViewName("redirect:alarm.ma?uNo="+m.getUserNo());
						
					} else { //신규매칭등록실패
						
						mv.addObject("errorMsg","신규매칭등록실패").setViewName("common/errorPage");
						
					}
				} else {
					// 등록한 사람이 있음 -> 같은 매칭조건으로 들어감
					// 같은 매칭초건의 groupNo를 입력해줌
					m.setGroupNo(check);
					// 같은 매칭의 groupNo로 테이블에 정보가 테이블에 입력됨
					int result3 = ms.joinMatching(m);

					if (result3 > 0) { //등록성공
						// 같은 그룹의 인원수를 count에 담음
						int count = ms.countMatching(m.getGroupNo());
						// count와 people에 등록된 매칭인원수를 비교 같다면 매칭이 완료됨
						if (count == Integer.parseInt(m.getPeople())) {
								//매칭이 완료된 그룹 인원들의 유저no,그룹no,과목,요금,요일,지역가져오고
								//과외비 평균내주기 
						     
								//선생님리스트를 조건에 맞는 정보만 보여줌(그전에는 전체리스트가 다보임) 
							
								//그룹원들의 status를 c로바꿈 
								int groupNo = m.getGroupNo();
								int result4 =  ms.completeMatching(groupNo);	
													
									if(result4>0) {//매칭완료된 그룹의 status 변경성공
										mv.setViewName("redirect:alarm.ma?uNo="+m.getUserNo());		
										
										
										
						} else { // 아니라면 매칭 총 인원이 충족되지 않음
							session.setAttribute("alertMsg", "기존 그룹에 매칭이 등록되었습니다.");
							mv.setViewName("redirect:alarm.ma?uNo="+m.getUserNo());
						}
					} else { //등록실패
						mv.addObject("errorMsg","조인매칭실패").setViewName("common/errorPage");
					}
				}
			}
		}
	}
		return mv;
	}
	//매칭알람 페이지로 이동
	@RequestMapping("alarm.ma")
	public ModelAndView MatchingAlarmList(int uNo,ModelAndView mv) {
		
		 ArrayList<Matching> list = ms.alarmList(uNo);
		
		 for(int i=0; i<list.size(); i++) {
		if(list.get(i).getRandom().equals("Y")) {
			list.get(i).setPeople(ms.countMatching(list.get(i).getGroupNo())+"/"+ list.get(i).getPeople());
		}
				 
			 
	     
		 }
		 
		 mv.addObject("list",list).setViewName("matching/matchingAlarm");
		 
		return mv;
	}
	
	//매칭 삭제
	@RequestMapping("delete.ma")
	public ModelAndView deleteMatching(int maNo,int userNo,ModelAndView mv,HttpSession session) {
		
		int result = ms.deleteMatching(maNo);
		if(result>0) {
			session.setAttribute("alertMsg", "매칭이 취소되었습니다.");
			mv.setViewName("redirect:alarm.ma?uNo="+userNo);
		}else {
			mv.addObject("errorMsg","매칭삭제실패").setViewName("common/errorPage");
		}
		return mv;
		
	}
	
	
	//매칭완료 표시
	@ResponseBody
	@RequestMapping(value ="check.ma",produces="application/json; charset=UTF-8")
	public String MatchingAlarm(int userNo) {
	
		int result = ms.matchingAlarm(userNo);
		
		return new Gson().toJson(result);
	}
	
	//매칭알람
	@ResponseBody
	@RequestMapping(value ="check2.ma",produces="application/json; charset=UTF-8")
	public String MatchingAlarm2(int userNo) {
	
		int result = ms.matchingAlarm2(userNo);
		
		return new Gson().toJson(result);
	}
	
	//알람띄운후 컬럼 상태변경
	@ResponseBody
	@RequestMapping(value ="alertcp.ma",produces="application/json; charset=UTF-8")
	public String updateAlarm(int maNo) {
	
		int result = ms.updateAlarm(maNo);
		
		return new Gson().toJson(result);
	}
	
	
	
	//선생님한테URL보내기 체크
	@ResponseBody
	@RequestMapping(value ="cheifCheck.ma",produces="application/json; charset=UTF-8")
	public String cheifCheck(int userNo) {
	
		
		int result = ms.cheifCheck(userNo);
		
		Matching m = null;
		if(result>0) {//선생님한테 url보내기 가능 조건 가져가서 비교 
			 m= ms.cheifCheck2(userNo);
		}
		
	
		return new Gson().toJson(m);
	}
	
	
	// 학생 - 매칭된 그룹 채팅방 url 보여주기
	@RequestMapping("roomList.rm")
	public String roomList(Room r, Model model) {
		
		ArrayList<Room> rmList = msn.roomList(r);
		model.addAttribute("rmList", rmList);
		
		return "room/roomList";
	}
	
	// 학생 - 매칭완료 확인후 그룹채팅방 url보여주기
	@RequestMapping("checkUrl.ma")
	public ModelAndView checkUrl(int userNo, ModelAndView mv) {
		
		int result = ms.checkUrl(userNo);
		
		if(result>0) {
			mv.setViewName("redirect:roomList.rm?userNo="+userNo);
		}else {
			mv.addObject("errorMsg","오류오류").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
	//학생 ->선생 - 채팅방 url 보내기  
	@RequestMapping("sendurl.ma")
	public ModelAndView sendUrl(Talarm t,int leNo, ModelAndView mv,HttpSession session) {
		
		//해당그룹의 sendURL 'Y'
		int result1 = ms.sendUrl(t.getGroupNo());
		
		
		if(result1>0) {//update 성공
			//선생님에게 알림  
			 int result2 =ms.insertTAlarm(t);
			 if(result2>0) {
				 session.setAttribute("alertMsg", "초대요청을 보냈습니다.");
					mv.setViewName("redirect:detail.le?leNo="+leNo);
			 }else {
				 mv.addObject("errorMsg","오류오류 talarm insert실패").setViewName("common/errorPage");
			 }
				
		}else {//update 실패
			mv.addObject("errorMsg","오류오류 sendurl변경실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
	//선생 - 학생매칭취소 (해당학생 다른선생초대가능)
	@RequestMapping("matcingCancel.ma")
	public ModelAndView matchingCancel(ModelAndView mv, int userNo,HttpSession session,int groupNo) {
		
		int result1 = ms.updateSendUrl(groupNo);
		int result2 = ms.talarmStatusUpdate(groupNo);
		if(result1*result2>0) {
					session.setAttribute("alertMsg", "매칭이 취소되었습니다.");
					mv.setViewName("redirect:teacherAlarmList.ma?userNo="+userNo);
		}else {
			mv.addObject("errorMsg","매칭취소update실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	//선생 - 알람리스트

	@RequestMapping("teacherAlarmList.ma")
	public ModelAndView teacherAlarmList( ModelAndView mv,int userNo) {
		
		ArrayList<Talarm> list = ms.checkGroupNo(userNo);
			
			mv.addObject("list",list).setViewName("matching/teacherAlarmList");
		return mv;
	}
	
	//선생 - 알람리스트 그룹정보확인 AJAX
	@ResponseBody
	@RequestMapping(value ="matchingInfo.ma",produces="application/json; charset=UTF-8")
	public String matchingInfo(int groupNo) {
		
		Matching m = ms.matchingInfo(groupNo);
		
		
		return new Gson().toJson(m);
	}
	
	//선생 - 채팅방 URL확인 AJAX
	
	@ResponseBody
	@RequestMapping(value ="matchingURL.ma",produces="application/json; charset=UTF-8")
	public String matchingURL(int groupNo) {
		
		Room r = ms.matchingURL(groupNo);
		
		
		return new Gson().toJson(r);
	}
	
	// 선생 - url등록온거 요청 확인 후 alert창
		
		@ResponseBody
		@RequestMapping(value ="checkSendUrl1.ma",produces="application/json; charset=UTF-8")
		public String checkSendUrl1(int userNo) {
			
			int result1 = ms.checkSendUrl(userNo);
			if(result1>0) {
						//alert Y 로 바꿈 ->알람 띄우지 않음 
			ms.checkSendUrlUpdate(userNo);
				
			}else {
				
			}
		
			
			return new Gson().toJson(result1);
		}
		
		// 선생 - url등록온거 요청 확인 후 check표시
		
				@ResponseBody
				@RequestMapping(value ="checkSendUrl2.ma",produces="application/json; charset=UTF-8")
				public String checkSendUrl2(int userNo) {
					
					int result1 = ms.checkSendUrl2(userNo);
				
					return new Gson().toJson(result1);
				}
	
	
	// 관리자 - 매칭그룹 채팅방 url 목록 불러오기
	@RequestMapping("adRoomList.rm")
	public String adRoomList(Matching ma, Model model) {
		ArrayList<Matching> adRmList = msn.adRoomList(ma); // 매칭번호
		ArrayList<Room> list = msn.aRoomList(); // 채팅방 링크
		model.addAttribute("adRmList", adRmList);
		model.addAttribute("list", list);
		
		return "room/roomInsertUrl";
	}
	
	// 관리자 - 매칭그룹 채팅방 url 입력하기
	@RequestMapping(value="insertUrl.rm", method=RequestMethod.POST)
	public String insertUrl(Room r, int groupNo, Model model, HttpSession session) {
		r.setRoomNo(groupNo);

		int rs = msn.insertUrl(r);
		
		if(rs > 0) {
			int us = msn.updateUrlS(groupNo);
			if(us > 0) {
				session.setAttribute("alertMsg", "채팅방 링크가 등록되었습니다.");
				return "redirect:adRoomList.rm";
			} else {
				session.setAttribute("alertMsg", "채팅방 url 상태가 변경되지 않았습니다.");
				return "redirect:adRoomList.rm";
			}
		} else {
			session.setAttribute("alertMsg", "채팅방 링크 등록에 실패하였습니다.");
			return "redirect:adRoomList.rm";
		}
	}
}
