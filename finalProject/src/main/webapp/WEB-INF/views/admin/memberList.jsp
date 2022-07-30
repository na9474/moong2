<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   #alarm-outer{
        margin:auto;
        width: 1000px;
        display: block;
        margin-top:100px;
       
    }
   
    /*영역잡기 끝*/

    /*페이지 제목*/
    #subtit{
            font-size: 35px;
            font-weight: 800;
            margin-top: 50px;
            margin-bottom: 100px;
    }
    /*페이지 제목 끝*/



</style>

</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>
	
	<br><br><br>
	
	<div id="alarm-outer">
        <div id="subtit">
            회원 리스트
        </div>
	<table align="center" class="table table-hover" id="memberTable">
		<thead align="center">
			<tr>
				<th>회원 번호</th>
				<th>이름</th>
				<th>성별</th>
				<th>회원가입일</th>
				<th>유형</th>
				<th>승인</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="m" items="${list }">
				<tr align="center">
					<td>${m.userNo }</td>		
					<td>${m.userName }</td>
					<td>${m.gender }</td>
					<td>${m.enrollDate }</td>

					<c:if test="${m.student eq 'Y' }">
                    <td>학생</td>
                    </c:if>
                    <c:if test="${m.teacher eq 'Y' }">
                    <td>선생님</td>
                    </c:if> 
                    <c:if test="${m.student eq 'N' && m.teacher eq 'N' }">
					<td> - </td>
					</c:if>
					<c:if test="${m.approval eq 'Y' }">
					<td>가입 완료</td>
					</c:if>
					<c:if test="${m.approval eq 'N' }">
					<td>가입 대기 중</td>
					</c:if>
					<c:if test="${m.approval eq 'D' }">
					<td>가입 거절</td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	
	<!-- 페이징 -->
	<div id="pagingArea" style="margin:auto;">
                <ul class="pagination" >
	                <c:choose>
						<c:when test="${ pi.currentPage eq 1 }">
	                    <li class="page-item disabled"><a class="btn moong-dark" href="#"><</a></li>
						</c:when>                
						<c:otherwise>
						<li class="page-item"><a class="btn moong-dark" href="memberList.ad?cpage=${pi.currentPage-1}"><</a></li>
						</c:otherwise>
	                </c:choose>
                
					<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}" step="1">					
                    	<li class="page-item"><a class="btn moong-dark" href="memberList.ad?cpage=${p}">${p}</a></li>
					</c:forEach>
                   
                    <c:choose>
                    	<c:when test="${pi.currentPage eq pi.maxPage }">
		                    <li class="page-item disabled"><a class="btn moong-dark" href="#">></a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="btn moong-dark" href="memberList.ad?cpage=${pi.currentPage+1}">></a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                </ul>
     </div>
	
	
	
	
	
	
	</div>
	
	
	<script>
	$(function(){
		$("#memberTable>tbody>tr").click(function(){
			console.log("성공");
			
			var mType = $(this).children().eq(4).text();

	    	console.log(mType);
			
	    	if(mType == '학생'){
				console.log("학생 선택");
			location.href = 'aStu.ad?uNo=' + $(this).children().eq(0).text() ;
			}
		
			if(mType == '선생님'){
				location.href= 'aTea.ad?uNo=' + $(this).children().eq(0).text();
			}
		
		})
	}) 
	

    
    
    
	</script>
	
	
	
</body>
</html>