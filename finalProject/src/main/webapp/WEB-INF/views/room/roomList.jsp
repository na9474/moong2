<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅방 | 뭉과외</title>

<link rel="stylesheet" href="${path}/resources/css/roomList.css">
    
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<div id="ir_wrap">
		<div class="title"><h2>채팅방 입장</h2></div>
	    <br><br>
	    <c:choose>
		    <c:when test="${!rmList.isEmpty()}">
		    <div>
		    	<b><span style="color:red;">*</span><span class="rN"> 안내사항 !</span></b><br>
		    	<span class="rN1">
		    		카카오톡 오픈채팅방에서 랜덤매칭된 학생들을 만날 수 있습니다.<br>
		    		카카오톡이 없으면 지금 설치해주세요!
		    	</span>
		    </div>
		    <br><br>
		    <div>${loginUser.userName} 님, 아래의 링크를 눌러 채팅방으로 입장하세요.</div>
			<br>
		    <table align="center">
		    	<thead>
		    		<tr>
		    			<th width="80px;">방번호</th>
		    			<th width="100px;">과목</th>
		    			<th width="420px;">채팅방 링크</th>
		    		</tr>
		    	</thead>
		    	<tbody>
					<c:forEach var="r" items="${rmList}">
			    		<tr>
			    			<td>${r.roomNo}</td>
							<c:choose>
					                    	<c:when test = "${fn:contains(r.subject,'KO')}">
					                    		<td>국어</td>
					                    	</c:when>
					                    	<c:when test = "${fn:contains(r.subject,'MATH')}">
					                    		<td>수학</td>
					                    	</c:when>
					                    	<c:otherwise>
					                    		<td>영어</td>
					                    	</c:otherwise>
				                    	</c:choose>
			    			<td><a href="${r.roomUrl}" id="at">${r.roomUrl}</a></td>
			    		</tr>
		    		</c:forEach>
		    	</tbody>
		    </table>
		    </c:when>
		    
		    <c:otherwise>
		    	<br>
		    	<div id="rNot">
		    		<span id="rNot2">랜덤매칭이 성사된 기록이 없습니다.</span>
		    		<br><br>
		    		채팅방은 <span id="rNot3">랜덤매칭이 성사된 후</span>에 생성됩니다.
		    	</div>
		    </c:otherwise>
	    </c:choose>
    </div>
</body>
</html>