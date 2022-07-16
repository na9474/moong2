<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
* {
	text-align: center;;
}

.container-md {
	max-width: 1200px;
}

#myTab {
	background-color: rgb(251, 176, 76);
	border-radius: 7px 7px 7px 7px;
}

#coline1 {
	width: 0px;
}

#coline2 {
	text-align: center;
	padding-top: 25px;
}

button:focus {
  background-color: green;
}


</style>

</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<br>
	<br>
    <div class="container-md p-4 bg-white rounded">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
              <a class="nav-link active" id="approve-tab" data-toggle="tab" href="#approve" role="tab" aria-controls="approve" aria-selected="true">회원승인</a>
            </li>
            <li class="nav-item" role="presentation">
              <a class="nav-link" id="list-tab" data-toggle="tab" href="#list" role="tab" aria-controls="list" aria-selected="false">회원리스트</a>
            </li>
            <li class="nav-item" role="presentation">
              <a class="nav-link" id="report-tab" data-toggle="tab" href="#report" role="tab" aria-controls="report" aria-selected="false">신고리스트</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="qna-tab" data-toggle="tab" href="#qna" role="tab" aria-controls="qna" aria-selected="false">QnA</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="matching-tab" data-toggle="tab" href="#matching" role="tab" aria-controls="matching" aria-selected="false">차트</a>
            </li>
        </ul>
          <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="approve" role="tabpanel" aria-labelledby="approve-tab">
                <br>
                <div class="row applist" id="memlist1">
                    <table class="table table-hover" id="table-line">
                        <tbody>
                          <tr>
                            <th scope="row"></th>
                            <td></td>
                            <td></td>
                            <td id="coline1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="160" height="160" fill="currentColor" class="bi bi-image" viewBox="0 0 16 16">
                                    <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
                                    <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
                                </svg>
                            </td>
                            <td id="coline2">
                                user01<br>
                         	       선생님<br>
                         	       수학<br>
                  	     	       뉴턴<br>
                        	       남<br>
                                28
                            </td>
                            <td id="coline3">
                                <button type="button" class="btn moong-dark">승인</button> <br><br>
                                <button type="button" class="btn btn-danger">취소</button> <br><br>
                                <button type="button" class="btn moong-yellow">상세정보</button>
                            </td>
                          </tr>
                          <tr>
                            <th scope="row"></th>
                            <td></td>
                            <td></td>
                            <td id="coline1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="160" height="160" fill="currentColor" class="bi bi-image" viewBox="0 0 16 16">
                                    <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
                                    <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
                                </svg>
                            </td>
                            <td id="coline2">
                                user01<br>
                              	  선생님<br>
                             	   수학<br>
               	             	    뉴턴<br>
                            	    남<br>
                                28
                            </td>
                            <td id="coline3">
                                <button type="button" class="btn moong-dark">승인</button> <br><br>
                                <button type="button" class="btn btn-danger">취소</button> <br><br>
                                <button type="button" class="btn moong-yellow">상세정보</button>
                            </td>
                          </tr>
                          <tr>
                            <th scope="row"></th>
                            <td></td>
                            <td></td>
                            <td id="coline1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="160" height="160" fill="currentColor" class="bi bi-image" viewBox="0 0 16 16">
                                    <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
                                    <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
                                </svg>
                            </td>
                            <td id="coline2">
                                user01<br>
                               	 선생님<br>
                               	 수학<br>
                              	  뉴턴<br>
                             	   남<br>
                                28
                            </td>
                            <td id="coline3">
                                <button type="button" class="btn moong-dark">승인</button> <br><br>
                                <button type="button" class="btn btn-danger">취소</button> <br><br>
                                <button type="button" class="btn moong-yellow">상세정보</button>
                            </td>
                          </tr>
                          <tr>
                            <th scope="row"></th>
                            <td></td>
                            <td></td>
                            <td id="coline1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="160" height="160" fill="currentColor" class="bi bi-image" viewBox="0 0 16 16">
                                    <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
                                    <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
                                </svg>
                            </td>
                            <td id="coline2">
                                user01<br>
                            	    선생님<br>
                            	    수학<br>
                           	     뉴턴<br>
                           	     남<br>
                                28
                            </td>
                            <td id="coline3">
                                <button type="button" class="btn moong-dark">승인</button> <br><br>
                                <button type="button" class="btn btn-danger">취소</button> <br><br>
                                <button type="button" class="btn moong-yellow">상세정보</button>
                            </td>
                          </tr>
                          <tr>
                            <th scope="row"></th>
                            <td></td>
                            <td></td>
                            <td id="coline1">
                                <svg xmlns="http://www.w3.org/2000/svg" width="160" height="160" fill="currentColor" class="bi bi-image" viewBox="0 0 16 16">
                                    <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
                                    <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
                                </svg>
                            </td>
                            <td id="coline2">
                                user01<br>
                          	      선생님<br>
                         	       수학<br>
                           	     뉴턴<br>
                        	        남<br>
                                28
                            </td>
                            <td id="coline3">
                                <button type="button" class="btn moong-dark">승인</button> <br><br>
                                <button type="button" class="btn btn-danger">취소</button> <br><br>
                                <button type="button" class="btn moong-yellow">상세정보</button>
                            </td>
                          </tr>
                        </tbody>
                    </table>

                </div>
                <br>
                
            </div>
            <div class="tab-pane fade" id="list" role="tabpanel" aria-labelledby="list-tab"></div>
            
            <!-- 신고리스트 페이지 -->
            <div class="tab-pane fade" id="report" role="tabpanel" aria-labelledby="report-tab">
                <br>
                <button id="policeBtn1" type="submit" class="btn moong-dark">게시물</button>
				<button id="policeBtn2" type="submit" class="btn moong-dark">댓글</button>
				<br><br><br>
                  <div class="tab-content" id="pills-tabContent">
                    <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                        <table class="table table-hover" id="table-line">
                            <thead id="tit-line">
                              <tr>
                                <th scope="col">번호</th>
                                <th scope="col">신고자</th>
                                <th scope="col">작성자</th>
                                <th scope="col">날짜</th>
                                <th scope="col">신고사유</th>
                                <th scope="col">조치</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <th scope="row">2</th>
                                <td>피타고라스</td>
                                <td>뉴턴</td>
                                <td>2222-22-22</td>
                                <td>욕설</td>
                                <td>
                                    <button type="button" class="btn moong-yellow btn-sm" style="margin-top:-5px;">해당게시물이동</button>
                                    <button type="button" class="btn moong-yellow btn-sm" style="margin-top:-5px;">삭제</button>
                                </td>
                              </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">2</div>
                  </div>
            </div>
            
            <div class="tab-pane fade" id="qna" role="tabpanel" aria-labelledby="qna-tab">...</div>
            <div class="tab-pane fade" id="matching" role="tabpanel" aria-labelledby="matching-tab">...</div>

            <div style="margin-top:20px; margin-left: 20px;" id="pageNum">
                <button class="btn moong-dark"><</button><button class="btn moong-dark">1</button><button class="btn moong-dark">2</button><button class="btn moong-dark">3</button><button class="btn moong-dark">></button><br>
            </div>

          </div>
          <br><br><br>


    </div>
</body>
</html>